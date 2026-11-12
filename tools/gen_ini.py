#!/usr/bin/env python3
"""Generator for the CAN IO expander (WeAct STM32F405) TunerStudio ini.
Offsets are computed automatically with natural C alignment, so the same
field order can be used for a packed-by-alignment C struct in the firmware."""
import math, re, sys

SIG = "rusEFI canio.2026.11.12.f405.2"
SIZES = {"U08": 1, "S08": 1, "U16": 2, "S16": 2, "U32": 4, "S32": 4, "F32": 4}

# ---------------------------------------------------------------- hardware
AN = [("AN%d" % (i + 1), p) for i, p in enumerate(["PA6", "PA7", "PC0", "PC1", "PC2", "PC3", "PC4", "PC5"])]
EGT = [("EGT%d" % (i + 1), p) for i, p in enumerate(["PA0", "PA1", "PA2", "PA3", "PA4", "PA5"])]
FQ = [("FREQ%d" % (i + 1), p) for i, p in enumerate(["PA15", "PB3", "PB10", "PB11", "PA8"])]
DI = [("DI%d" % (i + 1), p) for i, p in enumerate(["PC13", "PD2", "PB12", "PB4"])]
OUT = [("PWM1", "PC6", True), ("PWM2", "PC7", True), ("PWM3", "PC8", True), ("PWM4", "PC9", True),
       ("PWM5", "PB6", True), ("PWM6", "PB7", True),
       ("OUT7", "PB5", False), ("OUT8", "PA9", False), ("OUT9", "PA10", False), ("OUT10", "PC12", False)]

AN_PINS = ["None"] + ["%s (%s)" % a for a in AN]
OUT_PINS = ["None"] + ["%s (%s)" % (o[0], o[1]) for o in OUT]

SENSORS = ["Generic / aux", "Oil pressure", "Fuel pressure (low)", "Fuel pressure (high)", "MAP", "MAP 2",
           "Barometric pressure", "Compressor discharge pressure", "Throttle inlet pressure",
           "Exhaust back pressure", "Crankcase pressure", "Coolant pressure", "AC pressure", "Brake pressure",
           "Coolant temp (CLT)", "Intake air temp (IAT)", "Oil temp", "Fuel temp", "Ambient temp",
           "Compressor discharge temp", "Aux temp 1", "Aux temp 2", "Gearbox temp", "Diff temp",
           "TPS 1", "TPS 2", "Accelerator pedal 1", "Accelerator pedal 2", "Wastegate position",
           "Idle valve position", "EGR position", "Bypass valve position", "Lambda 1 (analog wideband)",
           "Lambda 2 (analog wideband)", "Fuel level", "Flex fuel (analog)", "Aux linear 1", "Aux linear 2",
           "Aux linear 3", "Aux linear 4", "Steering angle", "Damper position", "Gear position",
           "Boost knob / trim pot", "Switch input"]
LIN_PRESETS = ["Custom (2 points)", "0-100 psi (0.5-4.5 V)", "0-150 psi (0.5-4.5 V)", "0-200 psi (0.5-4.5 V)",
               "0-10 bar (0.5-4.5 V)", "GM 1 bar MAP", "GM 2 bar MAP", "GM 3 bar MAP", "MPX4100", "MPX4250",
               "MPXH6400", "Bosch 2.5 bar", "0-5 V = 0-100 %"]
THERM_PRESETS = ["Custom (3 points)", "Bosch NTC (2.5k @ 20C)", "GM CLT / IAT"]
FQ_SENSORS = ["Generic", "Vehicle speed (VSS)", "Wheel speed FL", "Wheel speed FR", "Wheel speed RL",
              "Wheel speed RR", "Turbo speed", "Input shaft speed", "Output / driveshaft speed", "Flex fuel",
              "Fuel flow", "Aux speed 1", "Aux speed 2", "Oil pressure", "Oil temp", "Oil level",
              "Coolant pressure", "Coolant temp", "Fuel pressure (low)", "Fuel pressure (high)", "Fuel temp",
              "Gearbox oil pressure", "Gearbox oil temp", "Throttle position", "MAP (frequency)", "MAF (frequency)"]
# Values decoded from the ECU broadcast: (key, label, units, och type, och scale, usable as table axis, gauge lo, gauge hi)
ECU = [
    ("Rpm", "ECU RPM", "RPM", "U16", 1, True, 0, 9000),
    ("Map", "ECU MAP kPa", "kPa", "S16", 0.1, True, 0, 400),
    ("Tps", "ECU TPS %", "%", "S16", 0.01, True, 0, 100),
    ("Pedal", "ECU pedal %", "%", "S16", 0.01, True, 0, 100),
    ("Clt", "ECU CLT C", "C", "S16", 0.1, True, -40, 140),
    ("Iat", "ECU IAT C", "C", "S16", 0.1, True, -40, 140),
    ("Lambda", "ECU lambda", "", "U16", 0.0001, True, 0.5, 1.5),
    ("Vss", "ECU vehicle speed kph", "kph", "U16", 0.01, True, 0, 300),
    ("OilPress", "ECU oil pressure kPa", "kPa", "S16", 0.1, True, 0, 1000),
    ("FuelPress", "ECU fuel pressure kPa", "kPa", "S16", 0.1, True, 0, 1000),
    ("Gear", "ECU gear", "", "S08", 1, True, 0, 8),
    ("Vbatt", "ECU battery V", "V", "U16", 0.001, True, 6, 18),
    ("Wastegate", "ECU wastegate position %", "%", "S16", 0.01, True, 0, 100),
    ("Flex", "ECU flex %", "%", "U08", 1, True, 0, 100),
    # ---- added with firmware 0.3
    ("Timing", "ECU ignition timing deg", "deg", "S16", 0.02, True, -20, 60),
    ("InjDuty", "ECU injector duty %", "%", "U08", 0.5, True, 0, 100),
    ("CoilDuty", "ECU coil duty %", "%", "U08", 0.5, True, 0, 100),
    ("Tps2", "ECU TPS 2 %", "%", "S16", 0.01, True, 0, 100),
    ("Aux1", "ECU aux temp 1 C", "C", "S16", 0.1, True, -40, 200),
    ("Aux2", "ECU aux temp 2 C", "C", "S16", 0.1, True, -40, 200),
    ("FuelLevel", "ECU fuel level %", "%", "U08", 0.5, True, 0, 100),
    ("RevLimit", "ECU active rev limit RPM", "RPM", "U16", 1, True, 0, 9000),
    ("OilTemp", "ECU oil temp C", "C", "S16", 0.1, True, -40, 160),
    ("FuelTemp", "ECU fuel temp C", "C", "S16", 0.1, True, -40, 120),
    ("Airflow", "ECU airflow kg/h", "kg/h", "U16", 0.01, True, 0, 600),
    ("InjPulse", "ECU injection pulse ms", "ms", "U16", 0.01, True, 0, 25),
    ("KnockCount", "ECU knock count", "", "U16", 1, True, 0, 1000),
    ("Trim1", "ECU fuel trim bank 1 %", "%", "S16", 0.01, True, -25, 25),
    ("Trim2", "ECU fuel trim bank 2 %", "%", "S16", 0.01, True, -25, 25),
    ("Lambda2", "ECU lambda 2", "", "U16", 0.0001, True, 0.5, 1.5),
    ("FuelPressHigh", "ECU fuel pressure high bar", "bar", "U16", 0.1, True, 0, 250),
    ("CamIn1", "ECU intake cam bank 1 deg", "deg", "S08", 1, True, -60, 60),
    ("Egt1", "ECU EGT 1 C", "C", "U16", 1, True, 0, 1100),
    ("Egt2", "ECU EGT 2 C", "C", "U16", 1, True, 0, 1100),
    ("RevLimitActive", "ECU rev limiter / cut active", "", "U08", 1, True, 0, 1),
    ("MainRelay", "ECU main relay", "", "U08", 1, True, 0, 1),
    ("FuelPump", "ECU fuel pump", "", "U08", 1, True, 0, 1),
    ("CheckEngine", "ECU check engine", "", "U08", 1, True, 0, 1),
    ("LambdaProtect", "ECU lambda protection", "", "U08", 1, True, 0, 1),
    ("Fan1", "ECU fan 1", "", "U08", 1, True, 0, 1),
    ("Fan2", "ECU fan 2", "", "U08", 1, True, 0, 1),
    ("Brake", "ECU brake pedal", "", "U08", 1, True, 0, 1),
    # ---- display / log only
    ("O2Heater", "ECU O2 heater", "", "U08", 1, False, 0, 1),
    ("WarnCount", "ECU warning counter", "", "U16", 1, False, 0, 1000),
    ("ErrorCode", "ECU last error code", "", "U16", 1, False, 0, 10000),
    ("Distance", "ECU trip distance km", "km", "U16", 0.1, False, 0, 1000),
    ("McuTemp", "ECU MCU temp C", "C", "S16", 0.1, False, -40, 125),
    ("CylAirmass", "ECU cylinder air mass g", "g", "U16", 0.001, False, 0, 2),
    ("FuelConsumed", "ECU fuel consumed g", "g", "U16", 1, False, 0, 65000),
    ("FuelFlow", "ECU fuel flow g/s", "g/s", "U16", 0.005, False, 0, 100),
    ("CamInTarget1", "ECU intake cam target bank 1 deg", "deg", "S08", 1, False, -60, 60),
    ("CamEx1", "ECU exhaust cam bank 1 deg", "deg", "S08", 1, False, -60, 60),
    ("CamExTarget1", "ECU exhaust cam target bank 1 deg", "deg", "S08", 1, False, -60, 60),
    ("CamIn2", "ECU intake cam bank 2 deg", "deg", "S08", 1, False, -60, 60),
    ("CamInTarget2", "ECU intake cam target bank 2 deg", "deg", "S08", 1, False, -60, 60),
    ("CamEx2", "ECU exhaust cam bank 2 deg", "deg", "S08", 1, False, -60, 60),
    ("CamExTarget2", "ECU exhaust cam target bank 2 deg", "deg", "S08", 1, False, -60, 60),
] + [("Knock%d" % i, "ECU knock cylinder %d" % i, "", "S08", 1, False, -20, 20) for i in range(1, 9)]
ECU_OLD = 14          # the first 14 keep their original axis positions

# Axis list. Positions are part of the saved tune, so entries are only ever appended:
# the two slots of the removed DI5 / DI6 stay as INVALID.
AXIS = (["Zero"] + ["%s value" % a[0] for a in AN] + ["%s C" % e[0] for e in EGT] +
        ["EGT max C", "EGT average C", "EGT spread C"] + ["%s value" % f[0] for f in FQ] +
        ["Battery V", "Sensor 5V rail V", "MCU temp C", "Actuator position %", "Actuator target %"] +
        ["%s state" % d[0] for d in DI] + ["INVALID", "INVALID"] +
        [e[1] for e in ECU[:ECU_OLD]] +
        ["CAN user value 1", "CAN user value 2", "CAN user value 3", "CAN user value 4"] +
        [e[1] for e in ECU[ECU_OLD:] if e[5]])
assert len(AXIS) <= 128
AXIS_FULL = AXIS + ["INVALID"] * (128 - len(AXIS))

