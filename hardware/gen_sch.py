#!/usr/bin/env python3
"""Generates the Eagle 9.6.2 schematic of the CAN IO shield for the WeAct STM32F405 core board.
Stock parts are copied from the original Eagle libraries (path given as argv[1]); nets are joined by name
(short stub + label on every pin) instead of long drawn wires."""
import copy, sys, os
import xml.etree.ElementTree as ET

LIBDIR, OUT = sys.argv[1], sys.argv[2]
G = 2.54

# ------------------------------------------------------------------ library handling
stock = {}
def lib(fn):
    if fn not in stock:
        stock[fn] = ET.parse(os.path.join(LIBDIR, fn + ".lbr")).getroot().find("drawing/library")
    return stock[fn]

class OutLib:
    def __init__(self, name, desc):
        self.name, self.desc = name, desc
        self.packages, self.symbols, self.devicesets = {}, {}, {}
    def xml(self):
        e = ET.Element("library", name=self.name)
        ET.SubElement(e, "description").text = self.desc
        for tag, d in (("packages", self.packages), ("symbols", self.symbols), ("devicesets", self.devicesets)):
            s = ET.SubElement(e, tag)
            for k in d:
                s.append(d[k])
        return e

outlibs = {}
def find(parent, tag, name):
    for x in parent.find(tag):
        if x.get("name") == name:
            return x
    raise KeyError("%s %s" % (tag, name))

def use_stock(fn, dsname, variant):
    """Copy deviceset (only the wanted package variant) + its symbols + package into the output."""
    ol = outlibs.setdefault(fn, OutLib(fn, "Parts copied unchanged from the original EAGLE library %s.lbr" % fn))
    src = lib(fn)
    if dsname not in ol.devicesets:
        ds = copy.deepcopy(find(src, "devicesets", dsname))
        devs = ds.find("devices")
        for d in list(devs):
            devs.remove(d)
        ol.devicesets[dsname] = ds
        for g in ds.find("gates"):
            sn = g.get("symbol")
            ol.symbols.setdefault(sn, copy.deepcopy(find(src, "symbols", sn)))
    ds = ol.devicesets[dsname]
    if variant not in [d.get("name") for d in ds.find("devices")]:
        dv = copy.deepcopy([d for d in find(src, "devicesets", dsname).find("devices") if d.get("name") == variant][0])
        ds.find("devices").append(dv)
        pk = dv.get("package")
        if pk:
            ol.packages.setdefault(pk, copy.deepcopy(find(src, "packages", pk)))
    return ol

# ------------------------------------------------------------------ custom library (ICs not in the stock libraries)
CL = outlibs.setdefault("canio", OutLib("canio", "Symbols drawn for this project. Packages are copied from the original EAGLE libraries."))

import re
FPDIR = sys.argv[3]
def kicad_pkg(fn, name, desc):
    """Convert a KiCad footprint (pads, holes, fab outline) to an Eagle package. KiCad Y points down, Eagle Y up."""
    t = open(os.path.join(FPDIR, fn)).read()
    p = ET.Element("package", name=name)
    ET.SubElement(p, "description").text = desc
    xs, ys = [], []
    for num, typ, shape, x, y, sx, sy, dr in re.findall(
            r'\(pad "?([^" ]*)"? (\w+) (\w+) \(at ([-\d.]+) ([-\d.]+)[^)]*\) \(size ([\d.]+) ([\d.]+)\)(?: \(drill ([\d.]+)\))?', t):
        x, y = float(x), -float(y)
        if typ == "np_thru_hole":
            ET.SubElement(p, "hole", x=str(x), y=str(y), drill=dr)
        elif typ == "thru_hole":
            e = ET.SubElement(p, "pad", name=num, x=str(x), y=str(y), drill=dr, diameter=sx)
            if num == "1":
                e.set("shape", "square")
        elif typ == "smd" and num:
            ET.SubElement(p, "smd", name=num, x=str(x), y=str(y), dx=sx, dy=sy, layer="1")
        else:
            continue
        xs += [x - float(sx) / 2, x + float(sx) / 2]; ys += [y - float(sy) / 2, y + float(sy) / 2]
    m = re.search(r'\(fp_rect \(start ([-\d.]+) ([-\d.]+)\) \(end ([-\d.]+) ([-\d.]+)\)[^\n]*F\.Fab', t)
    if m:
        x0, y0, x1, y1 = float(m.group(1)), -float(m.group(2)), float(m.group(3)), -float(m.group(4))
    else:
        x0, x1, y0, y1 = min(xs) - 0.3, max(xs) + 0.3, max(ys) + 0.3, min(ys) - 0.3
    for a, b, c, d in ((x0, y0, x1, y0), (x1, y0, x1, y1), (x1, y1, x0, y1), (x0, y1, x0, y0)):
        ET.SubElement(p, "wire", x1=str(a), y1=str(b), x2=str(c), y2=str(d), width="0.127", layer="51")
    ET.SubElement(p, "text", x=str(x0), y=str(max(y0, y1) + 0.6), size="1.27", layer="25").text = ">NAME"
    ET.SubElement(p, "text", x=str(x0), y=str(min(y0, y1) - 1.9), size="1.27", layer="27").text = ">VALUE"
    return p

def custom(name, prefix, left, right, pkg=None, pkgsrc=None, value=None, pkgel=None):
    """left/right: list of (pin name, pad or None). Box symbol, pins on a 2.54 mm grid."""
    rows = max(len(left), len(right))
    top = (rows - 1) * G / 2.0
    top = round(top / G) * G
    hw = 10.16
    s = ET.Element("symbol", name=name)
    y0, y1 = top + G, top - (rows - 1) * G - G
    for a, b, c, d in ((-hw, y0, hw, y0), (hw, y0, hw, y1), (hw, y1, -hw, y1), (-hw, y1, -hw, y0)):
        ET.SubElement(s, "wire", x1=str(a), y1=str(b), x2=str(c), y2=str(d), width="0.254", layer="94")
    ET.SubElement(s, "text", x=str(-hw), y=str(y0 + 1.27), size="1.778", layer="95").text = ">NAME"
    ET.SubElement(s, "text", x=str(-hw), y=str(y1 - 3.0), size="1.778", layer="96").text = ">VALUE"
    conns = []
    for i, (pn, pad) in enumerate(left):
        ET.SubElement(s, "pin", name=pn, x=str(-hw - 5.08), y=str(top - i * G), length="middle")
        conns.append((pn, pad))
    for i, (pn, pad) in enumerate(right):
        ET.SubElement(s, "pin", name=pn, x=str(hw + 5.08), y=str(top - i * G), length="middle", rot="R180")
        conns.append((pn, pad))
    CL.symbols[name] = s
    ds = ET.Element("deviceset", name=name, prefix=prefix, uservalue="yes")
    ET.SubElement(ds, "description").text = value or name
    gs = ET.SubElement(ds, "gates")
    ET.SubElement(gs, "gate", name="G$1", symbol=name, x="0", y="0")
    dv = ET.SubElement(ET.SubElement(ds, "devices"), "device", name="")
    if pkg:
        dv.set("package", pkg)
        p = pkgel if pkgel is not None else copy.deepcopy(find(lib(pkgsrc), "packages", pkg))
        pads = {x.get("name") for x in p if x.tag in ("smd", "pad")}
        CL.packages.setdefault(pkg, p)
        cs = ET.SubElement(dv, "connects")
        for pn, pad in conns:
            if pad:
                for q in pad.split():
                    assert q in pads, (name, q, sorted(pads))
                ET.SubElement(cs, "connect", gate="G$1", pin=pn, pad=pad)
    ET.SubElement(ET.SubElement(dv, "technologies"), "technology", name="")
    CL.devicesets[name] = ds