# ---------------------------------------------------------------- layout DSL
class Block:
    def __init__(self):
        self.off = 0
        self.lines = []
        self.names = {}
        self.fields = []
        self.defaults = []
        self.help = []
        self.power = []

    def _place(self, typ, count=1):
        s = SIZES[typ]
        self.off = (self.off + s - 1) // s * s
        o = self.off
        self.off += s * count
        return o

    def _reg(self, name, kind):
        assert name not in self.names, name
        self.names[name] = kind

    def scalar(self, name, typ, units, scale, lo, hi, digits, default=None, hlp=None, cyc=False):
        o = self._place(typ)
        self.fields.append((name, typ, 1, o, scale, default))
        self._reg(name, "scalar")
        self.lines.append('\t%s = scalar, %s, %d, "%s", %s, 0, %s, %s, %d' % (name, typ, o, units, scale, lo, hi, digits))
        if default is not None:
            self.defaults.append((name, str(default)))
        if hlp:
            self.help.append((name, hlp))
        if cyc:
            self.power.append(name)

    def bits(self, name, opts, hlp=None, cyc=False):
        n = max(1, math.ceil(math.log2(len(opts))))
        full = list(opts) + ["INVALID"] * ((1 << n) - len(opts))
        o = self._place("U08")
        self.fields.append((name, "U08", 1, o, 1, None))
        self._reg(name, "bits")
        self.lines.append('\t%s = bits, U08, %d, [0:%d], %s' % (name, o, n - 1, ", ".join('"%s"' % x for x in full)))
        if hlp:
            self.help.append((name, hlp))
        if cyc:
            self.power.append(name)

    def flag(self, name, off="No", on="Yes", hlp=None, cyc=False):
        self.bits(name, [off, on], hlp, cyc)

    def array(self, name, typ, shape, units, scale, lo, hi, digits, default=None, hlp=None):
        cnt = 1
        for d in shape:
            cnt *= d
        o = self._place(typ, cnt)
        self.fields.append((name, typ, cnt, o, scale, default))
        self._reg(name, "array")
        sh = "x".join(str(d) for d in shape)
        self.lines.append('\t%s = array, %s, %d, [%s], "%s", %s, 0, %s, %s, %d' % (name, typ, o, sh, units, scale, lo, hi, digits))
        if default is not None:
            assert len(default) == cnt, name
            self.defaults.append((name, " ".join(str(x) for x in default)))
        if hlp:
            self.help.append((name, hlp))

    def comment(self, text):
        self.off = (self.off + 3) // 4 * 4
        self.lines.append("")
        self.lines.append("; ---- %s" % text)

    def align(self):
        self.off = (self.off + 3) // 4 * 4


class Och:
    def __init__(self):
        self.off = 0
        self.lines = []
        self.fields = []
        self.names = set()

    def _place(self, typ):
        s = SIZES[typ]
        self.off = (self.off + s - 1) // s * s
        o = self.off
        self.off += s
        return o

    def scalar(self, name, typ, units, scale):
        o = self._place(typ)
        self.fields.append((name, typ, o, scale, None))
        self.names.add(name)
        self.lines.append('\t%s = scalar, %s, %d, "%s", %s, 0' % (name, typ, o, units, scale))

    def bitset(self, typ, names):
        o = self._place(typ)
        self.fields.append(("bits%d" % o, typ, o, 1, list(names)))
        for i, n in enumerate(names):
            if n:
                self.names.add(n)
                self.lines.append('\t%s = bits, %s, %d, [%d:%d]' % (n, typ, o, i, i))

    def comment(self, t):
        self.lines.append("")
        self.lines.append("; ---- %s" % t)


C = Block()
O = Och()
dialogs = []      # text chunks for [UserDefined]
tables = []
curves = []
gauges = []       # (category, [lines])
gauge_names = set()
datalog = []
menus = []
dialog_names = set()


def dlg(name, title, layout=None):
    dialog_names.add(name)
    dialogs.append("")
    dialogs.append('\tdialog = %s, "%s"%s' % (name, title, (", " + layout) if layout else ""))


def fld(label, const=None, enable=None, hide=False):
    if hide:
        dialogs.append('\t\tfield = "%s", %s, {%s}, {%s}' % (label, const, enable, enable))
    elif const is None:
        dialogs.append('\t\tfield = "%s"' % label)
    elif enable:
        dialogs.append('\t\tfield = "%s", %s, {%s}' % (label, const, enable))
    else:
        dialogs.append('\t\tfield = "%s", %s' % (label, const))


def pnl(name, enable=None):
    dialogs.append('\t\tpanel = %s%s' % (name, (", {%s}" % enable) if enable else ""))


def ggauge(cat, name, chan, title, units, lo, hi, lw, hw, vd=1, ld=1):
    gauge_names.add(name)
    gauges.append((cat, '\t%s = %s, "%s", "%s", %s, %s, %s, %s, %s, %s, %d, %d' %
                   (name, chan, title, units, lo, hi, lo, lw, hw, hi, vd, ld)))


def log(chan, label, fmt="float", pat="%.2f"):
    datalog.append('\tentry = %s, "%s", %s, "%s"' % (chan, label, fmt, pat))


# ================================================================ CONSTANTS
C.comment("Board / ADC")
C.scalar("adcVref", "F32", "V", 1, 2.5, 3.6, 3, 3.3, "MCU ADC reference (VDDA). Measure the 3.3 V rail of the WeAct board with a multimeter and enter it here.")
C.scalar("analogDivider", "F32", "ratio", 1, 1, 10, 4, 1.556, "Input divider of AN1-AN8: sensor voltage = ADC pin voltage x this ratio. 100k series / 180k to ground = 1.556.")
C.scalar("analogInputLoad", "F32", "kOhm", 1, 1, 100000, 1, 280, "Resistance the input stage places across the sensor (divider total). Used to correct thermistor readings: the thermistor is seen in parallel with this value.")
C.scalar("egtDivider", "F32", "ratio", 1, 1, 10, 4, 1.556, "Divider between each thermocouple amplifier output and the ADC pin. 10k / 18k = 1.556.")
C.scalar("vbattDivider", "F32", "ratio", 1, 1, 30, 4, 6.6, "Battery sense divider on PB1. 56k / 10k = 6.6.")
C.scalar("v5Divider", "F32", "ratio", 1, 1, 10, 4, 2.0, "Sensor 5 V rail sense divider on PB0. 10k / 10k = 2.0.")
C.scalar("v5Nominal", "F32", "V", 1, 4.5, 5.5, 3, 5.0, "Nominal sensor supply. Ratiometric inputs are scaled by nominal / measured.")
C.scalar("v5Tolerance", "F32", "V", 1, 0.05, 1, 2, 0.25, "Sensor rail fault is raised when the measured 5 V rail deviates more than this.")
C.scalar("vbattLowWarn", "F32", "V", 1, 0, 16, 1, 10.5, "Battery low warning threshold.")
C.scalar("vbattOutputCutoff", "F32", "V", 1, 0, 16, 1, 7.0, "Below this battery voltage every output and the H-bridge are switched off.")
C.scalar("adcOversample", "U08", "samples", 1, 1, 64, 0, 8, "ADC samples averaged per reading.")
C.scalar("pwmFreqA", "U16", "Hz", 1, 5, 25000, 0, 100, "Shared by PWM1-PWM4 (timer 3). All four outputs run at this frequency.", cyc=True)
C.scalar("pwmFreqB", "U16", "Hz", 1, 5, 25000, 0, 100, "Shared by PWM5-PWM6 (timer 4).", cyc=True)

C.comment("CAN bus")
C.bits("canBitrate", ["125 kbit/s", "250 kbit/s", "500 kbit/s", "1 Mbit/s"], "Must match the ECU. epicEFI / rusEFI default is 500 kbit/s.", cyc=True)
C.flag("canExtendedId", "11 bit (standard)", "29 bit (extended)", "Frame format used for the frames this board sends and accepts.", cyc=True)
C.flag("canBigEndian", "Little endian (Intel)", "Big endian (Motorola)", "Byte order of multi-byte values in the board frames.")
C.flag("canListenOnly", "Normal", "Listen only", "Listen only: the board never transmits or acknowledges. For bench sniffing.", cyc=True)
C.flag("canSendOnChange", "No", "Yes", "Send the digital state frame immediately when any digital input changes, on top of the periodic rate.")
C.bits("canEcuProtocol", ["None", "rusEFI / epicEFI verbose broadcast"], "Lets the board decode ECU values (RPM, MAP, CLT...) and use them as table axes.")
C.scalar("canTxBaseId", "U32", "id", 1, 0, 536870911, 0, 1696, "First ID of the frames sent by this board (decimal). Default 1696 = 0x6A0. See the CAN frame map in the ini comments.", cyc=True)
C.scalar("canRxBaseId", "U32", "id", 1, 0, 536870911, 0, 1712, "First ID of the command frames accepted by this board (decimal). Default 1712 = 0x6B0.", cyc=True)
C.scalar("canEcuBaseId", "U32", "id", 1, 0, 536870911, 0, 512, "Base ID of the ECU verbose broadcast (decimal). rusEFI default 512 = 0x200.", cyc=True)
C.scalar("canEcuTimeoutMs", "U16", "ms", 1, 50, 10000, 0, 500, "ECU broadcast considered lost after this time. ECU axis values then read zero and the ECU timeout fault is set.")
C.scalar("canCmdTimeoutMs", "U16", "ms", 1, 20, 10000, 0, 200, "Command frames considered lost after this time. Each output and the actuator then apply their own failsafe.")
C.scalar("canRateAnalog", "U08", "Hz", 1, 0, 200, 0, 50, "Send rate of the analog millivolt frames (+3, +4). This is what an ECU reads as CAN analog inputs. 0 = not sent.")
C.scalar("canRateAnalogValue", "U08", "Hz", 1, 0, 200, 0, 0, "Send rate of the analog calibrated value frames (+1, +2). Only useful for a dash or logger that cannot apply the sensor calibration itself. 0 = not sent.")
C.scalar("canRateEgt", "U08", "Hz", 1, 0, 50, 0, 10, "Send rate of the EGT frames (+5, +6). 0 = not sent.")
C.scalar("canRateFreq", "U08", "Hz", 1, 0, 200, 0, 50, "Send rate of the frequency / speed frames (+7, +8; +8 also carries battery and 5 V rail). 0 = not sent.")
C.scalar("canRateFreq2", "U08", "Hz", 1, 0, 200, 0, 0, "Send rate of the second value frames (+10, +11): digital sensor second values, actuator second sensor. 0 = not sent.")
C.scalar("canRateDigital", "U08", "Hz", 1, 0, 200, 0, 20, "Send rate of the status / digital frame (+0). 0 = not sent.")
C.scalar("canRateActuator", "U08", "Hz", 1, 0, 200, 0, 50, "Send rate of the actuator frame (+9). 0 = not sent.")

C.comment("Serial port (Bluetooth module)")
C.bits("serialBaud", ["9600", "19200", "38400", "57600", "115200", "230400"], "Baud rate of the serial port on PC10 (TX) / PC11 (RX). Must match the Bluetooth module. The TunerStudio protocol is the same as on USB.", cyc=True)

C.comment("Analog inputs AN1-AN8")
for i, (nm, pin) in enumerate(AN, 1):
    C.align()
    p = "an%d_" % i
    C.bits(p + "mode", ["Disabled", "Linear sensor", "Thermistor (NTC)", "Custom curve", "Switch (digital)", "Raw voltage only"],
           "How %s (%s) is converted. Thermistor mode needs the pull-up jumper of this input fitted." % (nm, pin))
    C.bits(p + "sensor", SENSORS, "What is connected. Used to label the value and by the ECU side mapping.")
    C.bits(p + "linPreset", LIN_PRESETS, "Ready-made calibrations. Custom uses the two points below. Pressures are in kPa.")
    C.bits(p + "thermPreset", THERM_PRESETS, "Ready-made thermistor curves. Custom uses the three points below.")
    C.bits(p + "curve", ["Curve A", "Curve B", "Curve C", "Curve D"], "Which custom curve converts this input.")
    C.bits(p + "canScale", ["x1", "x10", "x100"], "Multiplier applied before the value is sent on CAN as a signed 16 bit number.")
    C.flag(p + "ratiometric", hlp="Yes for sensors powered from the board 5 V rail (most pressure and position sensors, and thermistors).")
    C.flag(p + "swInvert", "Active high", "Active low", "Switch mode polarity.")
    C.scalar(p + "filter", "U08", "%", 1, 0, 99, 0, 30, "Smoothing. 0 = none, 99 = very slow.")
    C.scalar(p + "v1", "F32", "V", 1, 0, 5.5, 3, 0.5, "Linear sensor: voltage at point 1.")
    C.scalar(p + "val1", "F32", "", 1, -100000, 100000, 2, 0, "Linear sensor: value at point 1.")
    C.scalar(p + "v2", "F32", "V", 1, 0, 5.5, 3, 4.5, "Linear sensor: voltage at point 2.")
    C.scalar(p + "val2", "F32", "", 1, -100000, 100000, 2, 1000, "Linear sensor: value at point 2.")
    C.scalar(p + "bias", "F32", "Ohm", 1, 10, 1000000, 0, 2490, "Pull-up resistor fitted on this input.")
    for k, (t, r) in enumerate([(0, 5896), (20, 2500), (80, 323)], 1):
        C.scalar(p + "t%d" % k, "F32", "C", 1, -60, 300, 1, t, "Thermistor point %d temperature." % k)
        C.scalar(p + "r%d" % k, "F32", "Ohm", 1, 1, 2000000, 1, r, "Thermistor point %d resistance." % k)
    C.scalar(p + "swThreshold", "F32", "V", 1, 0, 5.5, 2, 2.5, "Switch mode: input is ON above this voltage.")
    C.scalar(p + "swHyst", "F32", "V", 1, 0, 2.5, 2, 0.3, "Switch mode hysteresis.")
    C.scalar(p + "errLow", "F32", "V", 1, 0, 5.5, 2, 0.1, "Below this voltage the input is faulted (short to ground / broken wire).")
    C.scalar(p + "errHigh", "F32", "V", 1, 0, 5.5, 2, 4.9, "Above this voltage the input is faulted (short to 5 V / open thermistor).")
    C.scalar(p + "fallback", "F32", "", 1, -100000, 100000, 2, 0, "Value reported and used by tables while the input is faulted.")
    C.scalar(p + "errDelayMs", "U16", "ms", 1, 0, 10000, 0, 200, "Fault must persist this long before it is raised.")

C.comment("Custom curves")
for i, L in enumerate("ABCD", 1):
    C.align()
    C.array("curve%d_bins" % i, "F32", (16,), "V", 1, 0, 5.5, 3,
            [round(k * 5 / 15, 3) for k in range(16)], "Custom curve %s voltage axis." % L)
    C.array("curve%d_values" % i, "F32", (16,), "", 1, -100000, 100000, 2,
            [round(k * 100 / 15, 2) for k in range(16)], "Custom curve %s output values." % L)

C.comment("EGT")
C.scalar("egtGain", "F32", "mV/C", 1, 0.5, 50, 3, 5.0, "Amplifier gain. AD8495 / AD8497 = 5 mV per degree C.")
C.scalar("egtZeroV", "F32", "V", 1, -1, 3, 4, 0, "Amplifier output at 0 C. 0 with REF pin grounded; 1.25 if the REF pin is lifted to 1.25 V.")
C.scalar("egtOpenV", "F32", "V", 1, 0, 5.5, 2, 4.85, "Amplifier output above this means open / broken probe.")
C.scalar("egtFilter", "U08", "%", 1, 0, 99, 0, 50, "Smoothing applied to every EGT channel.")
C.scalar("egtWarnTemp", "S16", "C", 1, 0, 1300, 0, 900, "Warning threshold (any enabled probe).")
C.scalar("egtCritTemp", "S16", "C", 1, 0, 1300, 0, 950, "Critical threshold (any enabled probe).")
C.scalar("egtSpreadMax", "S16", "C", 1, 0, 1000, 0, 120, "Warning when hottest minus coldest cylinder probe exceeds this. 0 disables.")
C.scalar("egtSpreadMinTemp", "S16", "C", 1, 0, 1300, 0, 450, "Spread check only runs when the average EGT is above this.")
C.scalar("egtAlarmDelayMs", "U16", "ms", 1, 0, 10000, 0, 500, "Threshold must be exceeded this long before the warning / critical flag is set.")
POS = ["Not assigned"] + ["Cylinder %d" % k for k in range(1, 9)] + ["Pre-turbo", "Post-turbo", "Collector", "Bank 1", "Bank 2"]
for i, (nm, pin) in enumerate(EGT, 1):
    C.align()
    C.flag("egt%d_enable" % i, hlp="%s on %s." % (nm, pin))
    C.bits("egt%d_position" % i, POS, "Where this probe is fitted. Only cylinder probes take part in the spread check.")
    C.scalar("egt%d_trim" % i, "S16", "C", 0.1, -100, 100, 1, 0, "Offset added to this probe.")

C.comment("Frequency inputs")
for i, (nm, pin) in enumerate(FQ, 1):
    C.align()
    p = "fq%d_" % i
    C.bits(p + "mode", ["Disabled", "Frequency (Hz)", "Speed (kph)", "Shaft speed (RPM)", "Flex fuel sensor",
                        "Duty cycle (%)", "Pulse counter", "Hella pressure + temp (PWM)",
                        "Hella oil level + temp (PULS)", "SENT sensor"],
           "How %s (%s) is processed. Flex fuel, Hella and SENT sensors report two values (primary and secondary)." % (nm, pin))
    C.bits(p + "sensor2", FQ_SENSORS, "What the secondary value is (temperature on Flex fuel and Hella sensors, second fast channel on SENT).")
    C.bits(p + "sentType", ["GM fuel pressure sensor", "Throttle position (dual track)", "Custom (raw fast channels)"],
           "SENT decoding. Custom reports the two raw 12 bit fast channels through the multiplier / offset pairs.")
    C.bits(p + "canScale2", ["x1", "x10", "x100"], "CAN multiplier of the secondary value (signed 16 bit).")
    C.bits(p + "medium", ["Oil", "Coolant", "Fuel", "Gearbox oil", "Other"],
           "What the Hella pressure + temperature sensor is fitted to. Sets how both values are labelled for the ECU.")
    C.flag(p + "gauge", "Absolute", "Gauge (relative)", "Hella pressure sensors measure absolute pressure. Gauge subtracts the atmospheric pressure below.")
    C.bits(p + "sensor", FQ_SENSORS, "What is connected. Used to label the value and by the ECU side mapping.")
    C.bits(p + "edge", ["Rising", "Falling", "Both"], "Edge used for period measurement.", cyc=True)
    C.bits(p + "pull", ["None", "Pull-up", "Pull-down"], "MCU internal pull resistor (about 40k). Hall and open collector sensors normally need the shield pull-up instead.", cyc=True)
    C.bits(p + "canScale", ["x1", "x10", "x100"], "Multiplier applied before the value is sent on CAN as an unsigned 16 bit number. Preset sensors (Flex fuel, Hella, SENT GM / throttle) always use x10.")
    C.scalar(p + "filter", "U08", "%", 1, 0, 99, 0, 20, "Smoothing. 0 = none.")
    C.scalar(p + "pulsesPerRev", "F32", "pulses", 1, 0.01, 10000, 2, 1, "Speed and shaft modes: pulses per wheel or shaft revolution. Turbo speed: number of blades seen per revolution.")
    C.scalar(p + "circumference", "F32", "m", 1, 0.1, 10, 3, 1.95, "Speed mode: tyre rolling circumference.")
    C.scalar(p + "mult", "F32", "", 1, -100000, 100000, 4, 1, "Frequency / pulse counter / SENT custom: value = input x multiplier + offset.")
    C.scalar(p + "offset", "F32", "", 1, -100000, 100000, 3, 0, "Frequency mode offset.")
    C.scalar(p + "mult2", "F32", "", 1, -100000, 100000, 4, 1, "SENT custom: secondary value = raw channel 2 x multiplier + offset.")
    C.scalar(p + "offset2", "F32", "", 1, -100000, 100000, 3, 0, "SENT custom: secondary value offset.")
    C.scalar(p + "sentTickUs", "F32", "us", 1, 1, 90, 2, 3.0, "SENT nominal tick time. 3 us for nearly all automotive sensors.")
    C.scalar(p + "baro", "F32", "kPa", 1, 50, 110, 1, 101.3, "Atmospheric pressure subtracted in gauge mode.")
    C.scalar(p + "timeoutMs", "U16", "ms", 1, 10, 10000, 0, 500, "No edge for this long means zero.")
    C.scalar(p + "minPeriodUs", "U16", "us", 1, 0, 60000, 0, 20, "Edges closer together than this are rejected as noise.")

C.comment("Digital inputs")
for i, (nm, pin) in enumerate(DI, 1):
    C.align()
    p = "di%d_" % i
    C.flag(p + "enable", hlp="%s on %s." % (nm, pin))
    C.flag(p + "invert", "Active high", "Active low", "Active low: ON when the pin is pulled to ground (switch to ground).")
    C.bits(p + "pull", ["None", "Pull-up", "Pull-down"], "MCU internal pull resistor.", cyc=True)
    C.scalar(p + "debounce", "U08", "ms", 1, 0, 250, 0, 20, "State must be stable this long before it is accepted.")

C.comment("Outputs")
for i, (nm, pin, pwm) in enumerate(OUT, 1):
    C.align()
    p = "out%d_" % i
    C.bits(p + "mode", ["Disabled", "CAN command (ECU controls)", "Table", "Always on"],
           "%s on %s. CAN command: the ECU sends the state / duty. Table: the board decides from the table below." % (nm, pin))
    C.flag(p + "pwm", "On / Off", "PWM", "PWM uses the shared group frequency set in Board settings. Only used on PWM1-PWM6.")
    C.flag(p + "invert", "Normal", "Inverted", "Inverts the pin level. Depends on the driver fitted on the shield.")
    C.bits(p + "failsafe", ["Off", "On", "Hold last", "Use table"], "What the output does when CAN commands stop arriving (CAN command mode).")
    C.bits(p + "axisX", AXIS, "Table X axis source.")
    C.bits(p + "axisY", AXIS, "Table Y axis source.")
    C.scalar(p + "onAbove", "U08", "%", 1, 0, 100, 0, 60, "On / Off output: switches on when the table value rises above this.")
    C.scalar(p + "offBelow", "U08", "%", 1, 0, 100, 0, 40, "On / Off output: switches off when the table value falls below this.")
    C.scalar(p + "dutyIfError", "U08", "%", 1, 0, 100, 0, 0, "Table mode: duty used when an axis source is faulted or timed out.")
    C.scalar(p + "minDuty", "U08", "%", 1, 0, 100, 0, 0, "PWM duty is clamped to this range (when not zero).")
    C.scalar(p + "maxDuty", "U08", "%", 1, 0, 100, 0, 100, "PWM duty is clamped to this range.")
    C.scalar(p + "onDelayMs", "U16", "ms", 1, 0, 60000, 0, 0, "On / Off output: delay before switching on.")
    C.scalar(p + "offDelayMs", "U16", "ms", 1, 0, 60000, 0, 0, "On / Off output: delay before switching off.")
    C.array(p + "xBins", "F32", (8,), "", 1, -100000, 100000, 2, [0, 1000, 2000, 3000, 4000, 5000, 6000, 7000])
    C.array(p + "yBins", "F32", (8,), "", 1, -100000, 100000, 2, [0, 20, 40, 60, 80, 100, 120, 140])
    C.array(p + "table", "U08", (8, 8), "%", 1, 0, 100, 0, [0] * 64)

C.comment("Fault / warning output")
C.bits("faultOut_pin", OUT_PINS, "Output driven when any selected condition is active. Set that output mode to Disabled so nothing else drives it.")
C.flag("faultOut_onSensor", hlp="Any analog input fault or sensor rail fault.")
C.flag("faultOut_onEgtWarn", hlp="EGT warning (threshold or spread).")
C.flag("faultOut_onEgtCrit", hlp="EGT critical.")
C.flag("faultOut_onEgtProbe", hlp="Any enabled EGT probe open.")
C.flag("faultOut_onCan", hlp="ECU broadcast or command timeout.")
C.flag("faultOut_onActuator", hlp="Actuator fault.")
C.flag("faultOut_blink", "Steady", "Blink", "Blink at 2 Hz instead of steady on.")