custom("AD8497", "U", [("+IN", "8"), ("-IN", "1"), ("REF", "2"), ("-VS", "3")],
       [("+VS", "7"), ("OUT", "6"), ("SENSE", "5")], "MSOP08", "analog-devices", "AD8497ARMZ thermocouple amplifier (MSOP-8)")
custom("TJA1051T3", "U", [("TXD", "1"), ("RXD", "4"), ("S", "8"), ("GND", "2")],
       [("VCC", "3"), ("VIO", "5"), ("CANH", "7"), ("CANL", "6")], "SO08", "linear", "TJA1051T/3 CAN transceiver with VIO (SO-8)")
custom("NCV8402", "Q", [("IN", "1")], [("DRAIN", "2 4"), ("SOURCE", "3")], "SOT223", "transistor",
       "NCV8402 / BSP75N self-protected low side switch (SOT-223)")
custom("TLV9004", "U", [("+INA", "3"), ("-INA", "2"), ("+INB", "5"), ("-INB", "6"), ("+INC", "10"), ("-INC", "9"), ("+IND", "12"), ("-IND", "13")],
       [("V+", "4"), ("OUTA", "1"), ("OUTB", "7"), ("OUTC", "8"), ("OUTD", "14"), ("V-", "11")], "SO14", "linear",
       "TLV9004 / MCP6004 quad rail-to-rail op-amp, SO-14, LM324 pinout")
custom("PFET-SO8", "Q", [("G", "4")], [("D", "5 6 7 8"), ("S", "1 2 3")], "SO08", "linear",
       "P-channel MOSFET in SO-8 (standard single-FET pinout), -30 V / 10 A class, e.g. AO4407A or IRF7416")
custom("NUP2105L", "D", [("CANH", "1"), ("CANL", "2")], [("GND", "3")], "SOT23", "diode",
       "NUP2105L / PESD1CAN dual CAN bus TVS, SOT-23")
DSO12 = kicad_pkg("Infineon_PG-DSO-12-11.kicad_mod", "PG-DSO-12-11",
                  "Infineon PG-DSO-12-11, exposed pad 4.5 x 8.1 mm. Converted from the KiCad library footprint Infineon_PG-DSO-12-11.")
custom("TLE9201SG", "U", [("PWM", "12"), ("DIR", "1"), ("DIS", "11"), ("CSN", "9"), ("SCK", "10"), ("SI", "8"), ("SO", "3")],
       [("VS", "4"), ("VSO", "2"), ("OUT1", "5"), ("OUT2", "7"), ("GND", "6 13")], "PG-DSO-12-11", None,
       "TLE9201SG 6 A H-bridge (PG-DSO-12-11, exposed pad = GND)", pkgel=DSO12)
SICPINS = ["%s%d" % (r, i) for r in "ABC" for i in range(1, 9)]
for colour, fn in (("BLACK", "sicma_black.kicad_mod"), ("GREY", "sicma_grey.kicad_mod")):
    pk = kicad_pkg(fn, "SICMA24-" + colour,
                   "Aptiv / Delphi Sicma 24-way right angle header (%s). Hole pattern converted from the Speeduino kicad-parts footprint "
                   "Delphi_Sicma_24_%s. Pins 1 and 8 of each row are the wider-spaced positions." % (colour.lower(), colour.capitalize()))
    custom("SICMA24-" + colour, "J", [(p, p) for p in SICPINS[:12]], [(p, p) for p in SICPINS[12:]], "SICMA24-" + colour, None,
           "Aptiv Sicma 24-way header HCCPHPE24 (%s), rows A/B/C x 8" % colour.lower(), pkgel=pk)

# ------------------------------------------------------------------ part catalogue
CAT = {  # key: (library, deviceset, variant)
    "R": ("rcl", "R-EU_", "R0603"), "C": ("rcl", "C-EU", "C0603"), "CE": ("rcl", "CPOL-EU", "153CLV-0810"),
    "L": ("rcl", "L-EU", "CEP125"), "D": ("diode", "MBRA340T3", ""), "TVS": ("diode", "SUPPRESSOR-", "SMBJ"),
    "DD": ("diode", "BAT54S", ""), "SJ": ("jumper", "SJ", ""), "LED": ("led", "LED", "CHIPLED_0603"),
    "REG": ("linear", "LM2596S", ""), "HS": ("infineon", "BTS428L2", ""),
    "H24": ("pinhead", "PINHD-2X12", ""), "H6": ("pinhead", "PINHD-2X3", ""),
    "JA": ("canio", "SICMA24-BLACK", ""), "JB": ("canio", "SICMA24-GREY", ""),
    "OPA": ("canio", "TLV9004", ""), "PFET": ("canio", "PFET-SO8", ""), "CTVS": ("canio", "NUP2105L", ""),
    "ZD": ("diode", "ZENER-DIODE", "SOT23"), "PTC": ("rcl", "R-EU_", "R1206"), "C8": ("rcl", "C-EU", "C0805"),
    "EGT": ("canio", "AD8497", ""), "CAN": ("canio", "TJA1051T3", ""), "LS": ("canio", "NCV8402", ""), "HB": ("canio", "TLE9201SG", ""),
}
PREFIX = {"OPA": "U", "PFET": "Q", "CTVS": "D", "ZD": "D", "PTC": "F", "C8": "C", "R": "R", "C": "C", "CE": "C", "L": "L", "D": "D", "TVS": "D", "DD": "D", "SJ": "SJ", "LED": "LED", "REG": "U", "HS": "U",
          "H24": "P", "H6": "P", "JA": "J", "JB": "J", "EGT": "U", "CAN": "U", "LS": "Q", "HB": "U"}