C.comment("H-bridge actuator")
C.bits("act_mode", ["Disabled", "Electronic wastegate", "Compressor bypass / recirculation valve", "Generic position actuator"],
       "H-bridge on PB14 (PWM), PB15 (direction), PB13 (disable).", cyc=True)
C.bits("act_posChannel", AN_PINS, "Analog input wired to the actuator position sensor. Set that input to Raw voltage only.")
C.bits("act_posChannel2", AN_PINS, "Optional second position sensor for redundancy. None = single sensor. Set that input to Raw voltage only.")
C.bits("act_redundancy", ["Both sensors full range", "Second sensor saturates early (Ford / Toyota style)", "Second sensor ignored (display only)"],
       "How the two sensors are compared, same logic as rusEFI. Full range: both must agree within the tolerance and are averaged. Saturates early: the second sensor reaches its maximum before full travel, so it is only compared in the lower part and the first sensor alone is used above it.")
C.bits("act_targetSource", ["CAN command (ECU controls)", "Table", "Fixed position"], "Where the target position comes from.")
C.bits("act_failsafe", ["Disable bridge (spring return)", "Go to failsafe position", "Use table"],
       "What happens when CAN target commands stop arriving.")
C.flag("act_invertDir", "Normal", "Inverted", "Swap motor direction if the actuator runs away from the target.")
C.bits("act_axisX", AXIS, "Target table X axis source.")
C.bits("act_axisY", AXIS, "Target table Y axis source.")
C.scalar("act_pwmFreq", "U16", "Hz", 1, 100, 25000, 0, 1000, "H-bridge PWM frequency (timer 12).", cyc=True)
C.scalar("act_closedV", "F32", "V", 1, 0, 5.5, 3, 0.5, "Position sensor voltage at 0 % (fully closed). Filled in by auto calibration.")
C.scalar("act_openV", "F32", "V", 1, 0, 5.5, 3, 4.5, "Position sensor voltage at 100 % (fully open). Filled in by auto calibration.")
C.scalar("act_closedV2", "F32", "V", 1, 0, 5.5, 3, 4.5, "Second sensor voltage at 0 %. May be higher than the open voltage on inverted-slope sensors. Filled in by auto calibration.")
C.scalar("act_openV2", "F32", "V", 1, 0, 5.5, 3, 0.5, "Second sensor voltage at 100 %. Filled in by auto calibration.")
C.scalar("act_maxSensorDiff", "F32", "%", 1, 0.5, 50, 1, 5, "Tolerance between the two position sensors (rusEFI calls it the error detection threshold). Above it for the time below the mismatch fault is raised and the bridge is disabled.")
C.scalar("act_secondaryMaximum", "F32", "%", 1, 10, 100, 1, 53, "Travel at which the second sensor reaches its maximum. rusEFI values: Ford 53 %, Toyota ETCS-i about 65 %. Sensors are compared below 90 % of this value.")
C.scalar("act_sensorDiffTimeMs", "U16", "ms", 1, 10, 5000, 0, 100, "See maximum sensor difference.")
C.scalar("act_tuneCenter", "F32", "%", 1, 10, 90, 0, 50, "PID autotune: position the actuator oscillates around.")
C.scalar("act_tuneAmplitude", "F32", "%", 1, 5, 100, 0, 35, "PID autotune: duty swing applied each side of the holding duty.")
C.scalar("act_tuneCycles", "U08", "cycles", 1, 3, 50, 0, 10, "PID autotune: oscillation cycles averaged before the gains are written.")
C.scalar("act_fixedTarget", "F32", "%", 1, 0, 100, 1, 0, "Target used in Fixed position mode.")
C.scalar("act_failsafePos", "F32", "%", 1, 0, 100, 1, 0, "Target used by the Go to failsafe position option.")
C.scalar("act_pFactor", "F32", "", 1, 0, 1000, 4, 2.0, "Proportional gain, % duty per % position error.")
C.scalar("act_iFactor", "F32", "", 1, 0, 1000, 4, 5.0, "Integral gain.")
C.scalar("act_dFactor", "F32", "", 1, 0, 1000, 4, 0.05, "Derivative gain.")
C.scalar("act_offset", "F32", "%", 1, -100, 100, 1, 0, "Constant duty added to the PID output (holds against the return spring).")
C.scalar("act_iLimit", "F32", "%", 1, 0, 100, 1, 30, "Integral term clamp.")
C.scalar("act_minDuty", "F32", "%", 1, -100, 0, 1, -100, "Lowest duty (negative = closing direction).")
C.scalar("act_maxDuty", "F32", "%", 1, 0, 100, 1, 100, "Highest duty.")
C.scalar("act_deadband", "F32", "%", 1, 0, 10, 2, 0.3, "No correction while the error is inside this band.")
C.scalar("act_maxError", "F32", "%", 1, 1, 100, 1, 15, "Position error larger than this for the time below raises the actuator fault and disables the bridge.")
C.scalar("act_errorTimeMs", "U16", "ms", 1, 50, 10000, 0, 800, "See maximum error.")
C.scalar("act_sensorMinV", "F32", "V", 1, 0, 5.5, 2, 0.1, "Position sensor below this voltage is a fault.")
C.scalar("act_sensorMaxV", "F32", "V", 1, 0, 5.5, 2, 4.9, "Position sensor above this voltage is a fault.")
C.scalar("act_periodMs", "U08", "ms", 1, 1, 50, 0, 2, "Control loop period.")
C.array("act_xBins", "F32", (8,), "", 1, -100000, 100000, 2, [0, 1000, 2000, 3000, 4000, 5000, 6000, 7000])
C.array("act_yBins", "F32", (8,), "", 1, -100000, 100000, 2, [0, 40, 80, 120, 160, 200, 250, 300])
C.array("act_table", "U08", (8, 8), "%", 0.5, 0, 100, 1, [0] * 64)

PAGE = (C.off + 3) // 4 * 4

# ================================================================ OUTPUT CHANNELS
O.comment("Status")
O.scalar("seconds", "U32", "s", 1)
FAULTS = ["needBurnFw", "configError", "canBusOff", "ecuTimeout", "cmdTimeout", "v5Fault", "vbattLow"] + \
         ["an%dFault" % i for i in range(1, 9)] + ["egt%dFault" % i for i in range(1, 7)] + \
         ["egtWarn", "egtCrit", "egtSpreadWarn", "actFault", "actCalibrating", "actEnabled", "faultOutActive"]
O.bitset("U32", FAULTS)
O.bitset("U08", ["di%dState" % i for i in range(1, len(DI) + 1)])
O.bitset("U08", ["an%dSwitch" % i for i in range(1, 9)])
O.bitset("U16", ["out%dState" % i for i in range(1, 11)])
O.bitset("U08", ["fq%dFault" % i for i in range(1, 6)] + ["actSensorMismatch", "actAutotuning"])
O.scalar("calibrationMode", "U08", "", 1)
O.scalar("calibrationValue", "F32", "", 1)
O.scalar("vbatt", "U16", "V", 0.001)
O.scalar("v5Rail", "U16", "V", 0.001)
O.scalar("mcuTemp", "S16", "C", 0.1)
O.scalar("canErrCount", "U16", "", 1)
O.scalar("canRxCount", "U32", "", 1)
O.scalar("canTxCount", "U32", "", 1)
O.comment("Analog")
for i in range(1, 9):
    O.scalar("an%dVolts" % i, "U16", "V", 0.001)
for i in range(1, 9):
    O.scalar("an%dValue" % i, "F32", "", 1)
O.comment("EGT")
for i in range(1, 7):
    O.scalar("egt%d" % i, "S16", "C", 0.1)
for i in range(1, 7):
    O.scalar("egt%dVolts" % i, "U16", "V", 0.001)
for n in ["egtMax", "egtMin", "egtAvg", "egtSpread"]:
    O.scalar(n, "S16", "C", 0.1)
O.comment("Frequency")
for i in range(1, 6):
    O.scalar("fq%dHz" % i, "F32", "Hz", 1)
for i in range(1, 6):
    O.scalar("fq%dValue" % i, "F32", "", 1)
for i in range(1, 6):
    O.scalar("fq%dValue2" % i, "F32", "", 1)
O.comment("Outputs")
for i in range(1, 11):
    O.scalar("out%dDuty" % i, "U08", "%", 0.5)
O.comment("Actuator")
for n in ["actPosition", "actTarget", "actDuty", "actError"]:
    O.scalar(n, "S16", "%", 0.01)
O.scalar("actPosition2", "S16", "%", 0.01)
O.scalar("actPosDiff", "S16", "%", 0.01)
O.scalar("actPosVolts", "U16", "V", 0.001)
O.scalar("actPosVolts2", "U16", "V", 0.001)
for n in ["actTuneKu", "actTuneTu", "actTuneP", "actTuneI", "actTuneD"]:
    O.scalar(n, "F32", "", 1)
O.comment("Values received from the ECU")
for key, label, units, typ, scale, axis, glo, ghi in ECU:
    O.scalar("ecu" + key, typ, units, scale)
O.comment("Communication rates")
O.scalar("tsUsbRate", "U08", "1/s", 1)
O.scalar("tsSerialRate", "U08", "1/s", 1)
O.scalar("ecuFrameRate", "U16", "1/s", 1)
for i in range(12):
    O.scalar("ecuFrame%dRate" % i, "U08", "1/s", 1)
O.comment("Live table axis values")
for i in range(1, 11):
    O.scalar("out%dAxisX" % i, "F32", "", 1)
    O.scalar("out%dAxisY" % i, "F32", "", 1)
O.scalar("actAxisX", "F32", "", 1)
O.scalar("actAxisY", "F32", "", 1)
for i in range(1, 5):
    O.scalar("canUser%d" % i, "F32", "", 1)
OCH = (O.off + 3) // 4 * 4

# ================================================================ UI
# ---- board
dlg("boardAdc", "ADC and dividers")
for l, c in [("ADC reference", "adcVref"), ("AN1-AN8 input divider", "analogDivider"), ("AN1-AN8 input load", "analogInputLoad"), ("EGT input divider", "egtDivider"),
             ("Battery sense divider", "vbattDivider"), ("5 V rail sense divider", "v5Divider"), ("ADC oversampling", "adcOversample")]:
    fld(l, c)
dlg("boardSupply", "Supply monitoring")
for l, c in [("Sensor rail nominal", "v5Nominal"), ("Sensor rail tolerance", "v5Tolerance"),
             ("Battery low warning", "vbattLowWarn"), ("Output cutoff voltage", "vbattOutputCutoff")]:
    fld(l, c)
dlg("boardPwm", "PWM groups")
fld("PWM1-PWM4 frequency", "pwmFreqA")
fld("PWM5-PWM6 frequency", "pwmFreqB")
fld("Outputs in the same group always share one frequency.")
dlg("boardLive", "Live")
dialogs += ["\t\tgauge = vbattGauge", "\t\tgauge = v5Gauge"]
dlg("boardLeft", "")
pnl("boardAdc"); pnl("boardSupply"); pnl("boardPwm")
dlg("boardDlg", "Board settings", "xAxis")
pnl("boardLeft"); pnl("boardLive")

# ---- CAN
dlg("canBus", "Bus")
for l, c in [("Bitrate", "canBitrate"), ("Frame format", "canExtendedId"), ("Byte order", "canBigEndian"), ("Mode", "canListenOnly")]:
    fld(l, c)
dlg("canIds", "Board frames")
fld("Transmit base ID (decimal)", "canTxBaseId")
fld("Command base ID (decimal)", "canRxBaseId")
fld("Command timeout", "canCmdTimeoutMs")
dlg("canEcu", "ECU broadcast")
fld("Protocol", "canEcuProtocol")
fld("ECU base ID (decimal)", "canEcuBaseId", "canEcuProtocol != 0")
fld("ECU timeout", "canEcuTimeoutMs", "canEcuProtocol != 0")
dlg("canRates", "Send rates")
for l, c in [("Analog millivolts (+3, +4)", "canRateAnalog"), ("Analog values (+1, +2)", "canRateAnalogValue"), ("EGT (+5, +6)", "canRateEgt"),
             ("Frequency (+7, +8)", "canRateFreq"), ("Second values (+10, +11)", "canRateFreq2"),
             ("Status / digital (+0)", "canRateDigital"), ("Actuator (+9)", "canRateActuator"), ("Send digital on change", "canSendOnChange")]:
    fld(l, c)