for k, (l, d, v) in CAT.items():
    if l != "canio":
        use_stock(l, d, v)

def gate_pins(key):
    l, d, v = CAT[key]
    ds = outlibs[l].devicesets[d]
    g = ds.find("gates")[0]
    sym = outlibs[l].symbols[g.get("symbol")]
    return g.get("name"), {p.get("name"): (float(p.get("x")), float(p.get("y")), p.get("rot", "R0")) for p in sym if p.tag == "pin"}

ROT = {"R0": 0, "R90": 1, "R180": 2, "R270": 3}
def rot_pt(x, y, k):
    for _ in range(k):
        x, y = -y, x
    return x, y

# ------------------------------------------------------------------ schematic model
parts, counters, BLOCKS = [], {}, {}
nets = {}      # name -> list of (sheet, part, gate, pin, x1, y1, x2, y2, labelrot)
used_pins = {}

class Sheet:
    def __init__(self, title):
        self.title, self.inst, self.texts = title, [], []
        self.x, self.rowtop, self.rowbottom, self.y = 0.0, 0.0, 0.0, 0.0
        self.texts.append((0, 10.16, 3.81, title))
    def newrow(self):
        self.x, self.rowtop = 0.0, self.rowbottom - 20.32
        self.y = self.rowtop
    def block(self, title, width=66.04):
        if self.inst or len(self.texts) > 1:
            if self.y != self.rowtop:
                self.x += self.bw
        self.bw = width
        self.y = self.rowtop
        self.texts.append((self.x - 12.7, self.y + 2.54, 2.54, title))
        self.cur = BLOCKS.setdefault(title, [])
        self.y -= 5.08
    def add(self, key, value, conn, name=None):
        l, d, v = CAT[key]
        gate, pins = gate_pins(key)
        for p in conn:
            assert p in pins, (key, p, sorted(pins))
        k = 0
        if len(pins) == 2 and all(r in ("R90", "R270") for _, _, r in pins.values()):
            k = 1
        tp = {n: rot_pt(x, y, k) + ((ROT[r] + k) % 4,) for n, (x, y, r) in pins.items()}
        ys = [p[1] for p in tp.values()]
        top, bot = max(ys) + 5.08, min(ys) - 5.08
        cy = round((self.y - top) / G) * G
        cx = round(self.x / G) * G
        if not name:
            pf = PREFIX[key]
            counters[pf] = counters.get(pf, 0) + 1
            name = "%s%d" % (pf, counters[pf])
        parts.append((name, l, d, v, value))
        self.cur.append(name)
        self.inst.append((name, gate, cx, cy, k))
        for p, net in conn.items():
            if net is None:
                continue
            px, py, r = tp[p]
            dx, dy = [(-1, 0), (0, -1), (1, 0), (0, 1)][r]
            x1, y1 = cx + px, cy + py
            nets.setdefault(net, []).append((self, name, gate, p, x1, y1, x1 + dx * G, y1 + dy * G, ["R180", "R270", "R0", "R90"][r]))
        used_pins[name] = (set(pins), set(p for p, n in conn.items() if n))
        self.y = cy + bot
        self.rowbottom = min(self.rowbottom, self.y)
        return name

# ------------------------------------------------------------------ net names
EGT_PIN = ["PA0", "PA1", "PA2", "PA3"]
AN_PIN = ["PA6", "PA7", "PC0", "PC1", "PC2", "PC3", "PC4", "PC5"]
FQ_PIN = ["PA15", "PB3", "PB10", "PB11", "PA8"]
DI_PIN = ["PC13", "PD2", "PB12", "PB4"]
OUT_PIN = ["PC6", "PC7", "PC8", "PC9", "PB6", "PB7", "PB5", "PA9", "PA10", "PC12"]
MCU = {}
for i, p in enumerate(EGT_PIN): MCU[p] = "EGT%d_%s" % (i + 1, p)
for i, p in enumerate(AN_PIN): MCU[p] = "AN%d_%s" % (i + 1, p)
for i, p in enumerate(FQ_PIN): MCU[p] = "FREQ%d_%s" % (i + 1, p)
for i, p in enumerate(DI_PIN): MCU[p] = "DI%d_%s" % (i + 1, p)
for i, p in enumerate(OUT_PIN): MCU[p] = ("PWM%d_%s" if i < 6 else "OUT%d_%s") % (i + 1, p)
MCU.update({"PB0": "V5MON_PB0", "PB1": "VBATMON_PB1", "PB14": "HB_PWM_PB14", "PB15": "HB_DIR_PB15", "PB13": "HB_DIS_PB13",
            "PB8": "CAN_RX_PB8", "PB9": "CAN_TX_PB9"})
GND, V5, V33, VS5, VBAT, VPROT = "GND", "+5V", "+3V3", "5V_SENS", "VBAT", "VBAT_PROT"

# ================================================================== SHEET 1: power, MCU, CAN, actuator, outputs, connector
s1 = Sheet("CAN IO SHIELD FOR WEACT STM32F405 - SHEET 1: POWER, MCU HEADERS, CAN, H-BRIDGE, OUTPUTS, CONNECTOR")
s1.rowtop = s1.rowbottom = s1.y = 0

s1.block("POWER INPUT (fit an external fuse)")
s1.add("TVS", "SMBJ24A", {"A": GND, "C": VBAT})
s1.add("D", "MBRA340T3", {"A": VBAT, "C": VPROT})
s1.add("CE", "220u/35V", {"+": VPROT, "-": GND})
s1.add("C", "100n/50V", {"1": VPROT, "2": GND})
s1.block("5 V BUCK (LM2596S-5.0)")
s1.add("REG", "LM2596S-5.0", {"IN": VPROT, "OUT": "BUCK_SW", "FB": V5, "EN": GND, "GND": GND, "GND@1": GND})
s1.add("D", "MBRA340T3", {"A": GND, "C": "BUCK_SW"})
s1.add("L", "33u/3A", {"1": "BUCK_SW", "2": V5})
s1.add("CE", "220u/16V", {"+": V5, "-": GND})
s1.add("C", "100n", {"1": V5, "2": GND})
s1.block("5 V DISTRIBUTION")
s1.add("D", "MBRA340T3", {"A": V5, "C": "VCC_MCU"})
s1.add("PTC", "PTC 0.2A 1206", {"1": V5, "2": VS5})
s1.add("C", "100n", {"1": VS5, "2": GND})
s1.add("R", "1k", {"1": V5, "2": "LED_PWR"})
s1.add("LED", "GREEN", {"A": "LED_PWR", "C": GND})
s1.add("C8", "10u/16V X7R", {"1": "VCC_MCU", "2": GND})
s1.block("REVERSE BATTERY PROTECTION (feeds the H-bridge)")
s1.add("PFET", "AO4407A", {"D": VBAT, "S": "VBAT_SW", "G": "RP_GATE"})
s1.add("ZD", "BZX84C12", {"A": "RP_GATE", "C": "VBAT_SW"})
s1.add("R", "10k", {"1": "RP_GATE", "2": GND})
s1.block("SUPPLY MONITORS")
s1.add("R", "56k", {"1": VPROT, "2": MCU["PB1"]})
s1.add("R", "10k", {"1": MCU["PB1"], "2": GND})
s1.add("C", "100n", {"1": MCU["PB1"], "2": GND})
s1.add("R", "10k", {"1": VS5, "2": MCU["PB0"]})
s1.add("R", "10k", {"1": MCU["PB0"], "2": GND})
s1.add("C", "100n", {"1": MCU["PB0"], "2": GND})

P1 = [None, GND, None, "PC13", "PC0", None, "PC2", "PC1", "PA0", "PC3", "PA2", "PA1", "PA4", "PA3", "PA6", "PA5", "PC4", "PA7", "PB0", "PC5", None, "PB1", "PB11", "PB10"]
P2 = ["PB9", GND, "PB7", "PB8", "PB5", "PB6", "PB3", "PB4", "PC12", "PD2", "PC10", "PC11", None, "PA15", "PA10", None, "PA8", "PA9", "PC8", "PC9", "PC6", "PC7", "PB14", "PB15"]
def hdr(lst):
    return {str(i + 1): (GND if n == GND else MCU.get(n)) for i, n in enumerate(lst)}
s1.block("WEACT HEADER P1 + P3 (left side)")
s1.add("H24", "WEACT P1", hdr(P1), name="P1")
s1.add("H6", "WEACT P3", {"1": V33, "3": V33, "5": V33, "2": GND, "4": GND, "6": GND}, name="P3")
s1.block("WEACT HEADER P2 + P4 (right side)")
s1.add("H24", "WEACT P2", hdr(P2), name="P2")
s1.add("H6", "WEACT P4", {"1": MCU["PB12"], "2": MCU["PB13"], "3": "VCC_MCU", "4": "VCC_MCU", "5": GND, "6": GND}, name="P4")

s1.newrow()
s1.block("CAN TRANSCEIVER")
s1.add("CAN", "TJA1051T/3", {"TXD": MCU["PB9"], "RXD": MCU["PB8"], "S": GND, "GND": GND, "VCC": V5, "VIO": V33, "CANH": "CAN_H", "CANL": "CAN_L"})
s1.add("C", "100n", {"1": V5, "2": GND})
s1.add("C", "100n", {"1": V33, "2": GND})
s1.add("R", "60R4", {"1": "CAN_H", "2": "CAN_MID"})
s1.add("R", "60R4", {"1": "CAN_MID", "2": "CAN_TERM"})
s1.add("C", "4n7/50V", {"1": "CAN_MID", "2": GND})
s1.add("SJ", "TERMINATION", {"1": "CAN_TERM", "2": "CAN_L"})
s1.add("CTVS", "NUP2105L", {"CANH": "CAN_H", "CANL": "CAN_L", "GND": GND})
s1.block("H-BRIDGE (wastegate / bypass actuator)")
s1.add("HB", "TLE9201SG", {"PWM": MCU["PB14"], "DIR": MCU["PB15"], "DIS": MCU["PB13"], "CSN": "HB_CSN", "SCK": GND, "SI": GND,
                           "VS": "VBAT_SW", "VSO": V33, "OUT1": "MOT_A", "OUT2": "MOT_B", "GND": GND})
s1.add("R", "10k", {"1": V33, "2": "HB_CSN"})
s1.add("R", "10k", {"1": V33, "2": MCU["PB13"]})
s1.add("C", "100n", {"1": V33, "2": GND})
s1.add("C", "100n/50V", {"1": "VBAT_SW", "2": GND})
s1.add("CE", "220u/35V", {"+": "VBAT_SW", "-": GND})
s1.add("C", "10n/50V", {"1": "MOT_A", "2": GND})
s1.add("C", "10n/50V", {"1": "MOT_B", "2": GND})
for i in range(6):
    s1.block("LOW SIDE PWM%d" % (i + 1), 55.88)
    n = MCU[OUT_PIN[i]]
    s1.add("R", "1k", {"1": n, "2": "LS%d_G" % (i + 1)})
    s1.add("R", "100k", {"1": "LS%d_G" % (i + 1), "2": GND})
    s1.add("LS", "NCV8402", {"IN": "LS%d_G" % (i + 1), "DRAIN": "LS%d" % (i + 1), "SOURCE": GND})
s1.newrow()
for i in range(6, 10):
    s1.block("HIGH SIDE OUT%d" % (i + 1), 60.96)
    n = MCU[OUT_PIN[i]]
    s1.add("R", "4k7", {"1": n, "2": "HS%d_IN" % (i + 1)})
    s1.add("R", "100k", {"1": n, "2": GND})
    s1.add("HS", "BTS428L2", {"IN": "HS%d_IN" % (i + 1), "VBB": VBAT, "OUT": "HS%d" % (i + 1), "GND": "HS%d_GND" % (i + 1)})
    s1.add("R", "150R", {"1": "HS%d_GND" % (i + 1), "2": GND})
CONA = {"A1": VBAT, "A8": VBAT, "B1": GND, "B8": GND, "C1": "MOT_A", "C8": "MOT_B", "C7": GND, "B6": "CAN_H", "B7": "CAN_L"}
CONA.update({"A%d" % (i + 1): "LS%d" % i for i in range(1, 7)})
CONA.update({"B%d" % (i - 5): "HS%d" % i for i in range(7, 11)})
CONA.update({"C%d" % (i + 1): "FREQ%d_IN" % i for i in range(1, 6)})
CONB = {"A1": VS5, "A8": VS5, "B1": GND, "B8": GND, "C1": "DI1_IN", "C8": "DI2_IN", "B4": "DI3_IN", "B5": "DI4_IN",
        "B2": "AN7_IN", "B3": "AN8_IN", "B6": "EGT4_P", "B7": "EGT4_N"}