fld("0 Hz = frame not sent")
dlg("canSerial", "Serial port (Bluetooth)")
fld("Baud rate", "serialBaud")
fld("PC10 = TX, PC11 = RX, 3.3 V levels")
dlg("canLeft", ""); pnl("canBus"); pnl("canIds")
dlg("canRight", ""); pnl("canEcu"); pnl("canRates"); pnl("canSerial")
dlg("canDlg", "CAN bus", "xAxis"); pnl("canLeft"); pnl("canRight")

# ---- analog
for i, (nm, pin) in enumerate(AN, 1):
    p = "an%d_" % i
    en = p + "mode != 0"
    dlg("an%dGen" % i, "Input")
    fld("Mode", p + "mode")
    fld("Sensor", p + "sensor", en)
    fld("Ratiometric (5 V rail)", p + "ratiometric", "%smode != 0 && %smode != 4" % (p, p))
    fld("Smoothing", p + "filter", en)
    fld("CAN scale", p + "canScale", "%smode != 0 && %smode != 4" % (p, p))
    dlg("an%dLin" % i, "Linear sensor")
    fld("Preset", p + "linPreset", p + "mode == 1")
    c = "%smode == 1 && %slinPreset == 0" % (p, p)
    fld("Voltage 1", p + "v1", c); fld("Value 1", p + "val1", c); fld("Voltage 2", p + "v2", c); fld("Value 2", p + "val2", c)
    dlg("an%dTherm" % i, "Thermistor")
    fld("Preset", p + "thermPreset", p + "mode == 2")
    fld("Pull-up resistor", p + "bias", p + "mode == 2")
    c = "%smode == 2 && %sthermPreset == 0" % (p, p)
    for k in (1, 2, 3):
        fld("Temperature %d" % k, p + "t%d" % k, c); fld("Resistance %d" % k, p + "r%d" % k, c)
    dlg("an%dOther" % i, "Custom curve / switch")
    fld("Custom curve", p + "curve", p + "mode == 3")
    fld("Switch threshold", p + "swThreshold", p + "mode == 4")
    fld("Switch hysteresis", p + "swHyst", p + "mode == 4")
    fld("Switch polarity", p + "swInvert", p + "mode == 4")
    dlg("an%dErr" % i, "Fault detection")
    c = "%smode != 0 && %smode != 4" % (p, p)
    fld("Fault below", p + "errLow", c); fld("Fault above", p + "errHigh", c)
    fld("Fault delay", p + "errDelayMs", c); fld("Fallback value", p + "fallback", c)
    dlg("an%dLive" % i, "Live")
    dialogs += ["\t\tgauge = an%dVoltsGauge" % i, "\t\tgauge = an%dValueGauge" % i]
    dlg("an%dLeft" % i, ""); pnl("an%dGen" % i); pnl("an%dLin" % i); pnl("an%dOther" % i)
    dlg("an%dMid" % i, ""); pnl("an%dTherm" % i); pnl("an%dErr" % i)
    dlg("an%dDlg" % i, "Analog input %s (%s)" % (nm, pin), "xAxis")
    pnl("an%dLeft" % i); pnl("an%dMid" % i); pnl("an%dLive" % i)
    ggauge("Analog inputs", "an%dVoltsGauge" % i, "an%dVolts" % i, "%s voltage" % nm, "V", 0, 5, 0.1, 4.9, 2, 2)
    ggauge("Analog inputs", "an%dValueGauge" % i, "an%dValue" % i, "%s value" % nm, "", 0, 1000, 0, 1000, 1, 1)
    log("an%dValue" % i, "%s value" % nm); log("an%dVolts" % i, "%s V" % nm, "float", "%.3f")
for i, L in enumerate("ABCD", 1):
    curves += ["", '\tcurve = curve%dDlg, "Custom curve %s"' % (i, L), '\t\tcolumnLabel = "Voltage", "Value"',
               "\t\txAxis = 0, 5, 6", "\t\tyAxis = 0, 1000, 6",
               "\t\txBins = curve%d_bins" % i, "\t\tyBins = curve%d_values" % i]
    dialog_names.add("curve%dDlg" % i)

# ---- EGT
dlg("egtAmp", "Amplifier")
for l, c in [("Gain", "egtGain"), ("Output at 0 C", "egtZeroV"), ("Open probe above", "egtOpenV"), ("Smoothing", "egtFilter")]:
    fld(l, c)
dlg("egtProt", "Warnings")
for l, c in [("Warning temperature", "egtWarnTemp"), ("Critical temperature", "egtCritTemp"), ("Maximum cylinder spread", "egtSpreadMax"),
             ("Spread check above average", "egtSpreadMinTemp"), ("Alarm delay", "egtAlarmDelayMs")]:
    fld(l, c)
for i, (nm, pin) in enumerate(EGT, 1):
    dlg("egt%dCh" % i, "%s (%s)" % (nm, pin))
    fld("Enabled", "egt%d_enable" % i)
    fld("Position", "egt%d_position" % i, "egt%d_enable" % i)
    fld("Trim", "egt%d_trim" % i, "egt%d_enable" % i)
    ggauge("EGT", "egt%dGauge" % i, "egt%d" % i, nm, "C", 0, 1100, 900, 950, 0, 0)
    log("egt%d" % i, nm, "float", "%.0f")
dlg("egtLeft", ""); pnl("egtAmp"); pnl("egtProt")
dlg("egtMid", ""); pnl("egt1Ch"); pnl("egt2Ch"); pnl("egt3Ch")
dlg("egtRight", ""); pnl("egt4Ch"); pnl("egt5Ch"); pnl("egt6Ch")
dlg("egtDlg", "EGT", "xAxis"); pnl("egtLeft"); pnl("egtMid"); pnl("egtRight")
for n, t in [("egtMax", "EGT max"), ("egtMin", "EGT min"), ("egtAvg", "EGT average")]:
    ggauge("EGT", n + "Gauge", n, t, "C", 0, 1100, 900, 950, 0, 0); log(n, t, "float", "%.0f")
ggauge("EGT", "egtSpreadGauge", "egtSpread", "EGT spread", "C", 0, 300, 100, 150, 0, 0); log("egtSpread", "EGT spread", "float", "%.0f")

# ---- frequency
for i, (nm, pin) in enumerate(FQ, 1):
    p = "fq%d_" % i
    en = p + "mode != 0"
    gen = "(%smode == 1 || %smode == 2 || %smode == 3 || %smode == 5 || %smode == 6)" % ((p,) * 5)
    cus = "(%smode == 9 && %ssentType == 2)" % (p, p)
    free = "(%s || %s)" % (gen, cus)
    dlg("fq%dGen" % i, "Input")
    fld("Mode", p + "mode"); fld("Edge", p + "edge", gen, True); fld("Internal pull", p + "pull", en)
    fld("Smoothing", p + "filter", en); fld("Timeout", p + "timeoutMs", en); fld("Noise filter", p + "minPeriodUs", gen, True)
    dlg("fq%dCal" % i, "Value")
    fld("Value is", p + "sensor", free, True)
    fld("CAN scale", p + "canScale", free, True)
    fld("Pulses per revolution", p + "pulsesPerRev", "%smode == 2 || %smode == 3" % (p, p), True)
    fld("Tyre circumference", p + "circumference", p + "mode == 2", True)
    fld("Multiplier", p + "mult", "%smode == 1 || %smode == 6 || %s" % (p, p, cus), True)
    fld("Offset", p + "offset", "%smode == 1 || %s" % (p, cus), True)
    fld("Fitted to", p + "medium", p + "mode == 7", True)
    fld("Pressure reading", p + "gauge", p + "mode == 7", True)
    fld("Atmospheric pressure", p + "baro", "%smode == 7 && %sgauge == 1" % (p, p), True)
    fld("SENT sensor type", p + "sentType", p + "mode == 9", True)
    fld("SENT tick time", p + "sentTickUs", p + "mode == 9", True)
    dlg("fq%dDig" % i, "Second value (SENT custom only)")
    fld("Second value is", p + "sensor2", cus, True)
    fld("Second value CAN scale", p + "canScale2", cus, True)
    fld("Second value multiplier", p + "mult2", cus, True)
    fld("Second value offset", p + "offset2", cus, True)
    dlg("fq%dInfo" % i, "Preset sensors")
    fld("Flex fuel: value = ethanol %, second value = fuel temperature")
    fld("Hella pressure + temp: value = pressure kPa, second value = temperature C")
    fld("Hella oil level + temp: value = level mm, second value = temperature C")
    fld("SENT GM fuel pressure: value = pressure kPa, second value = temperature C")
    fld("SENT throttle: value = track 1 %, second value = track 2 %")
    fld("Preset sensors need no calibration. On CAN both values are sent x10.")
    dlg("fq%dLive" % i, "Live")
    dialogs += ["\t\tgauge = fq%dValueGauge" % i, "\t\tgauge = fq%dValue2Gauge" % i]
    dlg("fq%dLeft" % i, ""); pnl("fq%dGen" % i)
    dlg("fq%dMid" % i, ""); pnl("fq%dCal" % i); pnl("fq%dDig" % i, cus); pnl("fq%dInfo" % i)
    dlg("fq%dDlg" % i, "Frequency / digital sensor input %s (%s)" % (nm, pin), "xAxis"); pnl("fq%dLeft" % i); pnl("fq%dMid" % i); pnl("fq%dLive" % i)
    ggauge("Frequency inputs", "fq%dValue2Gauge" % i, "fq%dValue2" % i, "%s secondary value" % nm, "", 0, 200, 0, 200, 1, 1)
    log("fq%dValue2" % i, "%s value 2" % nm)
    ggauge("Frequency inputs", "fq%dHzGauge" % i, "fq%dHz" % i, "%s frequency" % nm, "Hz", 0, 5000, 0, 5000, 1, 1)
    ggauge("Frequency inputs", "fq%dValueGauge" % i, "fq%dValue" % i, "%s value" % nm, "", 0, 300, 0, 300, 1, 1)
    log("fq%dValue" % i, "%s value" % nm); log("fq%dHz" % i, "%s Hz" % nm, "float", "%.1f")

# ---- digital
for i, (nm, pin) in enumerate(DI, 1):
    p = "di%d_" % i
    dlg("di%dCh" % i, "%s (%s)" % (nm, pin))
    fld("Enabled", p + "enable"); fld("Polarity", p + "invert", p + "enable")
    fld("Internal pull", p + "pull", p + "enable"); fld("Debounce", p + "debounce", p + "enable")
    log("di%dState" % i, nm, "int", "%d")
dlg("diLeft", ""); pnl("di1Ch"); pnl("di2Ch")
dlg("diRight", ""); pnl("di3Ch"); pnl("di4Ch")
dlg("diDlg", "Digital inputs", "xAxis"); pnl("diLeft"); pnl("diRight")