CONB.update({"A%d" % (i + 1): "AN%d_IN" % i for i in range(1, 7)})
for i in range(1, 4):
    CONB["C%d" % (2 * i)] = "EGT%d_P" % i
    CONB["C%d" % (2 * i + 1)] = "EGT%d_N" % i
assert len(CONA) == 24 and len(CONB) == 24
s1.block("CONNECTOR A - BLACK - POWER, OUTPUTS, CAN, FREQUENCY", 71.12)
s1.add("JA", "HCCPHPE24BKA90F", CONA, name="J1")
s1.block("CONNECTOR B - GREY - SENSORS", 71.12)
s1.add("JB", "HCCPHPE24GYB90F", CONB, name="J2")

# ================================================================== SHEET 2: inputs
s2 = Sheet("CAN IO SHIELD FOR WEACT STM32F405 - SHEET 2: ANALOG, EGT, FREQUENCY AND DIGITAL INPUTS")
s2.rowtop = s2.rowbottom = s2.y = 0
for i in range(8):
    s2.block("ANALOG AN%d" % (i + 1), 55.88)
    a, m, n = "AN%d_IN" % (i + 1), MCU[AN_PIN[i]], i + 1
    s2.add("SJ", "NTC PULL-UP", {"1": VS5, "2": "AN%d_PU" % n})
    s2.add("R", "2k49", {"1": "AN%d_PU" % n, "2": a})
    s2.add("R", "100k", {"1": a, "2": "AN%d_DIV" % n})
    s2.add("R", "180k", {"1": "AN%d_DIV" % n, "2": GND})
    s2.add("DD", "BAV99", {"A1": GND, "C1A2": "AN%d_DIV" % n, "C2": V33})
    s2.add("C", "1n", {"1": "AN%d_DIV" % n, "2": GND})
    s2.add("R", "1k", {"1": "AN%d_BUF" % n, "2": m})
    s2.add("C", "100n", {"1": m, "2": GND})
s2.newrow()
s2.block("ANALOG BUFFERS (TLV9004, supplied from +5V)")
for k in (0, 1):
    c = {"V+": V5, "V-": GND}
    for j, g in enumerate("ABCD"):
        n = 4 * k + j + 1
        c["+IN" + g] = "AN%d_DIV" % n
        c["-IN" + g] = "AN%d_BUF" % n
        c["OUT" + g] = "AN%d_BUF" % n
    s2.add("OPA", "TLV9004IDR", c)
    s2.add("C", "100n", {"1": V5, "2": GND})
s2.newrow()
for i in range(4):
    s2.block("EGT%d (K thermocouple)" % (i + 1), 66.04)
    p, n, m = "EGT%d_P" % (i + 1), "EGT%d_N" % (i + 1), MCU[EGT_PIN[i]]
    s2.add("R", "100R", {"1": p, "2": "EGT%d_INP" % (i + 1)})
    s2.add("R", "100R", {"1": n, "2": "EGT%d_INN" % (i + 1)})
    s2.add("C", "10n", {"1": "EGT%d_INP" % (i + 1), "2": GND})
    s2.add("C", "10n", {"1": "EGT%d_INN" % (i + 1), "2": GND})
    s2.add("R", "1M", {"1": "EGT%d_INN" % (i + 1), "2": "EGT%d_REF" % (i + 1)})
    s2.add("SJ", "FLOATING PROBE", {"1": "EGT%d_REF" % (i + 1), "2": GND})
    s2.add("EGT", "AD8497ARMZ", {"+IN": "EGT%d_INP" % (i + 1), "-IN": "EGT%d_INN" % (i + 1), "REF": GND, "-VS": GND,
                                 "+VS": V5, "OUT": "EGT%d_OUT" % (i + 1), "SENSE": "EGT%d_OUT" % (i + 1)})
    s2.add("C", "100n", {"1": V5, "2": GND})
    s2.add("R", "10k", {"1": "EGT%d_OUT" % (i + 1), "2": m})
    s2.add("R", "18k", {"1": m, "2": GND})
    s2.add("C", "100n", {"1": m, "2": GND})
s2.newrow()
for i in range(5):
    s2.block("FREQUENCY / DIGITAL SENSOR FREQ%d" % (i + 1), 60.96)
    a, m = "FREQ%d_IN" % (i + 1), MCU[FQ_PIN[i]]
    s2.add("SJ", "PULL-UP", {"1": VS5, "2": "FREQ%d_PU" % (i + 1)})
    s2.add("R", "4k7", {"1": "FREQ%d_PU" % (i + 1), "2": a})
    s2.add("R", "2k2", {"1": a, "2": m})
    s2.add("DD", "BAT54S", {"A1": GND, "C1A2": m, "C2": V33})
    s2.add("C", "47p", {"1": m, "2": GND})
s2.newrow()
for i in range(4):
    s2.block("DIGITAL INPUT DI%d" % (i + 1), 60.96)
    a, m = "DI%d_IN" % (i + 1), MCU[DI_PIN[i]]
    s2.add("SJ", "PULL-UP", {"1": V5, "2": "DI%d_PU" % (i + 1)})
    s2.add("R", "4k7", {"1": "DI%d_PU" % (i + 1), "2": a})
    s2.add("R", "10k", {"1": a, "2": m})
    s2.add("DD", "BAT54S", {"A1": GND, "C1A2": m, "C2": V33})
    s2.add("C", "100n", {"1": m, "2": GND})

sheets = [s1, s2]

# ------------------------------------------------------------------ checks
single = sorted(n for n, segs in nets.items() if len(segs) < 2)
assert not single, single
for h in MCU.values():
    assert len(nets.get(h, [])) >= 2, h
names = [p[0] for p in parts]
assert len(names) == len(set(names))
pos = set()
for s in sheets:
    for n, g, x, y, k in s.inst:
        assert (id(s), x, y) not in pos
        pos.add((id(s), x, y))

# ------------------------------------------------------------------ emit
root = ET.Element("eagle", version="9.6.2")
dr = ET.SubElement(root, "drawing")
st = ET.SubElement(dr, "settings")
ET.SubElement(st, "setting", alwaysvectorfont="no")
ET.SubElement(st, "setting", verticaltext="up")
ET.SubElement(dr, "grid", distance="0.1", unitdist="inch", unit="inch", style="lines", multiple="1", display="no",
              altdistance="0.01", altunitdist="inch", altunit="inch")
src_root = ET.parse(os.path.join(LIBDIR, "rcl.lbr")).getroot()
dr.append(copy.deepcopy(src_root.find("drawing/layers")))
sch = ET.SubElement(dr, "schematic", xreflabel="%F%N/%S.%C%R", xrefpart="/%S.%C%R")
ls = ET.SubElement(sch, "libraries")
for k in outlibs:
    ls.append(outlibs[k].xml())
ET.SubElement(sch, "attributes")
ET.SubElement(sch, "variantdefs")
cl = ET.SubElement(sch, "classes")
ET.SubElement(cl, "class", number="0", name="default", width="0.25", drill="0.3")
ET.SubElement(cl, "class", number="1", name="power", width="1.5", drill="0.6")
ET.SubElement(cl, "class", number="2", name="medium", width="0.8", drill="0.4")
NETCLASS = {n: "1" for n in [GND, VBAT, VPROT, "VBAT_SW", "BUCK_SW", "MOT_A", "MOT_B"] + ["HS%d" % i for i in range(7, 11)]}
NETCLASS.update({n: "2" for n in [V5, V33, VS5, "VCC_MCU"] + ["LS%d" % i for i in range(1, 7)]})
ps = ET.SubElement(sch, "parts")
for n, l, d, v, val in parts:
    e = ET.SubElement(ps, "part", name=n, library=l, deviceset=d, device=v)
    if val:
        e.set("value", val)
shs = ET.SubElement(sch, "sheets")
f = lambda v: ("%.2f" % v).rstrip("0").rstrip(".") if "." in ("%.2f" % v) else "%.2f" % v
for s in sheets:
    sh = ET.SubElement(shs, "sheet")
    ET.SubElement(sh, "description").text = s.title
    pl = ET.SubElement(sh, "plain")
    for x, y, size, t in s.texts:
        ET.SubElement(pl, "text", x=f(x), y=f(y), size=f(size), layer="97").text = t
    ins = ET.SubElement(sh, "instances")
    for n, g, x, y, k in s.inst:
        e = ET.SubElement(ins, "instance", part=n, gate=g, x=f(x), y=f(y))
        if k:
            e.set("rot", "R%d" % (90 * k))
    ET.SubElement(sh, "busses")
    ne = ET.SubElement(sh, "nets")
    for net in sorted(nets):
        segs = [x for x in nets[net] if x[0] is s]
        if not segs:
            continue
        e = ET.SubElement(ne, "net", name=net, **{"class": NETCLASS.get(net, "0")})
        for _, part, gate, pin, x1, y1, x2, y2, lr in segs:
            sg = ET.SubElement(e, "segment")
            ET.SubElement(sg, "pinref", part=part, gate=gate, pin=pin)
            ET.SubElement(sg, "wire", x1=f(x1), y1=f(y1), x2=f(x2), y2=f(y2), width="0.1524", layer="91")
            lb = ET.SubElement(sg, "label", x=f(x2), y=f(y2), size="1.27", layer="95")
            if lr != "R0":
                lb.set("rot", lr)
ET.indent(root, space="")
body = ET.tostring(root, encoding="unicode")
open(OUT, "w", encoding="utf-8").write('<?xml version="1.0" encoding="utf-8"?>\n<!DOCTYPE eagle SYSTEM "eagle.dtd">\n' + body + "\n")

unconn = {n: sorted(a - b) for n, (a, b) in used_pins.items() if a - b}
print("parts", len(parts), "nets", len(nets), "pins connected", sum(len(v) for v in nets.values()))
print("libraries", {k: (len(v.devicesets), len(v.packages)) for k, v in outlibs.items()})
print("unconnected pins:", unconn)
for s in sheets:
    xs = [i[2] for i in s.inst]; ys = [i[3] for i in s.inst]
    print("sheet extents mm", round(max(xs) - min(xs)), round(max(ys) - min(ys)))


# ================================================================== BOARD PLACEMENT SCRIPT
# Board outline, mounting holes and connector positions are taken from the Speeduino Dropbear V2 board (same enclosure).
import math
DB = open(os.path.join(FPDIR, "db.kicad_pcb")).read()
OX, OY, BW, BH = 158.496, 123.0, 116.08, 98.0
def e(x, y):
    return round(float(x) - OX, 3), round(OY - float(y), 3)
OUTLINE, HOLES = [], []
for m in re.finditer(r'\(gr_(line|arc|circle)\b((?:(?!\(gr_|\(footprint|\(segment).)*?)\(layer "?Edge\.Cuts"?\)', DB, re.S):
    kind, body = m.group(1), m.group(2)
    pts = {k: e(x, y) for k, x, y in re.findall(r'\((start|mid|end|center) ([-\d.]+) ([-\d.]+)\)', body)}
    if kind == "line":
        OUTLINE.append("WIRE 0.1 (%g %g) (%g %g);" % (pts["start"] + pts["end"]))
    elif kind == "circle":
        HOLES.append((pts["center"][0], pts["center"][1], round(2 * math.hypot(pts["end"][0] - pts["center"][0], pts["end"][1] - pts["center"][1]), 2)))
    else:
        (x1, y1), (x2, y2), (x3, y3) = pts["start"], pts["mid"], pts["end"]
        d = 2 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))
        cx = ((x1 ** 2 + y1 ** 2) * (y2 - y3) + (x2 ** 2 + y2 ** 2) * (y3 - y1) + (x3 ** 2 + y3 ** 2) * (y1 - y2)) / d
        cy = ((x1 ** 2 + y1 ** 2) * (x3 - x2) + (x2 ** 2 + y2 ** 2) * (x1 - x3) + (x3 ** 2 + y3 ** 2) * (x2 - x1)) / d
        a1, a3 = math.atan2(y1 - cy, x1 - cx), math.atan2(y3 - cy, x3 - cx)
        ccw = ((x2 - x1) * (y3 - y2) - (y2 - y1) * (x3 - x2)) > 0
        sweep = math.degrees(a3 - a1) % 360
        if not ccw:
            sweep -= 360
        OUTLINE.append("WIRE 0.1 (%g %g) %+.1f (%g %g);" % (x1, y1, sweep, x3, y3))

def _ends(ln):
    c = [float(v) for pair in re.findall(r'\(([-\d.]+) ([-\d.]+)\)', ln) for v in pair]
    return (c[0], c[1]), (c[2], c[3])