# ---- outputs
for i, (nm, pin, pwm) in enumerate(OUT, 1):
    p = "out%d_" % i
    en = p + "mode != 0"
    tb = p + "mode == 2 || (%smode == 1 && %sfailsafe == 3)" % (p, p)
    onoff = ("%spwm == 0 && (%s)" % (p, tb)) if pwm else tb
    dlg("out%dGen" % i, "Output")
    fld("Mode", p + "mode", "faultOut_pin != %d || %smode != 0" % (i, p))
    fld("Mode is locked to Disabled while this is the fault output")
    if pwm:
        fld("Type", p + "pwm", en)
        fld("Frequency is set per group in Board settings")
    fld("Polarity", p + "invert", en)
    fld("On CAN command loss", p + "failsafe", p + "mode == 1")
    if pwm:
        fld("Minimum duty", p + "minDuty", "%s && %spwm == 1" % (en, p))
        fld("Maximum duty", p + "maxDuty", "%s && %spwm == 1" % (en, p))
    dlg("out%dTblSet" % i, "Table settings")
    fld("X axis", p + "axisX", tb); fld("Y axis", p + "axisY", tb)
    fld("Duty if axis faulted", p + "dutyIfError", tb)
    fld("On above", p + "onAbove", onoff); fld("Off below", p + "offBelow", onoff)
    fld("On delay", p + "onDelayMs", onoff); fld("Off delay", p + "offDelayMs", onoff)
    dlg("out%dTest" % i, "Test")
    dialogs += ['\t\tcommandButton = "On", cmd_out%d_on' % i, '\t\tcommandButton = "Off", cmd_out%d_off' % i,
                '\t\tcommandButton = "Release", cmd_out%d_release' % i]
    dlg("out%dLeft" % i, ""); pnl("out%dGen" % i); pnl("out%dTblSet" % i); pnl("out%dTest" % i)
    dlg("out%dDlg" % i, "Output %s (%s)" % (nm, pin), "xAxis"); pnl("out%dLeft" % i); pnl("out%dTbl" % i, tb)
    tables += ["", '\ttable = out%dTbl, out%dMap, "%s duty", 1' % (i, i, nm),
               "\t\txyLabels = {bitStringValue(axisLabels, %saxisX)}, {bitStringValue(axisLabels, %saxisY)}" % (p, p),
               "\t\txBins = %sxBins, out%dAxisX" % (p, i), "\t\tyBins = %syBins, out%dAxisY" % (p, i),
               "\t\tzBins = %stable" % p, "\t\tgridHeight = 2.0", '\t\tupDownLabel = "(MORE)", "(LESS)"']
    dialog_names.add("out%dTbl" % i)
    ggauge("Outputs", "out%dDutyGauge" % i, "out%dDuty" % i, "%s duty" % nm, "%", 0, 100, 0, 100, 1, 1)
    log("out%dDuty" % i, "%s duty" % nm, "float", "%.1f")

dlg("faultOutDlg", "Fault / warning output")
fld("Output", "faultOut_pin")
for l, c in [("Sensor fault", "faultOut_onSensor"), ("EGT warning", "faultOut_onEgtWarn"), ("EGT critical", "faultOut_onEgtCrit"),
             ("EGT probe open", "faultOut_onEgtProbe"), ("CAN timeout", "faultOut_onCan"), ("Actuator fault", "faultOut_onActuator"),
             ("Style", "faultOut_blink")]:
    fld(l, c, "faultOut_pin != 0")

# ---- actuator
A = "act_mode != 0"
dlg("actGen", "Actuator")
fld("Function", "act_mode"); fld("Position sensor input", "act_posChannel", A)
fld("Second position sensor (optional)", "act_posChannel2", A); fld("Motor direction", "act_invertDir", A)
fld("PWM frequency", "act_pwmFreq", A); fld("Control period", "act_periodMs", A)
dlg("actCal", "Position calibration")
fld("Closed (0 %) voltage", "act_closedV", A); fld("Open (100 %) voltage", "act_openV", A)
R = A + " && act_posChannel2 != 0"
fld("Second sensor closed voltage", "act_closedV2", R); fld("Second sensor open (or saturated) voltage", "act_openV2", R)
dialogs += ['\t\tcommandButton = "Auto calibrate", cmd_act_autocal', '\t\tcommandButton = "Stop", cmd_act_stop']
dlg("actTune", "PID autotune")
fld("Oscillate around", "act_tuneCenter", A); fld("Duty swing", "act_tuneAmplitude", A); fld("Cycles", "act_tuneCycles", A)
dialogs += ['\t\tcommandButton = "Start PID autotune", cmd_act_autotune', '\t\tcommandButton = "Stop autotune", cmd_act_autotune_stop']
fld("Gains are written to the PID fields when it finishes. Burn to keep them.")
dlg("actTarget", "Target")
fld("Target source", "act_targetSource", A)
fld("Fixed target", "act_fixedTarget", A + " && act_targetSource == 2")
fld("On CAN command loss", "act_failsafe", A + " && act_targetSource == 0")
fld("Failsafe position", "act_failsafePos", A + " && act_targetSource == 0 && act_failsafe == 1")
T = A + " && (act_targetSource == 1 || (act_targetSource == 0 && act_failsafe == 2))"
fld("Table X axis", "act_axisX", T); fld("Table Y axis", "act_axisY", T)
dlg("actPid", "PID")
for l, c in [("P", "act_pFactor"), ("I", "act_iFactor"), ("D", "act_dFactor"), ("Feed forward duty", "act_offset"),
             ("I limit", "act_iLimit"), ("Minimum duty", "act_minDuty"), ("Maximum duty", "act_maxDuty"), ("Deadband", "act_deadband")]:
    fld(l, c, A)
dlg("actSafe", "Safety")
for l, c in [("Maximum error", "act_maxError"), ("Error time", "act_errorTimeMs"), ("Sensor fault below", "act_sensorMinV"),
             ("Sensor fault above", "act_sensorMaxV")]:
    fld(l, c, A)
dlg("actRed", "Second sensor (redundancy)")
fld("Comparison mode", "act_redundancy", R)
fld("Second sensor maximum at", "act_secondaryMaximum", R + " && act_redundancy == 1")
fld("Tolerance between sensors", "act_maxSensorDiff", R + " && act_redundancy != 2")
fld("Tolerance time", "act_sensorDiffTimeMs", R + " && act_redundancy != 2")
dlg("actLive", "Live")
dialogs += ["\t\tgauge = actPositionGauge", "\t\tgauge = actTargetGauge", "\t\tgauge = actDutyGauge"]
dlg("actLeft", ""); pnl("actGen"); pnl("actCal"); pnl("actTarget")
dlg("actMid", ""); pnl("actPid"); pnl("actTune"); pnl("actSafe"); pnl("actRed")
dlg("actDlg", "H-bridge actuator (wastegate / bypass)", "xAxis"); pnl("actLeft"); pnl("actMid"); pnl("actLive")
tables += ["", '\ttable = actTbl, actMap, "Actuator target position", 1',
           "\t\txyLabels = {bitStringValue(axisLabels, act_axisX)}, {bitStringValue(axisLabels, act_axisY)}",
           "\t\txBins = act_xBins, actAxisX", "\t\tyBins = act_yBins, actAxisY", "\t\tzBins = act_table",
           "\t\tgridHeight = 2.0", '\t\tupDownLabel = "(MORE OPEN)", "(LESS OPEN)"']
dialog_names.add("actTbl")
for n, t, lo, hi in [("actPosition", "Actuator position", 0, 100), ("actTarget", "Actuator target", 0, 100),
                     ("actDuty", "Actuator duty", -100, 100), ("actError", "Actuator error", -50, 50),
                     ("actPosition2", "Actuator position (sensor 2)", 0, 100), ("actPosDiff", "Actuator sensor difference", -20, 20)]:
    ggauge("Actuator", n + "Gauge", n, t, "%", lo, hi, lo, hi, 1, 1); log(n, t)

# ---- misc gauges / log
ggauge("Board", "vbattGauge", "vbatt", "Battery", "V", 6, 18, 10.5, 15.5, 2, 2)
ggauge("Board", "v5Gauge", "v5Rail", "Sensor 5V rail", "V", 4, 6, 4.75, 5.25, 3, 3)
ggauge("Board", "mcuTempGauge", "mcuTemp", "MCU temperature", "C", -40, 125, -20, 85, 0, 0)
for key, label, units, typ, scale, axis, glo, ghi in ECU:
    dig = 0 if scale >= 1 else (1 if scale >= 0.05 else (2 if scale >= 0.005 else 3))
    ggauge("ECU", "ecu%sGauge" % key, "ecu" + key, label, units, glo, ghi, glo, ghi, dig, dig)
    if typ in ("U08", "S08") and scale == 1 or (typ == "U16" and scale == 1):
        log("ecu" + key, label, "int", "%d")
    else:
        log("ecu" + key, label, "float", "%%.%df" % max(dig, 1))
ggauge("Board", "tsUsbRateGauge", "tsUsbRate", "USB reads per second", "1/s", 0, 100, 0, 100, 0, 0)
ggauge("Board", "tsSerialRateGauge", "tsSerialRate", "Serial reads per second", "1/s", 0, 100, 0, 100, 0, 0)
ggauge("Board", "ecuFrameRateGauge", "ecuFrameRate", "ECU frames per second", "1/s", 0, 2000, 0, 2000, 0, 0)
for c, l in [("vbatt", "Battery V"), ("v5Rail", "5V rail"), ("mcuTemp", "MCU temp")]:
    log(c, l)
for c, l in [("tsUsbRate", "USB reads/s"), ("tsSerialRate", "Serial reads/s"), ("ecuFrameRate", "ECU frames/s")] + [("ecuFrame%dRate" % i, "ECU frame +%d /s" % i) for i in range(12)]:
    log(c, l, "int", "%d")
for c, l in [("seconds", "Uptime"), ("canRxCount", "CAN rx"), ("canTxCount", "CAN tx"), ("canErrCount", "CAN errors")]:
    log(c, l, "int", "%d")
for f in FAULTS + ["fq%dFault" % i for i in range(1, 6)] + ["actSensorMismatch", "actAutotuning"]:
    log(f, f, "int", "%d")

# ---- pin usage / conflict view (computed channels + indicator panels)
comp_lines = []
def comp(name, expr):
    O.names.add(name)
    comp_lines.append("\t%s = { %s }" % (name, expr))

def ipanel(name, cols):
    dialog_names.add(name)
    dialogs.append("")
    dialogs.append("\tindicatorPanel = %s, %d" % (name, cols))

def ind(expr, off, on, col="green"):
    dialogs.append('\t\tindicator = { %s }, "%s", "%s", white, black, %s, black' % (expr, off, on, col))

for i in range(1, 11):
    comp("out%dTblActive" % i, "(out%d_mode == 2 || (out%d_mode == 1 && out%d_failsafe == 3)) ? 1 : 0" % (i, i, i))
comp("actTblActive", "(act_mode != 0 && (act_targetSource == 1 || (act_targetSource == 0 && act_failsafe == 2))) ? 1 : 0")

def axis_used(label):
    k = AXIS.index(label)
    t = ["(out%dTblActive && (out%d_axisX == %d || out%d_axisY == %d))" % (i, i, k, i, k) for i in range(1, 11)]
    t.append("(actTblActive && (act_axisX == %d || act_axisY == %d))" % (k, k))
    return "(" + " || ".join(t) + ")"

bad_axis = []
ipanel("useAnalog", 4)
for i, (nm, pin) in enumerate(AN, 1):
    comp("an%dIsPos" % i, "(act_mode != 0 && (act_posChannel == %d || act_posChannel2 == %d)) ? 1 : 0" % (i, i))
    comp("an%dBadAxis" % i, "(an%d_mode == 0 && %s) ? 1 : 0" % (i, axis_used("%s value" % nm)))
    bad_axis.append("an%dBadAxis" % i)
    ind("an%d_mode != 0 || an%dIsPos" % (i, i), "%s (%s) free" % (nm, pin), "%s (%s) used" % (nm, pin))
ipanel("useOutputs", 4)
for i, (nm, pin, pwm) in enumerate(OUT, 1):
    ind("out%d_mode != 0 || faultOut_pin == %d" % (i, i), "%s (%s) free" % (nm, pin), "%s (%s) used" % (nm, pin))
ind("act_mode != 0", "H-bridge free", "H-bridge used")
def simple(panel, items, used_expr, axis_fmt, kind):
    ipanel(panel, 4)
    for i, (nm, pin) in enumerate(items, 1):
        comp("%s%dBadAxis" % (kind, i), "(!(%s) && %s) ? 1 : 0" % (used_expr % i, axis_used(axis_fmt % nm)))
        bad_axis.append("%s%dBadAxis" % (kind, i))
        ind(used_expr % i, "%s (%s) free" % (nm, pin), "%s (%s) used" % (nm, pin))
simple("useFreq", FQ, "fq%d_mode != 0", "%s value", "fq")
simple("useDigital", DI, "di%d_enable == 1", "%s state", "di")
simple("useEgt", EGT, "egt%d_enable == 1", "%s C", "egt")

comp("cfFaultOut", "(" + " || ".join("(faultOut_pin == %d && out%d_mode != 0)" % (i, i) for i in range(1, 11)) + ") ? 1 : 0")
comp("cfPosMissing", "(act_mode != 0 && act_posChannel == 0) ? 1 : 0")
comp("cfPosSame", "(act_mode != 0 && act_posChannel != 0 && act_posChannel == act_posChannel2) ? 1 : 0")
comp("cfPosDisabled", "(" + " || ".join("(an%dIsPos && (an%d_mode == 0 || an%d_mode == 4))" % (i, i, i) for i in range(1, 9)) + ") ? 1 : 0")
comp("cfBadAxis", "(" + " || ".join(bad_axis) + ") ? 1 : 0")
comp("pinConflict", "(cfFaultOut || cfPosMissing || cfPosSame || cfPosDisabled || cfBadAxis) ? 1 : 0")
ipanel("useConflicts", 1)
ind("pinConflict", "No conflicts", "CONFLICT FOUND", "red")
ind("cfFaultOut", "Fault output pin OK", "Fault output pin is also used as a normal output", "red")
ind("cfPosMissing", "Actuator position sensor OK", "Actuator has no position sensor selected", "red")
ind("cfPosSame", "Actuator sensors on different inputs", "Both actuator sensors are on the same input", "red")
ind("cfPosDisabled", "Actuator sensor inputs enabled", "Actuator sensor is on a disabled or switch input", "red")
ind("cfBadAxis", "Table axes OK", "A table axis uses a disabled input", "red")

for nm, t in [("useConflictsBox", "Conflicts"), ("useAnalogBox", "Analog inputs"), ("useOutputsBox", "Outputs and H-bridge"),
              ("useFreqBox", "Frequency inputs"), ("useDigitalBox", "Digital inputs"), ("useEgtBox", "EGT")]:
    dlg(nm, t); pnl(nm[:-3])
dlg("useDlg", "Pin usage and conflicts")
for nm in ["useConflictsBox", "useAnalogBox", "useOutputsBox", "useFreqBox", "useDigitalBox", "useEgtBox"]:
    pnl(nm)

# ---- tools
dlg("toolsDlg", "Controller")
dialogs += ['\t\tcommandButton = "Reboot board", cmd_reset_controller', '\t\tcommandButton = "Reboot to DFU (firmware update)", cmd_dfu',
            '\t\tcommandButton = "Restore default settings", cmd_set_defaults',
            '\t\tcommandButton = "Release all output tests", cmd_release_all']

# ---- menus
def menu(title, items):
    menus.append('\tmenu = "%s"' % title)
    for it in items:
        if it is None:
            menus.append("\t\tsubMenu = std_separator")
        else:
            menus.append('\t\tsubMenu = %s, "%s"%s' % (it[0], it[1], (", 0, {%s}" % it[2]) if len(it) > 2 else ""))

menu("&Board", [("useDlg", "Pin usage and conflicts"), None, ("boardDlg", "Board settings"), ("canDlg", "CAN bus"), None, ("faultOutDlg", "Fault / warning output"), None, ("toolsDlg", "Controller")])
menu("&Analog", [("an%dDlg" % i, "%s (%s)" % a) for i, a in enumerate(AN, 1)] + [None] +
     [("curve%dDlg" % i, "Custom curve %s" % L) for i, L in enumerate("ABCD", 1)])
menu("&EGT", [("egtDlg", "EGT probes")])
menu("&Frequency", [("fq%dDlg" % i, "%s (%s)" % f) for i, f in enumerate(FQ, 1)])
menu("&Digital", [("diDlg", "Digital inputs")])
menu("&Outputs", [("out%dDlg" % i, "%s (%s)" % (o[0], o[1])) for i, o in enumerate(OUT, 1)])
menu("Ac&tuator", [("actDlg", "Actuator setup"), ("actTbl", "Target table", A)])

# ---- commands: 'Z' + u16 subsystem + u16 index (big endian), same shape as rusEFI
cmds = []
for i in range(1, 11):
    cmds.append('cmd_out%d_on = "Z\\x00\\x10\\x00\\x%02x"' % (i, i))
    cmds.append('cmd_out%d_off = "Z\\x00\\x11\\x00\\x%02x"' % (i, i))
    cmds.append('cmd_out%d_release = "Z\\x00\\x12\\x00\\x%02x"' % (i, i))
cmds += ['cmd_release_all = "Z\\x00\\x12\\x00\\x00"', 'cmd_act_autocal = "Z\\x00\\x20\\x00\\x00"', 'cmd_act_stop = "Z\\x00\\x20\\x00\\x01"', 'cmd_act_autotune = "Z\\x00\\x20\\x00\\x02"', 'cmd_act_autotune_stop = "Z\\x00\\x20\\x00\\x03"',
         'cmd_set_defaults = "Z\\x00\\x30\\x00\\x00"', 'cmd_reset_controller = "Z\\x00\\xbb\\x00\\x00"', 'cmd_dfu = "Z\\x00\\xba\\x00\\x00"']
cmd_names = {c.split(" = ")[0] for c in cmds}

# ================================================================ EMIT
out = []
w = out.append
w("; TunerStudio definition for the CAN IO expander on the WeAct STM32F405RG core board")
w("; Generated by gen_ini.py - do not edit offsets by hand, edit the generator and regenerate.")
w(";")
w("; Config page: %d bytes, little endian, fields in file order with natural C alignment." % PAGE)
w("; Output channel block: %d bytes." % OCH)
w(";")
w("; Pin map")
for grp, lst in [("Analog", AN), ("EGT", EGT), ("Frequency", FQ), ("Digital in", DI), ("Outputs", [(o[0], o[1]) for o in OUT])]:
    w(";   %-11s %s" % (grp, ", ".join("%s=%s" % x for x in lst)))
w(";   Diagnostics 5V rail=PB0, battery=PB1   H-bridge PWM=PB14 DIR=PB15 DIS=PB13   CAN RX=PB8 TX=PB9   USB PA11/PA12")
w(";")
w("; Serial protocol (same as rusEFI, CRC32 envelope msEnvelope_1.0):")
w(";   S hello/signature, V firmware version, O output channels, R read, C chunk write, B burn, k CRC, Z command")
w(";")
w("; CAN frames sent by the board (ID = canTxBaseId + n, 8 bytes, byte order per canBigEndian)")
w(";   +0 status   : u32 fault bits (same order as the status bits below), u8 DI bits, u8 AN switch bits, u16 output state bits")
w(";   +1 analog A : AN1..AN4 value, s16 each, multiplied by the input CAN scale")
w(";   +2 analog B : AN5..AN8 value, s16 each")
w(";   +3 volts A  : AN1..AN4 voltage, u16 mV each")
w(";   +4 volts B  : AN5..AN8 voltage, u16 mV each")
w(";   +5 EGT A    : EGT1..EGT4, s16 0.1 C each")
w(";   +6 EGT B    : EGT5, EGT6, EGT max, EGT spread, s16 0.1 C each")
w(";   +7 freq A   : FREQ1..FREQ4 value, u16 each, multiplied by the input CAN scale")
w(";   +8 freq B   : FREQ5 value u16, battery u16 mV, 5V rail u16 mV, MCU temp s16 0.1 C")
w(";   +9 actuator : position s16 0.01 %, target s16 0.01 %, duty s16 0.01 %, state u8, reserved u8")
w(";   +10 freq 2 A: FREQ1..FREQ4 secondary value (Flex fuel temp, Hella temp, SENT channel 2), s16 each, multiplied by CAN scale 2")
w(";   +11 freq 2 B: FREQ5 secondary value s16, actuator position sensor 2 s16 0.01 %, sensor difference s16 0.01 %, u8 fault bits 2, reserved u8")
w("; calibrationMode values: 1 closedV, 2 openV, 3 closedV2, 4 openV2, 5 P, 6 I, 7 D (0 = idle)")
w("; CAN frames accepted by the board (ID = canRxBaseId + n)")
w(";   +0 outputs  : u16 state bits for OUT1..OUT10 (on/off outputs and PWM outputs in on/off type), 6 bytes reserved")
w(";   +1 duties   : PWM1..PWM6 duty, u8 0.5 % each, 2 bytes reserved")
w(";   +2 actuator : target s16 0.01 %, u8 enable, 5 bytes reserved")
w(";   +3 user A   : CAN user value 1 and 2, f32 each")
w(";   +4 user B   : CAN user value 3 and 4, f32 each")
w("")
w("[MegaTune]")
w('\tsignature = "%s"' % SIG)
w("")
w("[TunerStudio]")
w('\tqueryCommand = "S"')
w('\tversionInfo = "V"')
w('\tsignature = "%s"' % SIG)
w("\tuseLegacyFTempUnits = false")
w("\tignoreMissingBitOptions = true")
w("\tnoCommReadDelay = true")
w("\tdefaultRuntimeRecordPerSec = 50")
w("")
w("[Constants]")
w("\tmessageEnvelopeFormat = msEnvelope_1.0")
w("\tendianness = little")
w("\tnPages = 1")
w('\tpageIdentifier = "\\x00\\x00"')
w("\tpageSize = %d" % PAGE)
w('\tpageReadCommand = "R\\x00\\x00%2o%2c"')
w('\tburnCommand = "B\\x00\\x00"')
w('\tpageValueWrite = "W\\x00\\x00%2o%v"')
w('\tpageChunkWrite = "C\\x00\\x00%2o%2c%v"')
w('\tcrc32CheckCommand = "k\\x00\\x00%2o%2c"')
w('\tretrieveConfigError = "e"')
w("\tpageActivationDelay = 500")
w("\twriteBlocks = on")
w("\tinterWriteDelay = 0")
w("\tblockReadTimeout = 3000")
w("\tblockingFactor = 256")
w("")
w("page = 1")
out += C.lines
w("")
w("[PcVariables]")
w("\taxisLabels = bits, U08, [0:6], %s" % ", ".join('"%s"' % a for a in AXIS_FULL))
w("")
w("[ConstantsExtensions]")
for n in C.power:
    w("\trequiresPowerCycle = %s" % n)
for n, v in C.defaults:
    w("\tdefaultValue = %s, %s" % (n, v))
w("\t; same mechanism as rusEFI: the firmware reports calibrationMode / calibrationValue and TunerStudio writes the constant")
for k, n in enumerate(["act_closedV", "act_openV", "act_closedV2", "act_openV2", "act_pFactor", "act_iFactor", "act_dFactor"], 1):
    w("\tmaintainConstantValue = %s, { (calibrationMode == %d) ? calibrationValue : %s }" % (n, k, n))
w("")
w("[SettingContextHelp]")
for n, h in C.help:
    w('\t%s = "%s"' % (n, h))
w("")
w("[OutputChannels]")
w('\tochGetCommand = "O%2o%2c"')
w("\tochBlockSize = %d" % OCH)
out += O.lines
w("")
w("; ---- computed in TunerStudio from the settings: pin usage and conflict detection")
w("; the firmware must apply the same rules and set configError when pinConflict would be true")
out += comp_lines
w("")
w("[CurveEditor]")
out += curves
w("")
w("[TableEditor]")
out += tables
w("")
w("[GaugeConfigurations]")
cat = None
for c, l in gauges:
    if c != cat:
        w('gaugeCategory = "%s"' % c)
        cat = c
    w(l)
w("")
w("[FrontPage]")
for k, g in enumerate(["egtMaxGauge", "egtSpreadGauge", "actPositionGauge", "actTargetGauge", "vbattGauge", "v5Gauge", "ecuRpmGauge", "ecuMapGauge"], 1):
    w("\tgauge%d = %s" % (k, g))