_inside = lambda p: 91.5 < p[0] < 116.5 and 21.0 < p[1] < 47.5
_kept = [ln for ln in OUTLINE if not all(_inside(p) for p in _ends(ln))]
_removed = len(OUTLINE) - len(_kept)
_dangling = [p for ln in _kept for p in _ends(ln) if _inside(p)]
assert len(_dangling) == 2, _dangling
OUTLINE = _kept + ["WIRE 0.1 (%g %g) (%g %g);" % (_dangling[0] + _dangling[1])]
print("cut-out primitives removed:", _removed, "closed between", _dangling)

PKG = {}
for n, l, d, v, val in parts:
    dv = [x for x in outlibs[l].devicesets[d].find("devices") if x.get("name") == v][0]
    PKG[n] = outlibs[l].packages[dv.get("package")]

def rxy(x, y, k):
    for _ in range(k):
        x, y = -y, x
    return x, y

def bbox(name, k):
    xs, ys = [], []
    for el in PKG[name]:
        if el.tag == "smd":
            hx, hy = float(el.get("dx")) / 2, float(el.get("dy")) / 2
            if el.get("rot", "R0") in ("R90", "R270"):
                hx, hy = hy, hx
            pts = [(float(el.get("x")) + a, float(el.get("y")) + b) for a in (-hx, hx) for b in (-hy, hy)]
        elif el.tag == "pad":
            r = float(el.get("diameter") or float(el.get("drill")) * 1.8) / 2
            pts = [(float(el.get("x")) + a, float(el.get("y")) + b) for a in (-r, r) for b in (-r, r)]
        elif el.tag == "hole":
            r = float(el.get("drill")) / 2
            pts = [(float(el.get("x")) + a, float(el.get("y")) + b) for a in (-r, r) for b in (-r, r)]
        elif el.tag == "wire" and el.get("layer") in ("21", "51"):
            pts = [(float(el.get("x1")), float(el.get("y1"))), (float(el.get("x2")), float(el.get("y2")))]
        else:
            continue
        for x, y in pts:
            x, y = rxy(x, y, k)
            xs.append(x); ys.append(y)
    return min(xs), min(ys), max(xs), max(ys)

def padpos(name, pad, k):
    for el in PKG[name]:
        if el.tag in ("smd", "pad") and el.get("name") == pad:
            return rxy(float(el.get("x")), float(el.get("y")), k)

PLACE = {}
def solve(name, pad_a, ta, pad_b, tb):
    """find rotation and origin so that two pads land on two target points"""
    for k in range(4):
        a, b = padpos(name, pad_a, k), padpos(name, pad_b, k)
        if abs((b[0] - a[0]) - (tb[0] - ta[0])) < 0.02 and abs((b[1] - a[1]) - (tb[1] - ta[1])) < 0.02:
            PLACE[name] = (round(ta[0] - a[0], 3), round(ta[1] - a[1], 3), k)
    assert name in PLACE, name

def put_min(name, x0, ytop, k=0):
    a, b, c, d = bbox(name, k)
    PLACE[name] = (round(x0 - a, 2), round(ytop - d, 2), k)
    return c - a, d - b

def block(names, rows, x0, ytop, rot=None, gap=0.6):
    rot = rot or {}
    y, w = ytop, 0.0
    for row in rows:
        x, h = x0, 0.0
        for i in row:
            pw, ph = put_min(names[i], x, y, rot.get(i, 0))
            x += pw + gap
            h = max(h, ph)
        w = max(w, x - x0 - gap)
        y -= h + gap
    return w, ytop - y

def series(titles, rows, x0, ytop, rot=None, pitch_gap=1.2, wrap=None):
    x, y, hmax, n = x0, ytop, 0.0, 0
    for t in titles:
        w, h = block(BLOCKS[t], rows, x, y, rot)
        x += w + pitch_gap; hmax = max(hmax, h); n += 1
        if wrap and n % wrap == 0:
            x, y, hmax = x0, y - hmax - 1.5, 0.0
    return x, hmax

# --- connectors exactly where the Dropbear has them (KiCad: at (x0, yc) rotated -90: abs = (x0 - ly, yc + lx))
def kicad_abs(yc, lx, ly):
    return e(OX - ly, yc + lx)
for name, yc in (("J1", 46.99), ("J2", 100.33)):     # J1 black = top, J2 grey = bottom
    solve(name, "A1", kicad_abs(yc, 12.475, -15.9), "C8", kicad_abs(yc, -12.475, -7.5))

# --- WeAct module on the right side, USB-C at the right-hand edge
WX1, WY0 = 115.6, 39.0
def weact(u, v):
    return WX1 - v, WY0 + u
def row_v(r):
    return 4.67 + (15 - r) * 2.54
for name, u1, u2, r in (("P1", 1.37, 3.91, 1), ("P3", 1.37, 3.91, 13), ("P2", 29.31, 31.85, 1), ("P4", 29.31, 31.85, 13)):
    solve(name, "1", weact(u1, row_v(r)), "2", weact(u2, row_v(r)))

# --- top: everything that belongs to the black connector (power in, regulator, outputs)
series(["HIGH SIDE OUT%d" % i for i in range(7, 11)], [[0, 1], [3], [2]], 29.5, 96.5, pitch_gap=1.5)
block(BLOCKS["REVERSE BATTERY PROTECTION (feeds the H-bridge)"], [[0], [1], [2]], 61.6, 96.5)
block(BLOCKS["5 V BUCK (LM2596S-5.0)"], [[0, 2], [3, 1, 4]], 69.5, 96.5, rot={0: 1})
block(BLOCKS["5 V DISTRIBUTION"], [[0], [1, 2], [3, 4], [5]], 101.5, 86.5)
series(["LOW SIDE PWM%d" % i for i in range(1, 7)], [[0], [1], [2]], 20.0, 79.5)
block(BLOCKS["POWER INPUT (fit an external fuse)"], [[0, 1], [2], [3]], 20.0, 65.5)
block(BLOCKS["H-BRIDGE (wastegate / bypass actuator)"], [[0, 5], [1, 2, 3, 4], [6, 7]], 34.5, 65.5)
block(BLOCKS["CAN TRANSCEIVER"], [[0, 7], [1, 2], [3, 4], [5, 6]], 60.5, 65.5)
series(["FREQUENCY / DIGITAL SENSOR FREQ%d" % i for i in range(1, 6)], [[0, 1], [2, 4], [3]], 33.5, 50.0)
# --- bottom: everything that belongs to the grey connector (sensors)
xa, _ = series(["ANALOG AN%d" % i for i in range(1, 9)], [[0, 1], [2, 3], [4], [5, 6], [7]], 21.0, 37.5)
block(BLOCKS["ANALOG BUFFERS (TLV9004, supplied from +5V)"], [[0, 2], [1, 3]], xa + 0.5, 37.5)
block(BLOCKS["SUPPLY MONITORS"], [[0, 1], [2, 3], [4, 5]], 104.5, 37.5)
series(["EGT%d (K thermocouple)" % i for i in range(1, 5)], [[0, 1], [2, 3], [4, 5], [6], [7], [8, 9], [10]], 28.5, 23.5, rot={6: 1})
series(["DIGITAL INPUT DI%d" % i for i in range(1, 5)], [[0, 1], [2, 4], [3]], 63.0, 23.5)