IND = [("pinConflict", "Pins OK", "PIN CONFLICT", "red"), ("needBurnFw", "Settings saved", "Unsaved changes", "yellow"), ("configError", "Config OK", "Config error", "red"),
       ("canBusOff", "CAN OK", "CAN bus off", "red"), ("ecuTimeout", "ECU alive", "ECU timeout", "red"),
       ("cmdTimeout", "Commands OK", "Command timeout", "yellow"), ("v5Fault", "5V rail OK", "5V rail fault", "red"),
       ("vbattLow", "Battery OK", "Battery low", "yellow"), ("egtWarn", "EGT OK", "EGT warning", "yellow"),
       ("egtCrit", "EGT OK", "EGT critical", "red"), ("egtSpreadWarn", "EGT spread OK", "EGT spread", "yellow"),
       ("actFault", "Actuator OK", "Actuator fault", "red"), ("actCalibrating", "", "Actuator calibrating", "yellow"),
       ("actEnabled", "Bridge off", "Bridge on", "green"), ("faultOutActive", "", "Fault output on", "red")]
IND += [("actSensorMismatch", "Position sensors agree", "Position sensor mismatch", "red"), ("actAutotuning", "", "PID autotune running", "yellow")]
IND += [("an%dFault" % i, "AN%d OK" % i, "AN%d fault" % i, "red") for i in range(1, 9)]
IND += [("fq%dFault" % i, "FREQ%d OK" % i, "FREQ%d sensor fault" % i, "red") for i in range(1, 6)]
IND += [("egt%dFault" % i, "EGT%d OK" % i, "EGT%d open" % i, "red") for i in range(1, 7)]
IND += [("di%dState" % i, "DI%d off" % i, "DI%d on" % i, "green") for i in range(1, len(DI) + 1)]
IND += [("ecu" + k, l + " off", l + " on", "green") for k, l in [(e[0], e[1]) for e in ECU if e[2] == "" and e[3] == "U08" and e[0] not in ("Flex",)]]
IND += [("out%dState" % i, "%s off" % OUT[i - 1][0], "%s on" % OUT[i - 1][0], "green") for i in range(1, 11)]
for ch, a, b, col in IND:
    w('\tindicator = { %s }, "%s", "%s", white, black, %s, black' % (ch, a, b, col))
w("")
w("[Datalog]")
out += datalog
w("")
w("[Menu]")
w("menuDialog = main")
out += menus
w("")
w("[ControllerCommands]")
out += cmds
w("")
w("[UserDefined]")
out += dialogs
w("")
text = "\n".join(out) + "\n"

# ================================================================ VALIDATE
errs = []
known = set(C.names) | O.names | {"axisLabels", "bitStringValue"}
for m in re.finditer(r"\{([^}]*)\}", text):
    for ident in re.findall(r"[A-Za-z_][A-Za-z0-9_]*", m.group(1)):
        if ident not in known:
            errs.append("unknown identifier in expression: " + ident)
for line in dialogs:
    m = re.match(r'\s*field = "[^"]*", (\w+)', line)
    if m and m.group(1) not in C.names:
        errs.append("field -> " + m.group(1))
    m = re.match(r"\s*panel = (\w+)", line)
    if m and m.group(1) not in dialog_names:
        errs.append("panel -> " + m.group(1))
    m = re.match(r"\s*gauge = (\w+)", line)
    if m and m.group(1) not in gauge_names:
        errs.append("gauge -> " + m.group(1))
    m = re.match(r'\s*commandButton = "[^"]*", (\w+)', line)
    if m and m.group(1) not in cmd_names:
        errs.append("cmd -> " + m.group(1))
for line in menus:
    m = re.match(r"\s*subMenu = (\w+)", line)
    if m and m.group(1) != "std_separator" and m.group(1) not in dialog_names:
        errs.append("menu -> " + m.group(1))
for line in tables + curves:
    m = re.match(r"\s*[xyz]Bins = (\w+)(?:, (\w+))?", line)
    if m:
        if m.group(1) not in C.names:
            errs.append("bins -> " + m.group(1))
        if m.group(2) and m.group(2) not in O.names:
            errs.append("bins channel -> " + m.group(2))
for line in datalog:
    m = re.match(r"\s*entry = (\w+)", line)
    if m.group(1) not in O.names:
        errs.append("log -> " + m.group(1))
for c, l in gauges:
    m = re.match(r"\s*\w+ = (\w+)", l)
    if m.group(1) not in O.names:
        errs.append("gauge chan -> " + m.group(1))
for ch, *_ in IND:
    if ch not in O.names:
        errs.append("indicator -> " + ch)
try:
    text.encode("ascii")
except UnicodeEncodeError as e:
    errs.append("non-ascii: %s" % e)
if errs:
    print("\n".join(sorted(set(errs))))
    sys.exit(1)
open(sys.argv[1], "w").write(text)
print("OK page=%d och=%d constants=%d channels=%d dialogs=%d lines=%d" %
      (PAGE, OCH, len(C.names), len(O.names), len(dialog_names), len(out)))

# ================================================================ C EXPORT (firmware headers generated from the same layout)
if len(sys.argv) > 2:
    CT = {"U08": "uint8_t", "S08": "int8_t", "U16": "uint16_t", "S16": "int16_t", "U32": "uint32_t", "S32": "int32_t", "F32": "float"}
    h = ["/* Generated by gen_ini.py together with the TunerStudio ini - do not edit by hand. */", "#pragma once", "#include <stdint.h>", "#include <stddef.h>", "",
         '#define TS_SIGNATURE "%s"' % SIG, "#define CONFIG_PAGE_SIZE %d" % PAGE, "#define OUTPUT_BLOCK_SIZE %d" % OCH, "",
         "typedef struct {"]
    SZ = {"U08": 1, "S08": 1, "U16": 2, "S16": 2, "U32": 4, "S32": 4, "F32": 4}
    cpos, cpad = 0, 0
    for name, typ, cnt, o, scale, d in C.fields:
        if o > cpos:
            h.append("\tuint8_t _gap%d[%d];" % (cpad, o - cpos)); cpad += 1
        h.append("\t%s %s%s;" % (CT[typ], name, "[%d]" % cnt if cnt > 1 else ""))
        cpos = o + SZ[typ] * cnt
    if PAGE > cpos:
        h.append("\tuint8_t _gap%d[%d];" % (cpad, PAGE - cpos))
    h += ["} config_t;", ""]
    for name, typ, cnt, o, scale, d in C.fields:
        h.append("_Static_assert(offsetof(config_t, %s) == %d, \"%s\");" % (name, o, name))
    h += ["_Static_assert(sizeof(config_t) == CONFIG_PAGE_SIZE, \"config size\");", "", "typedef struct {"]
    for name, typ, o, scale, bits in O.fields:
        h.append("\t%s %s;" % (CT[typ], name))
    h += ["} outputs_t;", ""]
    for name, typ, o, scale, bits in O.fields:
        h.append("_Static_assert(offsetof(outputs_t, %s) == %d, \"%s\");" % (name, o, name))
        if bits:
            for i, b in enumerate(bits):
                if b:
                    h.append("#define OCH_BIT_%s (1u << %d) /* in %s */" % (b, i, name))
    h += ["_Static_assert(sizeof(outputs_t) <= OUTPUT_BLOCK_SIZE, \"outputs size\");", ""]
    for name, typ, o, scale, bits in O.fields:
        if not bits and str(scale) != "1":
            h.append("#define OCH_SCALE_%s %sf" % (name, scale))
    for name, typ, cnt, o, scale, d in C.fields:
        if str(scale) != "1":
            h.append("#define CFG_SCALE_%s %sf" % (name, scale))
    import collections
    groups = collections.OrderedDict()
    for name, typ, cnt, o, scale, d in C.fields:
        m = re.match(r"^(an|egt|fq|di|out|curve)(\d+)_(\w+)$", name)
        if m:
            groups.setdefault(m.group(1), collections.OrderedDict()).setdefault(int(m.group(2)), []).append((m.group(3), typ, cnt, o))
    for g, chans in groups.items():
        idx = sorted(chans)
        base = [f[3] for f in chans[idx[0]]][0]
        stride = (chans[idx[1]][0][3] - base) if len(idx) > 1 else 0
        rel0 = [(f[0], f[1], f[2], f[3] - base) for f in chans[idx[0]]]
        for k in idx:
            relk = [(f[0], f[1], f[2], f[3] - (base + stride * (k - idx[0]))) for f in chans[k]]
            assert relk == rel0, (g, k)
        h.append("typedef struct __attribute__((packed)) {")
        pos, pad = 0, 0
        for fn, typ, cnt, ro in rel0:
            if ro > pos:
                h.append("\tuint8_t _pad%d[%d];" % (pad, ro - pos)); pad += 1
            h.append("\t%s %s%s;" % (CT[typ], fn, "[%d]" % cnt if cnt > 1 else ""))
            pos = ro + SIZES[typ] * cnt
        if stride > pos:
            h.append("\tuint8_t _pad%d[%d];" % (pad, stride - pos))
        h.append("} %s_cfg_t;" % g)
        h.append("_Static_assert(sizeof(%s_cfg_t) == %d, \"%s stride\");" % (g, stride, g))
        h.append("#define CFG_%s_COUNT %d" % (g.upper(), len(idx)))
        h.append("#define CFG_%s(c, i) ((%s_cfg_t *)((uint8_t *)(c) + %d + (i) * %d))" % (g.upper(), g, base, stride))
        h.append("")
    # ECU values: index enum, where each one goes in the output block, and which axis entries map to them
    h.append("enum {")
    for e in ECU:
        h.append("\tECU_%s," % e[0])
    h += ["\tECU_COUNT", "};", "",
          "typedef struct { uint16_t offset; uint8_t type; float scale; } ecu_och_t;   /* type: 0 U08, 1 S08, 2 U16, 3 S16 */",
          "extern const ecu_och_t ecuOch[ECU_COUNT];",
          "#define AXIS_COUNT %d" % len(AXIS),
          "extern const int8_t axisEcu[AXIS_COUNT];   /* ECU value index of each table axis source, -1 = not an ECU value */", ""]
    h += ["", "void config_generated_defaults(config_t *c);", ""]
    open(sys.argv[2] + "/canio_layout.h", "w").write("\n".join(h))
    c = ["/* Generated by gen_ini.py - default values, same as the ini [ConstantsExtensions] defaultValue lines. */", '#include "canio_layout.h"', "",
         "void config_generated_defaults(config_t *c) {"]
    for name, typ, cnt, o, scale, d in C.fields:
        if d is None:
            continue
        vals = d if isinstance(d, (list, tuple)) else [d]
        def raw(v):
            v = float(v) / float(scale)
            return ("%rf" % v) if typ == "F32" else str(int(round(v)))
        if cnt == 1:
            c.append("\tc->%s = %s;" % (name, raw(vals[0])))
        else:
            c.append("\t{ static const %s d[%d] = {%s}; for (unsigned i = 0; i < %d; i++) c->%s[i] = d[i]; }" % (CT[typ], cnt, ", ".join(raw(v) for v in vals), cnt, name))
    c += ["}", ""]
    ooff = dict((f[0], f[2]) for f in O.fields)
    TY = {"U08": 0, "S08": 1, "U16": 2, "S16": 3}
    c.append("const ecu_och_t ecuOch[ECU_COUNT] = {")
    for e in ECU:
        c.append("\t{ %d, %d, %rf },   /* %s */" % (ooff["ecu" + e[0]], TY[e[3]], float(e[4]), e[0]))
    c += ["};", "", "const int8_t axisEcu[AXIS_COUNT] = {"]
    lab = dict((e[1], k) for k, e in enumerate(ECU))
    c.append("\t" + ", ".join(str(lab.get(a, -1)) for a in AXIS))
    c += ["};", ""]
    open(sys.argv[2] + "/canio_layout.c", "w").write("\n".join(c))
    print("C export written:", len(C.fields), "config fields,", len(O.fields), "output fields")