assert set(PLACE) == set(PKG), sorted(set(PKG) - set(PLACE))
boxes = {}
for n, (x, y, k) in PLACE.items():
    a, b, c, d = bbox(n, k)
    boxes[n] = (x + a, y + b, x + c, y + d)
KEEP = {"connector A body": (0, 60.0, 19.0, 92.5), "connector B body": (0, 6.5, 19.0, 39.0),
        "module": (WX1 - 41.6, WY0, WX1, WY0 + 33.22)}
problems = []
ns = sorted(boxes)
for i, p in enumerate(ns):
    a = boxes[p]
    if not p.startswith("J") and (a[0] < 0.8 or a[1] < 0.8 or a[2] > BW - 0.8 or a[3] > BH - 0.8):
        problems.append("outside board: %s %s" % (p, [round(v, 1) for v in a]))
    for hx, hy, hd in HOLES:
        if a[0] - 3.5 < hx < a[2] + 3.5 and a[1] - 3.5 < hy < a[3] + 3.5:
            problems.append("near mounting hole: " + p)
    for kn, kb in KEEP.items():
        if (p[0] not in "JP" or kn == "board cut-out") and a[0] < kb[2] and kb[0] < a[2] and a[1] < kb[3] and kb[1] < a[3]:
            problems.append("inside %s area: %s" % (kn, p))
    for q in ns[i + 1:]:
        b = boxes[q]
        if a[0] < b[2] - 0.05 and b[0] < a[2] - 0.05 and a[1] < b[3] - 0.05 and b[1] < a[3] - 0.05:
            problems.append("overlap: %s %s" % (p, q))
print("placement problems:", problems if problems else "none")
print("holes", HOLES, "J1", PLACE["J1"], "J2", PLACE["J2"], "P1", PLACE["P1"])

scr = ["# Placement script: CAN IO shield for the WeAct STM32F405, in the 48-pin aluminium box used by the Speeduino Dropbear.",
       "# Board 116.08 x 98 mm, outline / mounting holes / connector positions copied from the Dropbear V2 board files,",
       "# without the Dropbear USB cut-out on the right edge.",
       "# Use: open the schematic, switch to the board, delete the default outline, then run this file with SCRIPT.",
       "GRID MM 0.01;", "LAYER 20;"] + OUTLINE
for n in sorted(PLACE, key=lambda z: (z.rstrip("0123456789"), int("".join(c for c in z if c.isdigit()) or 0))):
    x, y, k = PLACE[n]
    scr.append("ROTATE =R%d '%s';" % (90 * k, n))
    scr.append("MOVE %s (%g %g);" % (n, x, y))
for hx, hy, hd in HOLES:
    scr.append("HOLE %g (%g %g);" % (hd, hx, hy))
ml, mb = WX1 - 41.6, WY0
scr += ["LAYER 51;", "WIRE 0.15 (%g %g) (%g %g) (%g %g) (%g %g) (%g %g);" % (ml, mb, WX1, mb, WX1, mb + 33.22, ml, mb + 33.22, ml, mb),
        "LAYER 21;", "CHANGE SIZE 1.2;", "CHANGE RATIO 12;", "TEXT 'WEACT F405  USB >' R0 (%g %g);" % (ml + 12, mb + 15.5),
        "LAYER 1;", "POLYGON GND 0.3 (1 1) (%g 1) (%g %g) (1 %g) (1 1);" % (BW - 1, BW - 1, BH - 1, BH - 1),
        "LAYER 16;", "POLYGON GND 0.3 (1 1) (%g 1) (%g %g) (1 %g) (1 1);" % (BW - 1, BW - 1, BH - 1, BH - 1),
        "GRID MM 0.5;", "RATSNEST;", "WINDOW FIT;"]
open(sys.argv[4], "w").write("\n".join(scr) + "\n")

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
fig, ax = plt.subplots(figsize=(14, 12))
for ln in OUTLINE:
    c = [float(v) for v in re.findall(r'\(([-\d.]+) ([-\d.]+)\)', ln) for v in v]
    ax.plot([c[0], c[2]], [c[1], c[3]], "k-", lw=1.5)
for kn, kb in KEEP.items():
    ax.add_patch(plt.Rectangle((kb[0], kb[1]), kb[2] - kb[0], kb[3] - kb[1], fill=False, ls="--", color="blue"))
    ax.text(kb[0] + 1, kb[3] - 3, kn, fontsize=6, color="blue")
for n, (a, b, c, d) in boxes.items():
    col = {"R": "#c33", "C": "#27a", "S": "#888", "D": "#a5a", "U": "#080", "Q": "#080", "P": "#000", "J": "#000", "L": "#a60"}.get(n[0], "#444")
    ax.add_patch(plt.Rectangle((a, b), c - a, d - b, fill=False, color=col, lw=0.8))
    if (c - a) > 5:
        ax.text((a + c) / 2, (b + d) / 2, n, fontsize=6, ha="center", va="center", color=col)
for hx, hy, hd in HOLES:
    ax.add_patch(plt.Circle((hx, hy), hd / 2, fill=False))
for n, pad in (("P1", "1"), ("P2", "1"), ("P3", "1"), ("P4", "1"), ("J1", "A1"), ("J2", "A1")):
    x, y, k = PLACE[n]; px, py = padpos(n, pad, k)
    ax.plot([x + px], [y + py], "r.", ms=5)
ax.set_xlim(-4, BW + 4); ax.set_ylim(-4, BH + 4); ax.set_aspect("equal")
fig.savefig(os.path.splitext(sys.argv[4])[0] + "-preview.png", dpi=75, bbox_inches="tight")
