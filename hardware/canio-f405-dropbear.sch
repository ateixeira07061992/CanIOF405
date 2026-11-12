<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no" />
<setting verticaltext="up" />
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch" />
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="yes" active="yes" />
<layer number="16" name="Bottom" color="1" fill="1" visible="yes" active="yes" />
<layer number="17" name="Pads" color="2" fill="1" visible="yes" active="yes" />
<layer number="18" name="Vias" color="2" fill="1" visible="yes" active="yes" />
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="yes" />
<layer number="20" name="Dimension" color="15" fill="1" visible="yes" active="yes" />
<layer number="21" name="tPlace" color="7" fill="1" visible="yes" active="yes" />
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="yes" />
<layer number="23" name="tOrigins" color="15" fill="1" visible="yes" active="yes" />
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="yes" />
<layer number="25" name="tNames" color="7" fill="1" visible="yes" active="yes" />
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="yes" />
<layer number="27" name="tValues" color="7" fill="1" visible="yes" active="yes" />
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="yes" />
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="yes" />
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="yes" />
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="yes" />
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="yes" />
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="yes" />
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="yes" />
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="yes" />
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="yes" />
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="yes" />
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="yes" />
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="yes" />
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="yes" />
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="yes" />
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="yes" />
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="yes" />
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="yes" />
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="yes" />
<layer number="46" name="Milling" color="3" fill="1" visible="yes" active="yes" />
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="yes" />
<layer number="48" name="Document" color="7" fill="1" visible="no" active="yes" />
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="yes" />
<layer number="51" name="tDocu" color="6" fill="1" visible="yes" active="yes" />
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="yes" />
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes" />
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes" />
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes" />
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes" />
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes" />
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes" />
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes" />
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes" />
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no" />
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no" />
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no" />
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no" />
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no" />
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no" />
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no" />
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no" />
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no" />
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no" />
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no" />
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no" />
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no" />
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no" />
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="canio">
<description>Symbols drawn for this project. Packages are copied from the original EAGLE libraries.</description>
<packages>
<package name="MSOP08">
<description>&lt;b&gt;8-Lead micro SO&lt;/b&gt; (RM-8)&lt;p&gt;
Source: http://www.analog.com/UploadedFiles/Data_Sheets/703465986AD8611_2_0.pdf</description>
<wire x1="1.624" y1="1.299" x2="1.624" y2="-1.301" width="0.1524" layer="21" />
<wire x1="-1.626" y1="-1.301" x2="-1.626" y2="1.299" width="0.1524" layer="21" />
<wire x1="1.299" y1="1.624" x2="1.624" y2="1.299" width="0.1524" layer="21" curve="-90" />
<wire x1="-1.626" y1="1.299" x2="-1.301" y2="1.624" width="0.1524" layer="21" curve="-90" />
<wire x1="-1.626" y1="-1.301" x2="-1.301" y2="-1.626" width="0.1524" layer="21" curve="90" />
<wire x1="1.299" y1="-1.626" x2="1.624" y2="-1.301" width="0.1524" layer="21" curve="90" />
<wire x1="-1.341" y1="-1.626" x2="1.299" y2="-1.626" width="0.1524" layer="21" />
<wire x1="-1.301" y1="1.624" x2="1.299" y2="1.624" width="0.1524" layer="21" />
<circle x="-1.0456" y="-1.0406" radius="0.2448" width="0.0508" layer="21" />
<smd name="8" x="-0.976" y="2.262" dx="0.4" dy="1" layer="1" />
<smd name="7" x="-0.326" y="2.262" dx="0.4" dy="1" layer="1" />
<smd name="6" x="0.324" y="2.262" dx="0.4" dy="1" layer="1" />
<smd name="5" x="0.974" y="2.262" dx="0.4" dy="1" layer="1" />
<smd name="4" x="0.974" y="-2.263" dx="0.4" dy="1" layer="1" />
<smd name="3" x="0.324" y="-2.263" dx="0.4" dy="1" layer="1" />
<smd name="2" x="-0.326" y="-2.263" dx="0.4" dy="1" layer="1" />
<smd name="1" x="-0.976" y="-2.263" dx="0.4" dy="1" layer="1" />
<text x="-2.032" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.302" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.0975" y1="1.65" x2="-0.8537" y2="2.5057" layer="51" />
<rectangle x1="-0.4475" y1="1.65" x2="-0.2037" y2="2.5057" layer="51" />
<rectangle x1="0.2025" y1="1.65" x2="0.4463" y2="2.5057" layer="51" />
<rectangle x1="0.8525" y1="1.65" x2="1.0963" y2="2.5057" layer="51" />
<rectangle x1="-1.0975" y1="-2.5069" x2="-0.8537" y2="-1.65" layer="51" />
<rectangle x1="-0.4475" y1="-2.5069" x2="-0.2037" y2="-1.65" layer="51" />
<rectangle x1="0.2025" y1="-2.5069" x2="0.4463" y2="-1.65" layer="51" />
<rectangle x1="0.8525" y1="-2.5069" x2="1.0963" y2="-1.65" layer="51" />
</package>
<package name="SO08">
<description>&lt;b&gt;Small Outline Package 8&lt;/b&gt;&lt;br&gt;
NS Package M08A</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51" />
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51" />
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51" />
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51" />
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51" />
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51" />
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51" />
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1" />
<text x="-2.667" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.937" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.15" y1="-3.1" x2="-1.66" y2="-2" layer="51" />
<rectangle x1="-0.88" y1="-3.1" x2="-0.39" y2="-2" layer="51" />
<rectangle x1="0.39" y1="-3.1" x2="0.88" y2="-2" layer="51" />
<rectangle x1="1.66" y1="-3.1" x2="2.15" y2="-2" layer="51" />
<rectangle x1="1.66" y1="2" x2="2.15" y2="3.1" layer="51" />
<rectangle x1="0.39" y1="2" x2="0.88" y2="3.1" layer="51" />
<rectangle x1="-0.88" y1="2" x2="-0.39" y2="3.1" layer="51" />
<rectangle x1="-2.15" y1="2" x2="-1.66" y2="3.1" layer="51" />
</package>
<package name="SOT223">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt;</description>
<wire x1="3.2766" y1="1.778" x2="3.2766" y2="-1.778" width="0.2032" layer="21" />
<wire x1="3.2766" y1="-1.778" x2="-3.2766" y2="-1.778" width="0.2032" layer="21" />
<wire x1="-3.2766" y1="-1.778" x2="-3.2766" y2="1.778" width="0.2032" layer="21" />
<wire x1="-3.2766" y1="1.778" x2="3.2766" y2="1.778" width="0.2032" layer="21" />
<smd name="1" x="-2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1" />
<smd name="2" x="0" y="-3.0988" dx="1.2192" dy="2.2352" layer="1" />
<smd name="3" x="2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1" />
<smd name="4" x="0" y="3.099" dx="3.6" dy="2.2" layer="1" />
<text x="1.0208" y="-4.318" size="0.8128" layer="21" ratio="12">3</text>
<text x="1.905" y="2.54" size="0.8128" layer="21" ratio="12">4</text>
<text x="-3.4526" y="-4.318" size="0.8128" layer="21" ratio="12">1</text>
<text x="-1.2906" y="-4.3274" size="0.8128" layer="21" ratio="12">2</text>
<text x="-2.54" y="0.0508" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.3208" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51" />
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51" />
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51" />
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51" />
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51" />
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51" />
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51" />
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51" />
</package>
<package name="SO14">
<description>&lt;b&gt;Small Outline Package 14&lt;/b&gt;</description>
<wire x1="4.305" y1="-1.9" x2="-4.305" y2="-1.9" width="0.2032" layer="51" />
<wire x1="-4.305" y1="-1.9" x2="-4.305" y2="-1.4" width="0.2032" layer="51" />
<wire x1="-4.305" y1="-1.4" x2="-4.305" y2="1.9" width="0.2032" layer="51" />
<wire x1="4.305" y1="-1.4" x2="-4.305" y2="-1.4" width="0.2032" layer="51" />
<wire x1="4.305" y1="1.9" x2="4.305" y2="-1.4" width="0.2032" layer="51" />
<wire x1="4.305" y1="-1.4" x2="4.305" y2="-1.9" width="0.2032" layer="51" />
<wire x1="-4.305" y1="1.9" x2="4.305" y2="1.9" width="0.2032" layer="51" />
<smd name="2" x="-2.54" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="13" x="-2.54" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="1" x="-3.81" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="3" x="-1.27" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="4" x="0" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="14" x="-3.81" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="12" x="-1.27" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="11" x="0" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="6" x="2.54" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="9" x="2.54" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="5" x="1.27" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="7" x="3.81" y="-2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="10" x="1.27" y="2.6" dx="0.6" dy="2.2" layer="1" />
<smd name="8" x="3.81" y="2.6" dx="0.6" dy="2.2" layer="1" />
<text x="-4.572" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.842" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.055" y1="-3.1" x2="-3.565" y2="-2" layer="51" />
<rectangle x1="-2.785" y1="-3.1" x2="-2.295" y2="-2" layer="51" />
<rectangle x1="-1.515" y1="-3.1" x2="-1.025" y2="-2" layer="51" />
<rectangle x1="-0.245" y1="-3.1" x2="0.245" y2="-2" layer="51" />
<rectangle x1="-0.245" y1="2" x2="0.245" y2="3.1" layer="51" />
<rectangle x1="-1.515" y1="2" x2="-1.025" y2="3.1" layer="51" />
<rectangle x1="-2.785" y1="2" x2="-2.295" y2="3.1" layer="51" />
<rectangle x1="-4.055" y1="2" x2="-3.565" y2="3.1" layer="51" />
<rectangle x1="1.025" y1="-3.1" x2="1.515" y2="-2" layer="51" />
<rectangle x1="2.295" y1="-3.1" x2="2.785" y2="-2" layer="51" />
<rectangle x1="3.565" y1="-3.1" x2="4.055" y2="-2" layer="51" />
<rectangle x1="3.565" y1="2" x2="4.055" y2="3.1" layer="51" />
<rectangle x1="2.295" y1="2" x2="2.785" y2="3.1" layer="51" />
<rectangle x1="1.025" y1="2" x2="1.515" y2="3.1" layer="51" />
</package>
<package name="SOT23">
<description>&lt;B&gt;DIODE&lt;/B&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51" />
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="-0.1524" x2="-1.4224" y2="0.6604" width="0.1524" layer="21" />
<wire x1="-1.4224" y1="0.6604" x2="-0.8636" y2="0.6604" width="0.1524" layer="21" />
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.1524" width="0.1524" layer="21" />
<wire x1="0.8636" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="21" />
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1" />
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1" />
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1" />
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51" />
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51" />
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51" />
</package>
<package name="PG-DSO-12-11">
<description>Infineon PG-DSO-12-11, exposed pad 4.5 x 8.1 mm. Converted from the KiCad library footprint Infineon_PG-DSO-12-11.</description>
<smd name="1" x="-4.8" y="2.5" dx="2" dy="0.65" layer="1" />
<smd name="13" x="0.0" y="-0.0" dx="4.5" dy="8.1" layer="1" />
<smd name="2" x="-4.8" y="1.5" dx="2" dy="0.65" layer="1" />
<smd name="3" x="-4.8" y="0.5" dx="2" dy="0.65" layer="1" />
<smd name="4" x="-4.8" y="-0.5" dx="2" dy="0.65" layer="1" />
<smd name="5" x="-4.8" y="-1.5" dx="2" dy="0.65" layer="1" />
<smd name="6" x="-4.8" y="-2.5" dx="2" dy="0.65" layer="1" />
<smd name="7" x="4.8" y="-2.5" dx="2" dy="0.65" layer="1" />
<smd name="8" x="4.8" y="-1.5" dx="2" dy="0.65" layer="1" />
<smd name="9" x="4.8" y="-0.5" dx="2" dy="0.65" layer="1" />
<smd name="10" x="4.8" y="0.5" dx="2" dy="0.65" layer="1" />
<smd name="11" x="4.8" y="1.5" dx="2" dy="0.65" layer="1" />
<smd name="12" x="4.8" y="2.5" dx="2" dy="0.65" layer="1" />
<wire x1="-6.1" y1="4.35" x2="6.1" y2="4.35" width="0.127" layer="51" />
<wire x1="6.1" y1="4.35" x2="6.1" y2="-4.35" width="0.127" layer="51" />
<wire x1="6.1" y1="-4.35" x2="-6.1" y2="-4.35" width="0.127" layer="51" />
<wire x1="-6.1" y1="-4.35" x2="-6.1" y2="4.35" width="0.127" layer="51" />
<text x="-6.1" y="4.949999999999999" size="1.27" layer="25">&gt;NAME</text>
<text x="-6.1" y="-6.25" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SICMA24-BLACK">
<description>Aptiv / Delphi Sicma 24-way right angle header (black). Hole pattern converted from the Speeduino kicad-parts footprint Delphi_Sicma_24_Black. Pins 1 and 8 of each row are the wider-spaced positions.</description>
<pad name="C7" x="-8.325" y="7.5" drill="1.3" diameter="2" />
<pad name="C6" x="-4.995" y="7.5" drill="1.3" diameter="2" />
<pad name="C5" x="-1.665" y="7.5" drill="1.3" diameter="2" />
<pad name="C4" x="1.665" y="7.5" drill="1.3" diameter="2" />
<pad name="C3" x="4.995" y="7.5" drill="1.3" diameter="2" />
<pad name="C2" x="8.325" y="7.5" drill="1.3" diameter="2" />
<pad name="B2" x="8.325" y="11.7" drill="1.3" diameter="2" />
<pad name="B3" x="4.995" y="11.7" drill="1.3" diameter="2" />
<pad name="B4" x="1.665" y="11.7" drill="1.3" diameter="2" />
<pad name="B5" x="-1.665" y="11.7" drill="1.3" diameter="2" />
<pad name="B6" x="-4.995" y="11.7" drill="1.3" diameter="2" />
<pad name="B7" x="-8.325" y="11.7" drill="1.3" diameter="2" />
<pad name="A7" x="-8.325" y="15.9" drill="1.3" diameter="2" />
<pad name="A6" x="-4.995" y="15.9" drill="1.3" diameter="2" />
<pad name="A2" x="8.325" y="15.9" drill="1.3" diameter="2" />
<pad name="A3" x="4.995" y="15.9" drill="1.3" diameter="2" />
<pad name="A5" x="-1.665" y="15.9" drill="1.3" diameter="2" />
<pad name="A4" x="1.665" y="15.9" drill="1.3" diameter="2" />
<pad name="B1" x="12.475" y="11.7" drill="1.3" diameter="2" />
<pad name="B8" x="-12.475" y="11.7" drill="1.3" diameter="2" />
<pad name="A1" x="12.475" y="15.9" drill="1.3" diameter="2" />
<pad name="A8" x="-12.475" y="15.9" drill="1.3" diameter="2" />
<pad name="C1" x="12.475" y="7.5" drill="1.3" diameter="2" />
<pad name="C8" x="-12.475" y="7.5" drill="1.3" diameter="2" />
<wire x1="-13.775" y1="17.2" x2="13.775" y2="17.2" width="0.127" layer="51" />
<wire x1="13.775" y1="17.2" x2="13.775" y2="6.2" width="0.127" layer="51" />
<wire x1="13.775" y1="6.2" x2="-13.775" y2="6.2" width="0.127" layer="51" />
<wire x1="-13.775" y1="6.2" x2="-13.775" y2="17.2" width="0.127" layer="51" />
<text x="-13.775" y="17.8" size="1.27" layer="25">&gt;NAME</text>
<text x="-13.775" y="4.300000000000001" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SICMA24-GREY">
<description>Aptiv / Delphi Sicma 24-way right angle header (grey). Hole pattern converted from the Speeduino kicad-parts footprint Delphi_Sicma_24_Grey. Pins 1 and 8 of each row are the wider-spaced positions.</description>
<pad name="C7" x="-8.325" y="7.5" drill="1.3" diameter="2" />
<pad name="C6" x="-4.995" y="7.5" drill="1.3" diameter="2" />
<pad name="C5" x="-1.665" y="7.5" drill="1.3" diameter="2" />
<pad name="C4" x="1.665" y="7.5" drill="1.3" diameter="2" />
<pad name="C3" x="4.995" y="7.5" drill="1.3" diameter="2" />
<pad name="C2" x="8.325" y="7.5" drill="1.3" diameter="2" />
<pad name="B2" x="8.325" y="11.7" drill="1.3" diameter="2" />
<pad name="B3" x="4.995" y="11.7" drill="1.3" diameter="2" />
<pad name="B4" x="1.665" y="11.7" drill="1.3" diameter="2" />
<pad name="B5" x="-1.665" y="11.7" drill="1.3" diameter="2" />
<pad name="B6" x="-4.995" y="11.7" drill="1.3" diameter="2" />
<pad name="B7" x="-8.325" y="11.7" drill="1.3" diameter="2" />
<pad name="A7" x="-8.325" y="15.9" drill="1.3" diameter="2" />
<pad name="A6" x="-4.995" y="15.9" drill="1.3" diameter="2" />
<pad name="A2" x="8.325" y="15.9" drill="1.3" diameter="2" />
<pad name="A3" x="4.995" y="15.9" drill="1.3" diameter="2" />
<pad name="A5" x="-1.665" y="15.9" drill="1.3" diameter="2" />
<pad name="A4" x="1.665" y="15.9" drill="1.3" diameter="2" />
<pad name="B1" x="12.475" y="11.7" drill="1.3" diameter="2" />
<pad name="B8" x="-12.475" y="11.7" drill="1.3" diameter="2" />
<pad name="A1" x="12.475" y="15.9" drill="1.3" diameter="2" />
<pad name="A8" x="-12.475" y="15.9" drill="1.3" diameter="2" />
<pad name="C1" x="12.475" y="7.5" drill="1.3" diameter="2" />
<pad name="C8" x="-12.475" y="7.5" drill="1.3" diameter="2" />
<wire x1="-13.775" y1="17.2" x2="13.775" y2="17.2" width="0.127" layer="51" />
<wire x1="13.775" y1="17.2" x2="13.775" y2="6.2" width="0.127" layer="51" />
<wire x1="13.775" y1="6.2" x2="-13.775" y2="6.2" width="0.127" layer="51" />
<wire x1="-13.775" y1="6.2" x2="-13.775" y2="17.2" width="0.127" layer="51" />
<text x="-13.775" y="17.8" size="1.27" layer="25">&gt;NAME</text>
<text x="-13.775" y="4.300000000000001" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="AD8497">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94" />
<wire x1="10.16" y1="7.62" x2="10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="7.62" width="0.254" layer="94" />
<text x="-10.16" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+IN" x="-15.24" y="5.08" length="middle" />
<pin name="-IN" x="-15.24" y="2.54" length="middle" />
<pin name="REF" x="-15.24" y="0.0" length="middle" />
<pin name="-VS" x="-15.24" y="-2.54" length="middle" />
<pin name="+VS" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="OUT" x="15.24" y="2.54" length="middle" rot="R180" />
<pin name="SENSE" x="15.24" y="0.0" length="middle" rot="R180" />
</symbol>
<symbol name="TJA1051T3">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94" />
<wire x1="10.16" y1="7.62" x2="10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="7.62" width="0.254" layer="94" />
<text x="-10.16" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="TXD" x="-15.24" y="5.08" length="middle" />
<pin name="RXD" x="-15.24" y="2.54" length="middle" />
<pin name="S" x="-15.24" y="0.0" length="middle" />
<pin name="GND" x="-15.24" y="-2.54" length="middle" />
<pin name="VCC" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="VIO" x="15.24" y="2.54" length="middle" rot="R180" />
<pin name="CANH" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="CANL" x="15.24" y="-2.54" length="middle" rot="R180" />
</symbol>
<symbol name="NCV8402">
<wire x1="-10.16" y1="2.54" x2="10.16" y2="2.54" width="0.254" layer="94" />
<wire x1="10.16" y1="2.54" x2="10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="2.54" width="0.254" layer="94" />
<text x="-10.16" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IN" x="-15.24" y="0.0" length="middle" />
<pin name="DRAIN" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="SOURCE" x="15.24" y="-2.54" length="middle" rot="R180" />
</symbol>
<symbol name="TLV9004">
<wire x1="-10.16" y1="12.7" x2="10.16" y2="12.7" width="0.254" layer="94" />
<wire x1="10.16" y1="12.7" x2="10.16" y2="-10.16" width="0.254" layer="94" />
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94" />
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="12.7" width="0.254" layer="94" />
<text x="-10.16" y="13.969999999999999" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-13.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+INA" x="-15.24" y="10.16" length="middle" />
<pin name="-INA" x="-15.24" y="7.62" length="middle" />
<pin name="+INB" x="-15.24" y="5.08" length="middle" />
<pin name="-INB" x="-15.24" y="2.54" length="middle" />
<pin name="+INC" x="-15.24" y="0.0" length="middle" />
<pin name="-INC" x="-15.24" y="-2.539999999999999" length="middle" />
<pin name="+IND" x="-15.24" y="-5.08" length="middle" />
<pin name="-IND" x="-15.24" y="-7.620000000000001" length="middle" />
<pin name="V+" x="15.24" y="10.16" length="middle" rot="R180" />
<pin name="OUTA" x="15.24" y="7.62" length="middle" rot="R180" />
<pin name="OUTB" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="OUTC" x="15.24" y="2.54" length="middle" rot="R180" />
<pin name="OUTD" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="V-" x="15.24" y="-2.539999999999999" length="middle" rot="R180" />
</symbol>
<symbol name="PFET-SO8">
<wire x1="-10.16" y1="2.54" x2="10.16" y2="2.54" width="0.254" layer="94" />
<wire x1="10.16" y1="2.54" x2="10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="2.54" width="0.254" layer="94" />
<text x="-10.16" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="G" x="-15.24" y="0.0" length="middle" />
<pin name="D" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="S" x="15.24" y="-2.54" length="middle" rot="R180" />
</symbol>
<symbol name="NUP2105L">
<wire x1="-10.16" y1="2.54" x2="10.16" y2="2.54" width="0.254" layer="94" />
<wire x1="10.16" y1="2.54" x2="10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" />
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="2.54" width="0.254" layer="94" />
<text x="-10.16" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="CANH" x="-15.24" y="0.0" length="middle" />
<pin name="CANL" x="-15.24" y="-2.54" length="middle" />
<pin name="GND" x="15.24" y="0.0" length="middle" rot="R180" />
</symbol>
<symbol name="TLE9201SG">
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94" />
<wire x1="10.16" y1="10.16" x2="10.16" y2="-10.16" width="0.254" layer="94" />
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94" />
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="10.16" width="0.254" layer="94" />
<text x="-10.16" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-13.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="PWM" x="-15.24" y="7.62" length="middle" />
<pin name="DIR" x="-15.24" y="5.08" length="middle" />
<pin name="DIS" x="-15.24" y="2.54" length="middle" />
<pin name="CSN" x="-15.24" y="0.0" length="middle" />
<pin name="SCK" x="-15.24" y="-2.54" length="middle" />
<pin name="SI" x="-15.24" y="-5.079999999999999" length="middle" />
<pin name="SO" x="-15.24" y="-7.62" length="middle" />
<pin name="VS" x="15.24" y="7.62" length="middle" rot="R180" />
<pin name="VSO" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="OUT1" x="15.24" y="2.54" length="middle" rot="R180" />
<pin name="OUT2" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="GND" x="15.24" y="-2.54" length="middle" rot="R180" />
</symbol>
<symbol name="SICMA24-BLACK">
<wire x1="-10.16" y1="17.78" x2="10.16" y2="17.78" width="0.254" layer="94" />
<wire x1="10.16" y1="17.78" x2="10.16" y2="-15.240000000000002" width="0.254" layer="94" />
<wire x1="10.16" y1="-15.240000000000002" x2="-10.16" y2="-15.240000000000002" width="0.254" layer="94" />
<wire x1="-10.16" y1="-15.240000000000002" x2="-10.16" y2="17.78" width="0.254" layer="94" />
<text x="-10.16" y="19.05" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-18.240000000000002" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A1" x="-15.24" y="15.24" length="middle" />
<pin name="A2" x="-15.24" y="12.7" length="middle" />
<pin name="A3" x="-15.24" y="10.16" length="middle" />
<pin name="A4" x="-15.24" y="7.62" length="middle" />
<pin name="A5" x="-15.24" y="5.08" length="middle" />
<pin name="A6" x="-15.24" y="2.540000000000001" length="middle" />
<pin name="A7" x="-15.24" y="0.0" length="middle" />
<pin name="A8" x="-15.24" y="-2.540000000000001" length="middle" />
<pin name="B1" x="-15.24" y="-5.08" length="middle" />
<pin name="B2" x="-15.24" y="-7.619999999999999" length="middle" />
<pin name="B3" x="-15.24" y="-10.159999999999998" length="middle" />
<pin name="B4" x="-15.24" y="-12.700000000000001" length="middle" />
<pin name="B5" x="15.24" y="15.24" length="middle" rot="R180" />
<pin name="B6" x="15.24" y="12.7" length="middle" rot="R180" />
<pin name="B7" x="15.24" y="10.16" length="middle" rot="R180" />
<pin name="B8" x="15.24" y="7.62" length="middle" rot="R180" />
<pin name="C1" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="C2" x="15.24" y="2.540000000000001" length="middle" rot="R180" />
<pin name="C3" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="C4" x="15.24" y="-2.540000000000001" length="middle" rot="R180" />
<pin name="C5" x="15.24" y="-5.08" length="middle" rot="R180" />
<pin name="C6" x="15.24" y="-7.619999999999999" length="middle" rot="R180" />
<pin name="C7" x="15.24" y="-10.159999999999998" length="middle" rot="R180" />
<pin name="C8" x="15.24" y="-12.700000000000001" length="middle" rot="R180" />
</symbol>
<symbol name="SICMA24-GREY">
<wire x1="-10.16" y1="17.78" x2="10.16" y2="17.78" width="0.254" layer="94" />
<wire x1="10.16" y1="17.78" x2="10.16" y2="-15.240000000000002" width="0.254" layer="94" />
<wire x1="10.16" y1="-15.240000000000002" x2="-10.16" y2="-15.240000000000002" width="0.254" layer="94" />
<wire x1="-10.16" y1="-15.240000000000002" x2="-10.16" y2="17.78" width="0.254" layer="94" />
<text x="-10.16" y="19.05" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-18.240000000000002" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A1" x="-15.24" y="15.24" length="middle" />
<pin name="A2" x="-15.24" y="12.7" length="middle" />
<pin name="A3" x="-15.24" y="10.16" length="middle" />
<pin name="A4" x="-15.24" y="7.62" length="middle" />
<pin name="A5" x="-15.24" y="5.08" length="middle" />
<pin name="A6" x="-15.24" y="2.540000000000001" length="middle" />
<pin name="A7" x="-15.24" y="0.0" length="middle" />
<pin name="A8" x="-15.24" y="-2.540000000000001" length="middle" />
<pin name="B1" x="-15.24" y="-5.08" length="middle" />
<pin name="B2" x="-15.24" y="-7.619999999999999" length="middle" />
<pin name="B3" x="-15.24" y="-10.159999999999998" length="middle" />
<pin name="B4" x="-15.24" y="-12.700000000000001" length="middle" />
<pin name="B5" x="15.24" y="15.24" length="middle" rot="R180" />
<pin name="B6" x="15.24" y="12.7" length="middle" rot="R180" />
<pin name="B7" x="15.24" y="10.16" length="middle" rot="R180" />
<pin name="B8" x="15.24" y="7.62" length="middle" rot="R180" />
<pin name="C1" x="15.24" y="5.08" length="middle" rot="R180" />
<pin name="C2" x="15.24" y="2.540000000000001" length="middle" rot="R180" />
<pin name="C3" x="15.24" y="0.0" length="middle" rot="R180" />
<pin name="C4" x="15.24" y="-2.540000000000001" length="middle" rot="R180" />
<pin name="C5" x="15.24" y="-5.08" length="middle" rot="R180" />
<pin name="C6" x="15.24" y="-7.619999999999999" length="middle" rot="R180" />
<pin name="C7" x="15.24" y="-10.159999999999998" length="middle" rot="R180" />
<pin name="C8" x="15.24" y="-12.700000000000001" length="middle" rot="R180" />
</symbol>
</symbols>
<devicesets>
<deviceset name="AD8497" prefix="U" uservalue="yes">
<description>AD8497ARMZ thermocouple amplifier (MSOP-8)</description>
<gates>
<gate name="G$1" symbol="AD8497" x="0" y="0" />
</gates>
<devices>
<device name="" package="MSOP08">
<connects>
<connect gate="G$1" pin="+IN" pad="8" />
<connect gate="G$1" pin="-IN" pad="1" />
<connect gate="G$1" pin="REF" pad="2" />
<connect gate="G$1" pin="-VS" pad="3" />
<connect gate="G$1" pin="+VS" pad="7" />
<connect gate="G$1" pin="OUT" pad="6" />
<connect gate="G$1" pin="SENSE" pad="5" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TJA1051T3" prefix="U" uservalue="yes">
<description>TJA1051T/3 CAN transceiver with VIO (SO-8)</description>
<gates>
<gate name="G$1" symbol="TJA1051T3" x="0" y="0" />
</gates>
<devices>
<device name="" package="SO08">
<connects>
<connect gate="G$1" pin="TXD" pad="1" />
<connect gate="G$1" pin="RXD" pad="4" />
<connect gate="G$1" pin="S" pad="8" />
<connect gate="G$1" pin="GND" pad="2" />
<connect gate="G$1" pin="VCC" pad="3" />
<connect gate="G$1" pin="VIO" pad="5" />
<connect gate="G$1" pin="CANH" pad="7" />
<connect gate="G$1" pin="CANL" pad="6" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NCV8402" prefix="Q" uservalue="yes">
<description>NCV8402 / BSP75N self-protected low side switch (SOT-223)</description>
<gates>
<gate name="G$1" symbol="NCV8402" x="0" y="0" />
</gates>
<devices>
<device name="" package="SOT223">
<connects>
<connect gate="G$1" pin="IN" pad="1" />
<connect gate="G$1" pin="DRAIN" pad="2 4" />
<connect gate="G$1" pin="SOURCE" pad="3" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TLV9004" prefix="U" uservalue="yes">
<description>TLV9004 / MCP6004 quad rail-to-rail op-amp, SO-14, LM324 pinout</description>
<gates>
<gate name="G$1" symbol="TLV9004" x="0" y="0" />
</gates>
<devices>
<device name="" package="SO14">
<connects>
<connect gate="G$1" pin="+INA" pad="3" />
<connect gate="G$1" pin="-INA" pad="2" />
<connect gate="G$1" pin="+INB" pad="5" />
<connect gate="G$1" pin="-INB" pad="6" />
<connect gate="G$1" pin="+INC" pad="10" />
<connect gate="G$1" pin="-INC" pad="9" />
<connect gate="G$1" pin="+IND" pad="12" />
<connect gate="G$1" pin="-IND" pad="13" />
<connect gate="G$1" pin="V+" pad="4" />
<connect gate="G$1" pin="OUTA" pad="1" />
<connect gate="G$1" pin="OUTB" pad="7" />
<connect gate="G$1" pin="OUTC" pad="8" />
<connect gate="G$1" pin="OUTD" pad="14" />
<connect gate="G$1" pin="V-" pad="11" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PFET-SO8" prefix="Q" uservalue="yes">
<description>P-channel MOSFET in SO-8 (standard single-FET pinout), -30 V / 10 A class, e.g. AO4407A or IRF7416</description>
<gates>
<gate name="G$1" symbol="PFET-SO8" x="0" y="0" />
</gates>
<devices>
<device name="" package="SO08">
<connects>
<connect gate="G$1" pin="G" pad="4" />
<connect gate="G$1" pin="D" pad="5 6 7 8" />
<connect gate="G$1" pin="S" pad="1 2 3" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NUP2105L" prefix="D" uservalue="yes">
<description>NUP2105L / PESD1CAN dual CAN bus TVS, SOT-23</description>
<gates>
<gate name="G$1" symbol="NUP2105L" x="0" y="0" />
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="CANH" pad="1" />
<connect gate="G$1" pin="CANL" pad="2" />
<connect gate="G$1" pin="GND" pad="3" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TLE9201SG" prefix="U" uservalue="yes">
<description>TLE9201SG 6 A H-bridge (PG-DSO-12-11, exposed pad = GND)</description>
<gates>
<gate name="G$1" symbol="TLE9201SG" x="0" y="0" />
</gates>
<devices>
<device name="" package="PG-DSO-12-11">
<connects>
<connect gate="G$1" pin="PWM" pad="12" />
<connect gate="G$1" pin="DIR" pad="1" />
<connect gate="G$1" pin="DIS" pad="11" />
<connect gate="G$1" pin="CSN" pad="9" />
<connect gate="G$1" pin="SCK" pad="10" />
<connect gate="G$1" pin="SI" pad="8" />
<connect gate="G$1" pin="SO" pad="3" />
<connect gate="G$1" pin="VS" pad="4" />
<connect gate="G$1" pin="VSO" pad="2" />
<connect gate="G$1" pin="OUT1" pad="5" />
<connect gate="G$1" pin="OUT2" pad="7" />
<connect gate="G$1" pin="GND" pad="6 13" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SICMA24-BLACK" prefix="J" uservalue="yes">
<description>Aptiv Sicma 24-way header HCCPHPE24 (black), rows A/B/C x 8</description>
<gates>
<gate name="G$1" symbol="SICMA24-BLACK" x="0" y="0" />
</gates>
<devices>
<device name="" package="SICMA24-BLACK">
<connects>
<connect gate="G$1" pin="A1" pad="A1" />
<connect gate="G$1" pin="A2" pad="A2" />
<connect gate="G$1" pin="A3" pad="A3" />
<connect gate="G$1" pin="A4" pad="A4" />
<connect gate="G$1" pin="A5" pad="A5" />
<connect gate="G$1" pin="A6" pad="A6" />
<connect gate="G$1" pin="A7" pad="A7" />
<connect gate="G$1" pin="A8" pad="A8" />
<connect gate="G$1" pin="B1" pad="B1" />
<connect gate="G$1" pin="B2" pad="B2" />
<connect gate="G$1" pin="B3" pad="B3" />
<connect gate="G$1" pin="B4" pad="B4" />
<connect gate="G$1" pin="B5" pad="B5" />
<connect gate="G$1" pin="B6" pad="B6" />
<connect gate="G$1" pin="B7" pad="B7" />
<connect gate="G$1" pin="B8" pad="B8" />
<connect gate="G$1" pin="C1" pad="C1" />
<connect gate="G$1" pin="C2" pad="C2" />
<connect gate="G$1" pin="C3" pad="C3" />
<connect gate="G$1" pin="C4" pad="C4" />
<connect gate="G$1" pin="C5" pad="C5" />
<connect gate="G$1" pin="C6" pad="C6" />
<connect gate="G$1" pin="C7" pad="C7" />
<connect gate="G$1" pin="C8" pad="C8" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SICMA24-GREY" prefix="J" uservalue="yes">
<description>Aptiv Sicma 24-way header HCCPHPE24 (grey), rows A/B/C x 8</description>
<gates>
<gate name="G$1" symbol="SICMA24-GREY" x="0" y="0" />
</gates>
<devices>
<device name="" package="SICMA24-GREY">
<connects>
<connect gate="G$1" pin="A1" pad="A1" />
<connect gate="G$1" pin="A2" pad="A2" />
<connect gate="G$1" pin="A3" pad="A3" />
<connect gate="G$1" pin="A4" pad="A4" />
<connect gate="G$1" pin="A5" pad="A5" />
<connect gate="G$1" pin="A6" pad="A6" />
<connect gate="G$1" pin="A7" pad="A7" />
<connect gate="G$1" pin="A8" pad="A8" />
<connect gate="G$1" pin="B1" pad="B1" />
<connect gate="G$1" pin="B2" pad="B2" />
<connect gate="G$1" pin="B3" pad="B3" />
<connect gate="G$1" pin="B4" pad="B4" />
<connect gate="G$1" pin="B5" pad="B5" />
<connect gate="G$1" pin="B6" pad="B6" />
<connect gate="G$1" pin="B7" pad="B7" />
<connect gate="G$1" pin="B8" pad="B8" />
<connect gate="G$1" pin="C1" pad="C1" />
<connect gate="G$1" pin="C2" pad="C2" />
<connect gate="G$1" pin="C3" pad="C3" />
<connect gate="G$1" pin="C4" pad="C4" />
<connect gate="G$1" pin="C5" pad="C5" />
<connect gate="G$1" pin="C6" pad="C6" />
<connect gate="G$1" pin="C7" pad="C7" />
<connect gate="G$1" pin="C8" pad="C8" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="rcl">
<description>Parts copied unchanged from the original EAGLE library rcl.lbr</description>
<packages>
<package name="R0603">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51" />
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51" />
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39" />
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39" />
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1" />
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1" />
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51" />
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51" />
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35" />
</package>
<package name="C0603">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39" />
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39" />
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51" />
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51" />
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1" />
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1" />
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51" />
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51" />
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35" />
</package>
<package name="153CLV-0810">
<description>&lt;b&gt;Aluminum electrolytic capacitors&lt;/b&gt;&lt;p&gt;
SMD (Chip) Long Life Vertical 153 CLV&lt;p&gt;
http://www.bccomponents.com/</description>
<wire x1="3.3" y1="-4.2" x2="-4.2" y2="-4.2" width="0.2032" layer="21" />
<wire x1="-4.2" y1="-4.2" x2="-4.2" y2="-1.5" width="0.2032" layer="21" />
<wire x1="-4.2" y1="-1.5" x2="-4.2" y2="1.5" width="0.2032" layer="51" />
<wire x1="-4.2" y1="1.5" x2="-4.2" y2="4.2" width="0.2032" layer="21" />
<wire x1="-4.2" y1="4.2" x2="3.3" y2="4.2" width="0.2032" layer="21" />
<wire x1="4.2" y1="3.3" x2="4.2" y2="1.5" width="0.2032" layer="21" />
<wire x1="4.2" y1="1.5" x2="4.2" y2="-1.5" width="0.2032" layer="51" />
<wire x1="4.2" y1="-1.5" x2="4.2" y2="-3.3" width="0.2032" layer="21" />
<wire x1="4.2" y1="-3.3" x2="3.3" y2="-4.2" width="0.2032" layer="21" />
<wire x1="3.3" y1="4.2" x2="4.2" y2="3.3" width="0.2032" layer="21" />
<wire x1="-3.65" y1="-1.4" x2="3.65" y2="-1.4" width="0.2032" layer="21" curve="138.030204" />
<wire x1="-3.65" y1="-1.4" x2="-3.65" y2="1.4" width="0.2032" layer="51" curve="-41.969796" />
<wire x1="-3.65" y1="1.4" x2="3.65" y2="1.4" width="0.2032" layer="21" curve="-138.030204" />
<wire x1="3.65" y1="-1.4" x2="3.65" y2="1.4" width="0.2032" layer="51" curve="41.969796" />
<smd name="+" x="3.25" y="0" dx="3.5" dy="2.5" layer="1" />
<smd name="-" x="-3.25" y="0" dx="3.5" dy="2.5" layer="1" />
<text x="-4.29" y="4.53" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.325" y="-5.785" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CEP125">
<description>&lt;b&gt;POWER INDUCTORS&lt;/b&gt; (SMT Type)&lt;p&gt;
Source: www.sumida.com/products/pdf/CEP125.pdf</description>
<wire x1="-1.5796" y1="6.3448" x2="-1.5533" y2="6.3448" width="0.2032" layer="21" />
<wire x1="-1.5533" y1="6.3448" x2="-1.29" y2="6.0815" width="0.2032" layer="21" />
<wire x1="-1.29" y1="6.0815" x2="-1.1584" y2="6.0816" width="0.2032" layer="21" />
<wire x1="-1.1584" y1="6.0816" x2="-1.1584" y2="6.2922" width="0.2032" layer="21" />
<wire x1="-1.1584" y1="6.2922" x2="-1.1583" y2="6.2922" width="0.2032" layer="21" />
<wire x1="-1.1583" y1="6.2922" x2="-1.1057" y2="6.3448" width="0.2032" layer="21" />
<wire x1="-1.1057" y1="6.3448" x2="1.1057" y2="6.3448" width="0.2032" layer="21" />
<wire x1="1.1057" y1="6.3448" x2="1.1057" y2="6.0815" width="0.2032" layer="21" />
<wire x1="1.1057" y1="6.0815" x2="1.211" y2="6.0815" width="0.2032" layer="21" />
<wire x1="1.211" y1="6.0815" x2="1.4217" y2="6.3448" width="0.2032" layer="21" />
<wire x1="1.4217" y1="6.3448" x2="6.1079" y2="6.3448" width="0.2032" layer="51" />
<wire x1="6.1079" y1="6.3448" x2="6.3448" y2="6.1079" width="0.2032" layer="21" curve="-96.645912" />
<wire x1="6.3448" y1="6.1079" x2="6.3448" y2="1.8166" width="0.2032" layer="21" />
<wire x1="6.3448" y1="1.8166" x2="6.2658" y2="1.7376" width="0.2032" layer="21" />
<wire x1="6.2658" y1="1.7376" x2="6.2658" y2="-1.7376" width="0.2032" layer="21" />
<wire x1="6.2658" y1="-1.7376" x2="6.3448" y2="-1.8166" width="0.2032" layer="21" />
<wire x1="6.3448" y1="-1.8166" x2="6.3448" y2="-6.0289" width="0.2032" layer="21" />
<wire x1="6.3448" y1="-6.0289" x2="6.0289" y2="-6.3448" width="0.2032" layer="21" curve="-91.024745" />
<wire x1="6.0289" y1="-6.3448" x2="-6.0289" y2="-6.3448" width="0.2032" layer="51" />
<wire x1="-6.3448" y1="-6.0289" x2="-6.3448" y2="6.1342" width="0.2032" layer="21" />
<wire x1="-6.3448" y1="6.1342" x2="-6.1342" y2="6.3448" width="0.2032" layer="21" curve="-83.297108" />
<wire x1="-6.1342" y1="6.3448" x2="-1.5533" y2="6.3448" width="0.2032" layer="51" />
<wire x1="-6.2395" y1="5.7393" x2="-2.0535" y2="5.7393" width="0.2032" layer="51" />
<wire x1="-2.0535" y1="5.7393" x2="-1.5534" y2="3.9754" width="0.2032" layer="51" />
<wire x1="-1.5534" y1="3.9754" x2="1.527" y2="3.9754" width="0.2032" layer="21" />
<wire x1="1.527" y1="3.9754" x2="2.0535" y2="5.7393" width="0.2032" layer="51" />
<wire x1="2.0535" y1="5.7393" x2="6.2395" y2="5.7393" width="0.2032" layer="51" />
<wire x1="6.2395" y1="-3.4752" x2="-6.2658" y2="-3.4752" width="0.2032" layer="21" />
<wire x1="-5.6077" y1="-3.5805" x2="-5.6077" y2="-6.2395" width="0.2032" layer="21" />
<wire x1="-4.8968" y1="-6.2395" x2="-4.8968" y2="-3.5805" width="0.2032" layer="21" />
<wire x1="-4.7915" y1="-6.0552" x2="-2.2115" y2="-6.0552" width="0.2032" layer="21" />
<wire x1="-2.9486" y1="-5.9499" x2="-2.9223" y2="-5.9499" width="0.2032" layer="21" />
<wire x1="-2.9223" y1="-5.9499" x2="-2.9223" y2="-3.5805" width="0.2032" layer="21" />
<wire x1="-2.1588" y1="-6.2395" x2="-2.1588" y2="-3.8701" width="0.2032" layer="21" />
<wire x1="2.1325" y1="-6.2395" x2="2.1325" y2="-3.8701" width="0.2032" layer="21" />
<wire x1="2.2378" y1="-6.0289" x2="4.8968" y2="-6.0289" width="0.2032" layer="21" />
<wire x1="4.8968" y1="-3.5805" x2="4.8968" y2="-6.2395" width="0.2032" layer="21" />
<wire x1="2.9486" y1="-5.9236" x2="2.9486" y2="-3.5805" width="0.2032" layer="21" />
<wire x1="5.5813" y1="-6.2395" x2="5.5813" y2="-3.5805" width="0.2032" layer="21" />
<wire x1="2.5011" y1="-3.5805" x2="-2.4747" y2="-3.5805" width="0.2032" layer="51" curve="-63.906637" />
<wire x1="1.1057" y1="6.0815" x2="-1.1584" y2="6.0815" width="0.2032" layer="21" />
<wire x1="-1.7902" y1="5.1601" x2="1.7376" y2="5.1863" width="0.2032" layer="21" curve="-37.134171" />
<wire x1="-6.0289" y1="-6.3448" x2="-6.3448" y2="-6.0289" width="0.2032" layer="21" curve="-90.91408" />
<smd name="1" x="-3.5" y="5.375" dx="3" dy="2.75" layer="1" />
<smd name="2" x="3.5" y="5.375" dx="3" dy="2.75" layer="1" />
<smd name="3" x="0" y="-5.48" dx="3" dy="2.55" layer="1" />
<text x="-5.08" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="R1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1524" layer="51" />
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1524" layer="51" />
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39" />
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39" />
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39" />
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1" />
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1" />
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51" />
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51" />
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35" />
</package>
<package name="C0805">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39" />
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39" />
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39" />
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51" />
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51" />
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39" />
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1" />
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1" />
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51" />
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51" />
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35" />
</package>
</packages>
<symbols>
<symbol name="R-EU">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94" />
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94" />
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94" />
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94" />
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180" />
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" />
</symbol>
<symbol name="C-EU">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94" />
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94" />
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94" />
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94" />
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270" />
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90" />
</symbol>
<symbol name="CPOL">
<wire x1="-1.524" y1="-0.889" x2="1.524" y2="-0.889" width="0.254" layer="94" />
<wire x1="1.524" y1="-0.889" x2="1.524" y2="0" width="0.254" layer="94" />
<wire x1="-1.524" y1="0" x2="-1.524" y2="-0.889" width="0.254" layer="94" />
<wire x1="-1.524" y1="0" x2="1.524" y2="0" width="0.254" layer="94" />
<text x="1.143" y="0.4826" size="1.778" layer="95">&gt;NAME</text>
<text x="-0.5842" y="0.4064" size="1.27" layer="94" rot="R90">+</text>
<text x="1.143" y="-4.5974" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-2.54" x2="1.651" y2="-1.651" layer="94" />
<pin name="-" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90" />
<pin name="+" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270" />
</symbol>
<symbol name="L-EU">
<text x="-1.4986" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="3.302" y="-3.81" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.016" y1="-3.556" x2="1.016" y2="3.556" layer="94" />
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90" />
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270" />
</symbol>
</symbols>
<devicesets>
<deviceset name="R-EU_" prefix="R" uservalue="yes">
<description>&lt;B&gt;RESISTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="R-EU" x="0" y="0" />
</gates>
<devices>
<device name="R0603" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1" />
<connect gate="G$1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
<device name="R1206" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="1" />
<connect gate="G$1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C-EU" prefix="C" uservalue="yes">
<description>&lt;B&gt;CAPACITOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="C-EU" x="0" y="0" />
</gates>
<devices>
<device name="C0603" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1" />
<connect gate="G$1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
<device name="C0805" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1" />
<connect gate="G$1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CPOL-EU" prefix="C" uservalue="yes">
<description>&lt;B&gt;POLARIZED CAPACITOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="CPOL" x="0" y="0" />
</gates>
<devices>
<device name="153CLV-0810" package="153CLV-0810">
<connects>
<connect gate="G$1" pin="+" pad="+" />
<connect gate="G$1" pin="-" pad="-" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="L-EU" prefix="L" uservalue="yes">
<description>&lt;B&gt;INDUCTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="L-EU" x="0" y="0" />
</gates>
<devices>
<device name="CEP125" package="CEP125">
<connects>
<connect gate="G$1" pin="1" pad="1" />
<connect gate="G$1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="diode">
<description>Parts copied unchanged from the original EAGLE library diode.lbr</description>
<packages>
<package name="SMA">
<description>&lt;b&gt;SMA&lt;/b&gt; CASE 403D-02&lt;p&gt;
Source: http://www.onsemi.com/pub_link/Collateral/MBRA340T3-D.PDF</description>
<wire x1="-2.25" y1="1.825" x2="2.25" y2="1.825" width="0.254" layer="21" />
<wire x1="2.25" y1="-1.825" x2="-2.25" y2="-1.825" width="0.254" layer="21" />
<wire x1="-2.25" y1="1.825" x2="-2.25" y2="1.25" width="0.254" layer="21" />
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.254" layer="51" />
<wire x1="-2.25" y1="-1.825" x2="-2.25" y2="-1.25" width="0.254" layer="21" />
<wire x1="2.25" y1="-1.825" x2="2.25" y2="-1.25" width="0.254" layer="21" curve="-1.904406" />
<wire x1="2.25" y1="1.825" x2="2.25" y2="1.25" width="0.254" layer="21" />
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.254" layer="51" />
<smd name="C" x="-2" y="0" dx="2" dy="2" layer="1" />
<smd name="A" x="2" y="0" dx="2" dy="2" layer="1" />
<text x="-2.75" y="2" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.75" y="-3.5" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.38" y1="-0.825" x2="2.8" y2="0.8" layer="51" />
<rectangle x1="-2.8" y1="-0.8" x2="-2.38" y2="0.8" layer="51" />
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="1.75" layer="51" />
<rectangle x1="-1.5" y1="1.25" x2="-0.75" y2="1.75" layer="21" />
<rectangle x1="-1.5" y1="-1.75" x2="-0.75" y2="-1.25" layer="21" />
</package>
<package name="SMBJ">
<description>&lt;b&gt;DO-214AA Modified J_BEND&lt;/b&gt;&lt;p&gt;
Source: www.rsonline.de .. SMBJ12/C/15/C/24/C/30/C/5.0/C/7.5/C Voltage Suppressor. Data Sheet</description>
<wire x1="2.24" y1="1.92" x2="2.24" y2="-1.92" width="0.1016" layer="51" />
<wire x1="2.24" y1="-1.92" x2="-2.24" y2="-1.92" width="0.1016" layer="21" />
<wire x1="-2.24" y1="-1.92" x2="-2.24" y2="1.92" width="0.1016" layer="51" />
<wire x1="-2.24" y1="1.92" x2="2.24" y2="1.92" width="0.1016" layer="21" />
<smd name="C" x="-2.03" y="0" dx="1.78" dy="2.16" layer="1" />
<smd name="A" x="2.04" y="0" dx="1.78" dy="2.16" layer="1" rot="R180" />
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.8" y1="-1.1" x2="-2.25" y2="1.1" layer="51" />
<rectangle x1="2.25" y1="-1.1" x2="2.8" y2="1.1" layer="51" />
</package>
<package name="SOT23">
<description>&lt;B&gt;DIODE&lt;/B&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51" />
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51" />
<wire x1="-1.4224" y1="-0.1524" x2="-1.4224" y2="0.6604" width="0.1524" layer="21" />
<wire x1="-1.4224" y1="0.6604" x2="-0.8636" y2="0.6604" width="0.1524" layer="21" />
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.1524" width="0.1524" layer="21" />
<wire x1="0.8636" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="21" />
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1" />
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1" />
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1" />
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51" />
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51" />
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51" />
</package>
</packages>
<symbols>
<symbol name="DIODE">
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="0" width="0.254" layer="94" />
<wire x1="1.27" y1="0" x2="-1.27" y2="1.905" width="0.254" layer="94" />
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.254" layer="94" />
<wire x1="1.397" y1="1.905" x2="1.397" y2="-1.905" width="0.254" layer="94" />
<text x="-2.3114" y="2.6416" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.5654" y="-4.4958" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas" />
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180" />
</symbol>
<symbol name="SUPPRESSOR">
<wire x1="1.27" y1="-1.27" x2="0" y2="1.27" width="0.254" layer="94" />
<wire x1="0" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="1.905" x2="1.27" y2="1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="1.27" x2="0" y2="1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="0" y1="1.27" x2="-1.27" y2="1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0.635" width="0.254" layer="94" />
<text x="2.794" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="2.794" y="-0.889" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90" />
<pin name="C" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270" />
</symbol>
<symbol name="SDD_AKAK">
<wire x1="-3.81" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94" />
<wire x1="-1.27" y1="0" x2="-3.81" y2="1.27" width="0.254" layer="94" />
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94" />
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="-1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="1.27" x2="3.81" y2="0" width="0.254" layer="94" />
<wire x1="3.81" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="2.54" y1="0" x2="3.81" y2="0" width="0.1524" layer="94" />
<wire x1="1.27" y1="-1.27" x2="1.27" y2="1.27" width="0.254" layer="94" />
<wire x1="-0.635" y1="1.016" x2="-0.635" y2="1.27" width="0.254" layer="94" />
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.254" layer="94" />
<wire x1="-1.905" y1="-1.016" x2="-1.905" y2="-1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="-1.27" x2="-1.905" y2="-1.27" width="0.254" layer="94" />
<wire x1="3.175" y1="-1.016" x2="3.175" y2="-1.27" width="0.254" layer="94" />
<wire x1="3.175" y1="-1.27" x2="3.81" y2="-1.27" width="0.254" layer="94" />
<wire x1="3.81" y1="-1.27" x2="3.81" y2="0" width="0.254" layer="94" />
<wire x1="4.445" y1="1.016" x2="4.445" y2="1.27" width="0.254" layer="94" />
<wire x1="3.81" y1="0" x2="3.81" y2="1.27" width="0.254" layer="94" />
<wire x1="3.81" y1="1.27" x2="4.445" y2="1.27" width="0.254" layer="94" />
<wire x1="-1.27" y1="0" x2="3.81" y2="0" width="0.1524" layer="94" />
<circle x="0" y="0" radius="0.127" width="0.4064" layer="94" />
<text x="0.762" y="2.0066" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.318" y="-3.9624" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A1" x="-5.08" y="0" visible="off" length="short" direction="pas" />
<pin name="C2" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180" />
<pin name="C1A2" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270" />
</symbol>
<symbol name="ZD">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94" />
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94" />
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94" />
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94" />
<text x="-1.778" y="1.905" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.778" y="-3.429" size="1.778" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas" />
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180" />
</symbol>
</symbols>
<devicesets>
<deviceset name="MBRA340T3" prefix="D">
<description>&lt;b&gt;Surface Mount Schottky Power Rectifier&lt;/b&gt;&lt;p&gt;
Source: http://www.onsemi.com/pub_link/Collateral/MBRA340T3-D.PDF</description>
<gates>
<gate name="G$1" symbol="DIODE" x="0" y="0" />
</gates>
<devices>
<device name="" package="SMA">
<connects>
<connect gate="G$1" pin="A" pad="A" />
<connect gate="G$1" pin="C" pad="C" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPRESSOR-" prefix="D" uservalue="yes">
<description>&lt;b&gt;Suppressor diode&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="SUPPRESSOR" x="0" y="0" />
</gates>
<devices>
<device name="SMBJ" package="SMBJ">
<connects>
<connect gate="G$1" pin="A" pad="A" />
<connect gate="G$1" pin="C" pad="C" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BAT54S" prefix="D">
<description>&lt;b&gt;Schottky Diodes&lt;/b&gt;&lt;p&gt;
Pin connection corrected 2011-05-04&lt;br&gt;
Source: Fairchild .. BAT54.pdf</description>
<gates>
<gate name="G$1" symbol="SDD_AKAK" x="0" y="0" />
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="A1" pad="1" />
<connect gate="G$1" pin="C1A2" pad="3" />
<connect gate="G$1" pin="C2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ZENER-DIODE" prefix="D" uservalue="yes">
<description>Z-Diode</description>
<gates>
<gate name="G$1" symbol="ZD" x="0" y="0" />
</gates>
<devices>
<device name="SOT23" package="SOT23">
<connects>
<connect gate="G$1" pin="A" pad="1" />
<connect gate="G$1" pin="C" pad="3" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jumper">
<description>Parts copied unchanged from the original EAGLE library jumper.lbr</description>
<packages>
<package name="SJ">
<description>&lt;b&gt;Solder jumper&lt;/b&gt;</description>
<wire x1="1.397" y1="-1.016" x2="-1.397" y2="-1.016" width="0.1524" layer="21" />
<wire x1="1.397" y1="1.016" x2="1.651" y2="0.762" width="0.1524" layer="21" curve="-90" />
<wire x1="-1.651" y1="0.762" x2="-1.397" y2="1.016" width="0.1524" layer="21" curve="-90" />
<wire x1="-1.651" y1="-0.762" x2="-1.397" y2="-1.016" width="0.1524" layer="21" curve="90" />
<wire x1="1.397" y1="-1.016" x2="1.651" y2="-0.762" width="0.1524" layer="21" curve="90" />
<wire x1="1.651" y1="-0.762" x2="1.651" y2="0.762" width="0.1524" layer="21" />
<wire x1="-1.651" y1="-0.762" x2="-1.651" y2="0.762" width="0.1524" layer="21" />
<wire x1="-1.397" y1="1.016" x2="1.397" y2="1.016" width="0.1524" layer="21" />
<wire x1="1.016" y1="0" x2="1.524" y2="0" width="0.1524" layer="51" />
<wire x1="-1.016" y1="0" x2="-1.524" y2="0" width="0.1524" layer="51" />
<wire x1="-0.254" y1="-0.127" x2="-0.254" y2="0.127" width="1.27" layer="51" curve="-180" cap="flat" />
<wire x1="0.254" y1="0.127" x2="0.254" y2="-0.127" width="1.27" layer="51" curve="-180" cap="flat" />
<smd name="1" x="-0.762" y="0" dx="1.1684" dy="1.6002" layer="1" />
<smd name="2" x="0.762" y="0" dx="1.1684" dy="1.6002" layer="1" />
<text x="-1.651" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.4001" y="0" size="0.02" layer="27">&gt;VALUE</text>
<rectangle x1="-0.0762" y1="-0.9144" x2="0.0762" y2="0.9144" layer="29" />
</package>
</packages>
<symbols>
<symbol name="SJ">
<wire x1="0.381" y1="0.635" x2="0.381" y2="-0.635" width="1.27" layer="94" curve="-180" cap="flat" />
<wire x1="-0.381" y1="-0.635" x2="-0.381" y2="0.635" width="1.27" layer="94" curve="-180" cap="flat" />
<wire x1="2.54" y1="0" x2="1.651" y2="0" width="0.1524" layer="94" />
<wire x1="-2.54" y1="0" x2="-1.651" y2="0" width="0.1524" layer="94" />
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180" />
<pin name="1" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" />
</symbol>
</symbols>
<devicesets>
<deviceset name="SJ" prefix="SJ" uservalue="yes">
<description>SMD solder &lt;b&gt;JUMPER&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="SJ" x="0" y="0" />
</gates>
<devices>
<device name="" package="SJ">
<connects>
<connect gate="1" pin="1" pad="1" />
<connect gate="1" pin="2" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="led">
<description>Parts copied unchanged from the original EAGLE library led.lbr</description>
<packages>
<package name="CHIPLED_0603">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_LY Q971.pdf</description>
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574" />
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180" />
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51" />
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51" />
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51" />
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1" />
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1" />
<text x="-0.635" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51" />
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51" />
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51" />
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51" />
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51" />
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51" />
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51" />
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51" />
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51" />
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51" />
<rectangle x1="-0.125" y1="0" x2="0.125" y2="0.25" layer="21" />
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94" />
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94" />
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94" />
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94" />
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94" />
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94" />
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94" />
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94" />
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94" />
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90" />
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270" />
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159" />
<vertex x="-3.048" y="-1.27" />
<vertex x="-2.54" y="-1.778" />
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302" />
<vertex x="-2.921" y="-2.413" />
<vertex x="-2.413" y="-2.921" />
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED" prefix="LED" uservalue="yes">
<description>&lt;b&gt;LED&lt;/b&gt;&lt;p&gt;
&lt;u&gt;OSRAM&lt;/u&gt;:&lt;br&gt;

- &lt;u&gt;CHIPLED&lt;/u&gt;&lt;br&gt;
LG R971, LG N971, LY N971, LG Q971, LY Q971, LO R971, LY R971
LH N974, LH R974&lt;br&gt;
LS Q976, LO Q976, LY Q976&lt;br&gt;
LO Q996&lt;br&gt;

- &lt;u&gt;Hyper CHIPLED&lt;/u&gt;&lt;br&gt;
LW Q18S&lt;br&gt;
LB Q993, LB Q99A, LB R99A&lt;br&gt;

- &lt;u&gt;SideLED&lt;/u&gt;&lt;br&gt;
LS A670, LO A670, LY A670, LG A670, LP A670&lt;br&gt;
LB A673, LV A673, LT A673, LW A673&lt;br&gt;
LH A674&lt;br&gt;
LY A675&lt;br&gt;
LS A676, LA A676, LO A676, LY A676, LW A676&lt;br&gt;
LS A679, LY A679, LG A679&lt;br&gt;

-  &lt;u&gt;Hyper Micro SIDELED®&lt;/u&gt;&lt;br&gt;
LS Y876, LA Y876, LO Y876, LY Y876&lt;br&gt;
LT Y87S&lt;br&gt;

- &lt;u&gt;SmartLED&lt;/u&gt;&lt;br&gt;
LW L88C, LW L88S&lt;br&gt;
LB L89C, LB L89S, LG L890&lt;br&gt;
LS L89K, LO L89K, LY L89K&lt;br&gt;
LS L896, LA L896, LO L896, LY L896&lt;br&gt;

- &lt;u&gt;TOPLED&lt;/u&gt;&lt;br&gt;
LS T670, LO T670, LY T670, LG T670, LP T670&lt;br&gt;
LSG T670, LSP T670, LSY T670, LOP T670, LYG T670&lt;br&gt;
LG T671, LOG T671, LSG T671&lt;br&gt;
LB T673, LV T673, LT T673, LW T673&lt;br&gt;
LH T674&lt;br&gt;
LS T676, LA T676, LO T676, LY T676, LB T676, LH T676, LSB T676, LW T676&lt;br&gt;
LB T67C, LV T67C, LT T67C, LS T67K, LO T67K, LY T67K, LW E67C&lt;br&gt;
LS E67B, LA E67B, LO E67B, LY E67B, LB E67C, LV E67C, LT E67C&lt;br&gt;
LW T67C&lt;br&gt;
LS T679, LY T679, LG T679&lt;br&gt;
LS T770, LO T770, LY T770, LG T770, LP T770&lt;br&gt;
LB T773, LV T773, LT T773, LW T773&lt;br&gt;
LH T774&lt;br&gt;
LS E675, LA E675, LY E675, LS T675&lt;br&gt;
LS T776, LA T776, LO T776, LY T776, LB T776&lt;br&gt;
LHGB T686&lt;br&gt;
LT T68C, LB T68C&lt;br&gt;

- &lt;u&gt;Hyper Mini TOPLED®&lt;/u&gt;&lt;br&gt;
LB M676&lt;br&gt;

- &lt;u&gt;Mini TOPLED Santana®&lt;/u&gt;&lt;br&gt;
LG M470&lt;br&gt;
LS M47K, LO M47K, LY M47K
&lt;p&gt;
Source: http://www.osram.convergy.de&lt;p&gt;

&lt;u&gt;LUXEON:&lt;/u&gt;&lt;br&gt;
- &lt;u&gt;LUMILED®&lt;/u&gt;&lt;br&gt;
LXK2-PW12-R00, LXK2-PW12-S00, LXK2-PW14-U00, LXK2-PW14-V00&lt;br&gt;
LXK2-PM12-R00, LXK2-PM12-S00, LXK2-PM14-U00&lt;br&gt;
LXK2-PE12-Q00, LXK2-PE12-R00, LXK2-PE12-S00, LXK2-PE14-T00, LXK2-PE14-U00&lt;br&gt;
LXK2-PB12-K00, LXK2-PB12-L00, LXK2-PB12-M00, LXK2-PB14-N00, LXK2-PB14-P00, LXK2-PB14-Q00&lt;br&gt;
LXK2-PR12-L00, LXK2-PR12-M00, LXK2-PR14-Q00, LXK2-PR14-R00&lt;br&gt;
LXK2-PD12-Q00, LXK2-PD12-R00, LXK2-PD12-S00&lt;br&gt;
LXK2-PH12-R00, LXK2-PH12-S00&lt;br&gt;
LXK2-PL12-P00, LXK2-PL12-Q00, LXK2-PL12-R00
&lt;p&gt;
Source: www.luxeon.com&lt;p&gt;

&lt;u&gt;KINGBRIGHT:&lt;/U&gt;&lt;p&gt;
KA-3528ASYC&lt;br&gt;
Source: www.kingbright.com</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0" />
</gates>
<devices>
<device name="CHIPLED_0603" package="CHIPLED_0603">
<connects>
<connect gate="G$1" pin="A" pad="A" />
<connect gate="G$1" pin="C" pad="C" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="linear">
<description>Parts copied unchanged from the original EAGLE library linear.lbr</description>
<packages>
<package name="TO263-5">
<description>&lt;b&gt;TO-263&lt;/b&gt;</description>
<wire x1="5.094" y1="7.165" x2="5.094" y2="-2.88" width="0.2032" layer="51" />
<wire x1="5.094" y1="-2.88" x2="-5.094" y2="-2.88" width="0.2032" layer="21" />
<wire x1="-5.094" y1="-2.88" x2="-5.094" y2="7.165" width="0.2032" layer="51" />
<wire x1="-5.094" y1="7.165" x2="5.094" y2="7.165" width="0.2032" layer="51" />
<wire x1="-5.105" y1="7.267" x2="-5.105" y2="7.678" width="0.2032" layer="51" />
<wire x1="-5.105" y1="7.678" x2="-3.378" y2="8.135" width="0.2032" layer="51" />
<wire x1="-3.378" y1="8.135" x2="3.378" y2="8.135" width="0.2032" layer="51" />
<wire x1="3.378" y1="8.135" x2="5.105" y2="7.678" width="0.2032" layer="51" />
<wire x1="5.105" y1="7.678" x2="5.105" y2="7.267" width="0.2032" layer="51" />
<wire x1="5.105" y1="7.267" x2="-5.105" y2="7.267" width="0.2032" layer="51" />
<smd name="6" x="0" y="2.54" dx="10.8" dy="10.41" layer="1" />
<smd name="1" x="-3.4036" y="-5.7912" dx="1.0668" dy="2.159" layer="1" />
<smd name="2" x="-1.7018" y="-5.7912" dx="1.0668" dy="2.159" layer="1" />
<smd name="3" x="0" y="-5.7912" dx="1.0668" dy="2.159" layer="1" />
<smd name="4" x="1.7018" y="-5.7912" dx="1.0668" dy="2.159" layer="1" />
<smd name="5" x="3.4036" y="-5.7912" dx="1.0668" dy="2.159" layer="1" />
<text x="-5.588" y="-5.588" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="6.858" y="-5.588" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-3.8862" y1="-6.604" x2="-2.921" y2="-4.445" layer="51" />
<rectangle x1="-3.8862" y1="-4.4704" x2="-2.921" y2="-2.794" layer="21" />
<rectangle x1="-2.1844" y1="-6.604" x2="-1.2192" y2="-4.445" layer="51" />
<rectangle x1="-0.4826" y1="-6.604" x2="0.4826" y2="-4.445" layer="51" />
<rectangle x1="1.2192" y1="-6.604" x2="2.1844" y2="-4.445" layer="51" />
<rectangle x1="2.921" y1="-6.604" x2="3.8862" y2="-4.445" layer="51" />
<rectangle x1="-2.1844" y1="-4.4704" x2="-1.2192" y2="-2.794" layer="21" />
<rectangle x1="-0.4826" y1="-4.4704" x2="0.4826" y2="-2.794" layer="21" />
<rectangle x1="1.2192" y1="-4.4704" x2="2.1844" y2="-2.794" layer="21" />
<rectangle x1="2.921" y1="-4.4704" x2="3.8862" y2="-2.794" layer="21" />
<polygon width="0.2032" layer="51">
<vertex x="-5.1054" y="7.267" />
<vertex x="-5.1054" y="7.6782" />
<vertex x="-3.3782" y="8.1354" />
<vertex x="3.3782" y="8.1354" />
<vertex x="5.1054" y="7.6782" />
<vertex x="5.1054" y="7.267" />
</polygon>
</package>
</packages>
<symbols>
<symbol name="LM2596">
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94" />
<wire x1="7.62" y1="5.08" x2="7.62" y2="-7.62" width="0.254" layer="94" />
<wire x1="7.62" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94" />
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="5.08" width="0.254" layer="94" />
<text x="-7.62" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="6.35" size="1.778" layer="96">&gt;VALUE</text>
<text x="0" y="-6.35" size="1.4224" layer="95">GND</text>
<pin name="IN" x="-10.16" y="2.54" length="short" direction="in" />
<pin name="OUT" x="10.16" y="2.54" length="short" direction="out" rot="R180" />
<pin name="GND" x="0" y="-10.16" visible="pad" length="short" direction="pwr" rot="R90" />
<pin name="FB" x="10.16" y="-2.54" length="short" direction="in" rot="R180" />
<pin name="EN" x="-10.16" y="-2.54" length="short" direction="in" />
<pin name="GND@1" x="2.54" y="-10.16" visible="pad" length="short" direction="pwr" rot="R90" />
</symbol>
</symbols>
<devicesets>
<deviceset name="LM2596S" prefix="IC" uservalue="yes">
<description>&lt;b&gt;STEP-DOWN VOLTAGE REGULATOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="LM2596" x="0" y="0" />
</gates>
<devices>
<device name="" package="TO263-5">
<connects>
<connect gate="G$1" pin="EN" pad="5" />
<connect gate="G$1" pin="FB" pad="4" />
<connect gate="G$1" pin="GND" pad="3" />
<connect gate="G$1" pin="GND@1" pad="6" />
<connect gate="G$1" pin="IN" pad="1" />
<connect gate="G$1" pin="OUT" pad="2" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="infineon">
<description>Parts copied unchanged from the original EAGLE library infineon.lbr</description>
<packages>
<package name="TO252-5-11">
<description>&lt;b&gt;Dpak-5 Pin&lt;/b&gt; P-TO252-5-11 &lt;/b&gt;&lt;p&gt;
Source: www.infineon.com .. BTS428L2_20030912.pdf</description>
<wire x1="-3.15" y1="3" x2="-2.75" y2="3" width="0.2032" layer="51" />
<wire x1="-2.75" y1="3" x2="2.75" y2="3" width="0.2032" layer="51" />
<wire x1="2.75" y1="3" x2="3.15" y2="3" width="0.2032" layer="51" />
<wire x1="3.15" y1="3" x2="3.15" y2="-3" width="0.2032" layer="21" />
<wire x1="3.15" y1="-3" x2="-3.15" y2="-3" width="0.2032" layer="21" />
<wire x1="-3.15" y1="-3" x2="-3.15" y2="3" width="0.2032" layer="21" />
<wire x1="-2.75" y1="3" x2="-2.75" y2="4" width="0.2032" layer="51" />
<wire x1="-2.75" y1="4" x2="-2" y2="4" width="0.2032" layer="51" />
<wire x1="-2" y1="4" x2="-2" y2="3.85" width="0.2032" layer="51" />
<wire x1="-2" y1="3.85" x2="2" y2="3.85" width="0.2032" layer="51" />
<wire x1="2" y1="3.85" x2="2" y2="4" width="0.2032" layer="51" />
<wire x1="2" y1="4" x2="2.75" y2="4" width="0.2032" layer="51" />
<wire x1="2.75" y1="4" x2="2.75" y2="3" width="0.2032" layer="51" />
<wire x1="0.6351" y1="1.1472" x2="0.6815" y2="1.0719" width="0.0926" layer="51" curve="50.5163" />
<wire x1="0.6815" y1="1.0719" x2="0.7568" y2="1.0603" width="0.0926" layer="51" curve="48.799462" />
<wire x1="0.7568" y1="1.0603" x2="0.8147" y2="1.1124" width="0.0926" layer="51" curve="52.776062" />
<wire x1="0.8147" y1="1.1124" x2="0.8321" y2="1.182" width="0.0926" layer="51" curve="15.189287" />
<wire x1="0.8321" y1="1.182" x2="0.8321" y2="1.3442" width="0.0926" layer="51" curve="12.862147" />
<wire x1="0.8321" y1="1.3442" x2="0.8031" y2="1.4253" width="0.0926" layer="51" curve="26.516294" />
<wire x1="0.8031" y1="1.4253" x2="0.751" y2="1.4601" width="0.0926" layer="51" curve="46.660241" />
<wire x1="0.751" y1="1.4601" x2="0.7046" y2="1.4601" width="0.0926" layer="51" curve="20.946986" />
<wire x1="0.7046" y1="1.4601" x2="0.6467" y2="1.4079" width="0.0926" layer="51" curve="63.371643" />
<wire x1="0.6467" y1="1.4079" x2="0.6293" y2="1.3152" width="0.0926" layer="51" curve="11.340973" />
<wire x1="0.6293" y1="1.3152" x2="0.6351" y2="1.153" width="0.0926" layer="51" curve="14.04857" />
<wire x1="0.4439" y1="1.2921" x2="0.4439" y2="1.3152" width="0.0926" layer="51" />
<wire x1="0.4439" y1="1.3152" x2="0.4207" y2="1.4137" width="0.0926" layer="51" curve="26.531483" />
<wire x1="0.4207" y1="1.4137" x2="0.4091" y2="1.4311" width="0.0926" layer="51" curve="14.250033" />
<wire x1="0.4091" y1="1.4311" x2="0.386" y2="1.4543" width="0.0926" layer="51" curve="8.016267" />
<wire x1="0.386" y1="1.4543" x2="0.2759" y2="1.4311" width="0.0926" layer="51" curve="105.712638" />
<wire x1="0.2759" y1="1.4311" x2="0.2585" y2="1.3848" width="0.0926" layer="51" curve="9.226419" />
<wire x1="0.2585" y1="1.3848" x2="0.2469" y2="1.3326" width="0.0926" layer="51" curve="6.956601" />
<wire x1="0.2469" y1="1.3326" x2="0.2527" y2="1.1588" width="0.0926" layer="51" curve="21.945486" />
<wire x1="0.2527" y1="1.1588" x2="0.2759" y2="1.1009" width="0.0926" layer="51" curve="17.892453" />
<wire x1="0.2759" y1="1.1009" x2="0.2991" y2="1.0719" width="0.0926" layer="51" curve="15.844294" />
<wire x1="0.2991" y1="1.0719" x2="0.3686" y2="1.0545" width="0.0926" layer="51" curve="51.403204" />
<wire x1="0.3686" y1="1.0545" x2="0.4193" y2="1.0805" width="0.0926" layer="51" curve="44.347321" />
<wire x1="0.4193" y1="1.0805" x2="0.4411" y2="1.1381" width="0.0926" layer="51" curve="32.502594" />
<wire x1="0.4411" y1="1.1381" x2="0.4439" y2="1.1936" width="0.0926" layer="51" curve="8.167043" />
<wire x1="0.4963" y1="0.6453" x2="0.5024" y2="0.6177" width="0.0346" layer="51" curve="25.274365" />
<wire x1="0.5024" y1="0.6177" x2="0.5192" y2="0.5968" width="0.0346" layer="51" curve="28.732379" />
<wire x1="0.5192" y1="0.5968" x2="0.55" y2="0.5834" width="0.0346" layer="51" curve="29.115849" />
<wire x1="0.55" y1="0.5834" x2="0.5888" y2="0.591" width="0.0346" layer="51" curve="42.029398" />
<wire x1="0.5888" y1="0.591" x2="0.6177" y2="0.6258" width="0.0346" layer="51" curve="42.408509" />
<wire x1="0.6177" y1="0.6258" x2="0.6235" y2="0.6605" width="0.0346" layer="51" curve="17.830845" />
<wire x1="0.6235" y1="0.6605" x2="0.6235" y2="0.7532" width="0.0346" layer="51" curve="1.010691" />
<wire x1="0.6235" y1="0.7532" x2="0.6061" y2="0.788" width="0.0346" layer="51" curve="52.095444" />
<wire x1="0.6061" y1="0.788" x2="0.5888" y2="0.7996" width="0.0346" layer="51" curve="7.066098" />
<wire x1="0.5888" y1="0.7996" x2="0.525" y2="0.7996" width="0.0346" layer="51" curve="60.682678" />
<wire x1="0.525" y1="0.7996" x2="0.5019" y2="0.7764" width="0.0346" layer="51" curve="29.506332" />
<wire x1="0.5019" y1="0.7764" x2="0.5019" y2="0.7011" width="0.0346" layer="51" curve="60.391666" />
<wire x1="0.5019" y1="0.7011" x2="0.525" y2="0.6779" width="0.0346" layer="51" curve="29.506332" />
<wire x1="0.525" y1="0.6779" x2="0.5772" y2="0.6721" width="0.0346" layer="51" curve="48.088447" />
<wire x1="0.5772" y1="0.6721" x2="0.6119" y2="0.7011" width="0.0346" layer="51" curve="44.50857" />
<wire x1="0.6119" y1="0.7011" x2="0.6235" y2="0.7358" width="0.0346" layer="51" curve="18.76533" />
<wire x1="0.6235" y1="0.7358" x2="0.6235" y2="0.8227" width="0.0346" layer="51" curve="1.67181" />
<wire x1="-1.0336" y1="0.7532" x2="-1.0336" y2="0.759" width="0.0346" layer="51" />
<wire x1="-1.0336" y1="0.759" x2="-1.0625" y2="0.8054" width="0.0346" layer="51" curve="46.770442" />
<wire x1="-1.0625" y1="0.8054" x2="-1.1147" y2="0.8112" width="0.0346" layer="51" curve="55.602918" />
<wire x1="-1.1147" y1="0.8112" x2="-1.1552" y2="0.759" width="0.0346" layer="51" curve="59.408808" />
<wire x1="-1.1552" y1="0.759" x2="-1.1552" y2="0.73" width="0.0346" layer="51" curve="0.473516" />
<wire x1="-1.1552" y1="0.73" x2="-1.1321" y2="0.6837" width="0.0346" layer="51" curve="45.840301" />
<wire x1="-1.1321" y1="0.6837" x2="-1.0567" y2="0.6779" width="0.0346" layer="51" curve="69.24831" />
<wire x1="-1.0567" y1="0.6779" x2="-1.0336" y2="0.7069" width="0.0346" layer="51" curve="23.22831" />
<wire x1="1.0464" y1="0.7532" x2="1.0464" y2="0.759" width="0.0346" layer="51" />
<wire x1="1.0464" y1="0.759" x2="1.0175" y2="0.8054" width="0.0346" layer="51" curve="46.770442" />
<wire x1="1.0175" y1="0.8054" x2="0.9653" y2="0.8112" width="0.0346" layer="51" curve="55.602918" />
<wire x1="0.9653" y1="0.8112" x2="0.9248" y2="0.759" width="0.0346" layer="51" curve="59.516792" />
<wire x1="0.9248" y1="0.759" x2="0.9248" y2="0.73" width="0.0346" layer="51" curve="0.473516" />
<wire x1="0.9248" y1="0.73" x2="0.9479" y2="0.6837" width="0.0346" layer="51" curve="45.840301" />
<wire x1="0.9479" y1="0.6837" x2="1.0233" y2="0.6779" width="0.0346" layer="51" curve="69.24831" />
<wire x1="1.0233" y1="0.6779" x2="1.0464" y2="0.7069" width="0.0346" layer="51" curve="23.100883" />
<wire x1="1.174" y1="0.6895" x2="1.1971" y2="0.6721" width="0.0346" layer="51" curve="16.054475" />
<wire x1="1.1971" y1="0.6721" x2="1.2377" y2="0.6779" width="0.0346" layer="51" curve="74.698698" />
<wire x1="1.2377" y1="0.6779" x2="1.2435" y2="0.7185" width="0.0346" layer="51" curve="73.268228" />
<wire x1="1.2435" y1="0.7185" x2="1.2203" y2="0.7416" width="0.0346" layer="51" curve="33.330651" />
<wire x1="1.2203" y1="0.7416" x2="1.1913" y2="0.759" width="0.0346" layer="51" curve="-5.57137" />
<wire x1="1.1913" y1="0.759" x2="1.1797" y2="0.7822" width="0.0346" layer="51" curve="-59.489763" />
<wire x1="1.1797" y1="0.7822" x2="1.1913" y2="0.8054" width="0.0346" layer="51" curve="-46.499586" />
<wire x1="1.1913" y1="0.8054" x2="1.2145" y2="0.8112" width="0.0346" layer="51" curve="-52.35058" />
<wire x1="1.2145" y1="0.8112" x2="1.2377" y2="0.7996" width="0.0346" layer="51" curve="-28.90978" />
<circle x="-1.2595" y="2.0337" radius="0.197" width="0" layer="51" />
<circle x="-0.3499" y="1.6397" radius="0.058" width="0" layer="51" />
<circle x="-0.1065" y="0.7358" radius="0.0695" width="0.0116" layer="51" />
<circle x="0.2991" y="0.7358" radius="0.0697" width="0.0346" layer="51" />
<circle x="-0.1123" y="0.7358" radius="0.0697" width="0.0346" layer="51" />
<circle x="0.78" y="0.8807" radius="0.0258" width="0" layer="51" />
<smd name="1" x="-2.28" y="-5.41" dx="0.8" dy="1.6" layer="1" />
<smd name="2" x="-1.14" y="-5.41" dx="0.8" dy="1.6" layer="1" />
<smd name="4" x="1.14" y="-5.41" dx="0.8" dy="1.6" layer="1" />
<smd name="5" x="2.28" y="-5.41" dx="0.8" dy="1.6" layer="1" />
<smd name="TAB" x="0" y="1.3" dx="6" dy="6" layer="1" />
<text x="-3.81" y="-3.175" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.08" y="-3.175" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.58" y1="-3.85" x2="-1.98" y2="-3.05" layer="21" />
<rectangle x1="-2.73" y1="-4.5" x2="-1.83" y2="-3.55" layer="21" />
<rectangle x1="-1.44" y1="-3.85" x2="-0.84" y2="-3.05" layer="21" />
<rectangle x1="-1.59" y1="-4.5" x2="-0.69" y2="-3.55" layer="21" />
<rectangle x1="-0.3" y1="-3.85" x2="0.3" y2="-3.05" layer="21" />
<rectangle x1="-0.45" y1="-3.9" x2="0.45" y2="-3.55" layer="21" />
<rectangle x1="0.84" y1="-3.85" x2="1.44" y2="-3.05" layer="21" />
<rectangle x1="0.69" y1="-4.5" x2="1.59" y2="-3.55" layer="21" />
<rectangle x1="1.98" y1="-3.85" x2="2.58" y2="-3.05" layer="21" />
<rectangle x1="1.83" y1="-4.5" x2="2.73" y2="-3.55" layer="21" />
<rectangle x1="-2.58" y1="-5.85" x2="-1.98" y2="-4.45" layer="51" />
<rectangle x1="-1.44" y1="-5.85" x2="-0.84" y2="-4.45" layer="51" />
<rectangle x1="0.84" y1="-5.85" x2="1.44" y2="-4.45" layer="51" />
<rectangle x1="1.98" y1="-5.85" x2="2.58" y2="-4.45" layer="51" />
<rectangle x1="-1.3059" y1="1.0197" x2="-1.2074" y2="1.7266" layer="51" />
<rectangle x1="-1.0741" y1="1.0197" x2="-0.9814" y2="1.4949" layer="51" />
<rectangle x1="-0.8829" y1="1.0197" x2="-0.7902" y2="1.379" layer="51" />
<rectangle x1="-0.6917" y1="1.4195" x2="-0.4831" y2="1.4949" layer="51" />
<rectangle x1="-0.6454" y1="1.0197" x2="-0.5527" y2="1.6861" layer="51" />
<rectangle x1="-0.3962" y1="1.0197" x2="-0.3035" y2="1.5006" layer="51" />
<rectangle x1="0.0094" y1="1.0197" x2="0.1021" y2="1.3732" layer="51" />
<rectangle x1="0.2064" y1="1.2399" x2="0.4903" y2="1.3094" layer="51" />
<rectangle x1="0.9885" y1="1.0197" x2="1.0813" y2="1.4949" layer="51" />
<rectangle x1="1.1797" y1="1.0197" x2="1.2725" y2="1.379" layer="51" />
<rectangle x1="-0.1819" y1="1.0197" x2="-0.0891" y2="1.4949" layer="51" />
<rectangle x1="-1.3117" y1="0.6547" x2="-1.2769" y2="0.8807" layer="51" />
<rectangle x1="-1.3233" y1="0.788" x2="-1.2479" y2="0.817" layer="51" />
<rectangle x1="-1.1668" y1="0.73" x2="-1.0162" y2="0.759" layer="51" />
<rectangle x1="-0.6801" y1="0.6547" x2="-0.6454" y2="0.9444" layer="51" />
<rectangle x1="-0.5816" y1="0.6547" x2="-0.5469" y2="0.7764" layer="51" />
<rectangle x1="-0.431" y1="0.6547" x2="-0.3963" y2="0.817" layer="51" />
<rectangle x1="-0.3325" y1="0.6547" x2="-0.2978" y2="0.7764" layer="51" />
<rectangle x1="0.079" y1="0.6547" x2="0.1136" y2="0.9443" layer="51" />
<rectangle x1="0.7626" y1="0.6547" x2="0.7973" y2="0.8227" layer="51" />
<rectangle x1="0.9132" y1="0.73" x2="1.0638" y2="0.759" layer="51" />
<polygon width="0.0102" layer="51">
<vertex x="-1.4507" y="1.9062" curve="-31.391799" />
<vertex x="-1.4913" y="2.0453" />
<vertex x="-1.6593" y="1.9873" curve="6.588458" />
<vertex x="-1.7578" y="1.9468" curve="1.838803" />
<vertex x="-1.9548" y="1.8483" curve="8.257493" />
<vertex x="-2.1054" y="1.7556" curve="3.883128" />
<vertex x="-2.2329" y="1.6571" curve="10.709256" />
<vertex x="-2.3024" y="1.5876" curve="-3.615587" />
<vertex x="-2.3894" y="1.4891" curve="21.558374" />
<vertex x="-2.4705" y="1.3616" curve="1.368686" />
<vertex x="-2.4994" y="1.2863" curve="21.04052" />
<vertex x="-2.5284" y="1.1182" curve="14.83372" />
<vertex x="-2.5052" y="0.956" curve="20.434382" />
<vertex x="-2.4241" y="0.788" curve="11.786339" />
<vertex x="-2.2735" y="0.62" curve="10.152173" />
<vertex x="-2.0823" y="0.4751" curve="8.28339" />
<vertex x="-1.7984" y="0.3245" curve="7.802828" />
<vertex x="-1.4623" y="0.2028" curve="3.951224" />
<vertex x="-1.161" y="0.1275" curve="2.412405" />
<vertex x="-0.8887" y="0.0753" curve="5.073858" />
<vertex x="-0.6106" y="0.0406" curve="4.25527" />
<vertex x="0.0673" y="0.0116" curve="13.441337" />
<vertex x="1.2029" y="0.1391" curve="10.613893" />
<vertex x="1.7939" y="0.3361" curve="8.146352" />
<vertex x="2.2111" y="0.5562" curve="15.823896" />
<vertex x="2.4197" y="0.73" curve="172.109628" />
<vertex x="2.4139" y="0.7358" curve="-5.433492" />
<vertex x="2.2748" y="0.6258" curve="-13.999292" />
<vertex x="2.0199" y="0.4867" curve="-0.116677" />
<vertex x="1.7707" y="0.3882" curve="-13.042388" />
<vertex x="1.3594" y="0.2781" curve="1.960346" />
<vertex x="1.116" y="0.2376" curve="-8.871401" />
<vertex x="0.3976" y="0.1622" curve="-3.114208" />
<vertex x="-0.176" y="0.1622" curve="-5.185695" />
<vertex x="-0.5758" y="0.1912" curve="-5.19899" />
<vertex x="-1.0336" y="0.2665" curve="-5.873861" />
<vertex x="-1.4044" y="0.365" curve="-8.501763" />
<vertex x="-1.6188" y="0.4519" curve="-3.187269" />
<vertex x="-1.8157" y="0.5562" curve="-13.025524" />
<vertex x="-2.007" y="0.6953" curve="-11.411402" />
<vertex x="-2.1518" y="0.8575" curve="-22.053503" />
<vertex x="-2.2329" y="1.0313" curve="-6.690142" />
<vertex x="-2.2503" y="1.124" curve="-26.38927" />
<vertex x="-2.2329" y="1.2921" curve="-19.878963" />
<vertex x="-2.146" y="1.4485" curve="-13.873453" />
<vertex x="-1.9664" y="1.6223" curve="-7.551782" />
<vertex x="-1.7462" y="1.7672" curve="-6.010589" />
<vertex x="-1.5376" y="1.8715" curve="-3.595975" />
</polygon>
<polygon width="0.0102" layer="51">
<vertex x="-1.0394" y="2.0453" />
<vertex x="-0.9524" y="2.0743" curve="-10.251571" />
<vertex x="-0.7323" y="2.1264" curve="0.331965" />
<vertex x="-0.3383" y="2.1843" curve="-3.88686" />
<vertex x="-0.1876" y="2.2017" curve="-4.876977" />
<vertex x="0.1137" y="2.2133" />
<vertex x="-0.0833" y="2.2133" curve="1.332929" />
<vertex x="-0.5816" y="2.2075" curve="6.144407" />
<vertex x="-0.8076" y="2.1901" curve="2.712231" />
<vertex x="-1.0683" y="2.1496" curve="-35.452386" />
</polygon>
<polygon width="0.0102" layer="51">
<vertex x="1.2667" y="1.3732" />
<vertex x="1.2667" y="1.4021" curve="34.212031" />
<vertex x="1.2435" y="1.4775" curve="47.803061" />
<vertex x="1.1971" y="1.5064" curve="25.543907" />
<vertex x="1.1276" y="1.5006" curve="47.389743" />
<vertex x="1.0813" y="1.4601" curve="26.063264" />
<vertex x="1.0639" y="1.379" curve="178.024479" />
<vertex x="1.0755" y="1.379" curve="-57.579798" />
<vertex x="1.0986" y="1.4195" curve="-62.869986" />
<vertex x="1.1508" y="1.4195" curve="-59.127037" />
<vertex x="1.174" y="1.3964" curve="-20.212776" />
<vertex x="1.1855" y="1.3674" />
</polygon>
<polygon width="0.0116" layer="51">
<vertex x="-0.5585" y="1.6803" />
<vertex x="-0.5585" y="1.6861" curve="-77.825279" />
<vertex x="-0.5353" y="1.715" curve="-24.601078" />
<vertex x="-0.5121" y="1.715" curve="-18.988937" />
<vertex x="-0.4831" y="1.7034" />
<vertex x="-0.4831" y="1.7961" />
<vertex x="-0.5005" y="1.8019" curve="36.751586" />
<vertex x="-0.5874" y="1.8019" curve="45.408376" />
<vertex x="-0.6338" y="1.7614" curve="28.072487" />
<vertex x="-0.6396" y="1.7208" curve="-19.854893" />
<vertex x="-0.6396" y="1.6803" />
</polygon>
<polygon width="0.0102" layer="51">
<vertex x="-0.796" y="1.3732" />
<vertex x="-0.796" y="1.4021" curve="34.212031" />
<vertex x="-0.8192" y="1.4775" curve="47.803061" />
<vertex x="-0.8656" y="1.5064" curve="25.543907" />
<vertex x="-0.9351" y="1.5006" curve="47.30993" />
<vertex x="-0.9814" y="1.4601" curve="26.063264" />
<vertex x="-0.9988" y="1.379" curve="178.024479" />
<vertex x="-0.9872" y="1.379" curve="-57.579798" />
<vertex x="-0.9641" y="1.4195" curve="-62.869986" />
<vertex x="-0.9119" y="1.4195" curve="-59.368405" />
<vertex x="-0.8887" y="1.3964" curve="-20.261561" />
<vertex x="-0.8772" y="1.3674" />
</polygon>
<polygon width="0.0102" layer="51">
<vertex x="0.0963" y="1.3732" />
<vertex x="0.0963" y="1.4021" curve="34.212031" />
<vertex x="0.0731" y="1.4775" curve="47.803061" />
<vertex x="0.0267" y="1.5064" curve="25.543907" />
<vertex x="-0.0428" y="1.5006" curve="47.30993" />
<vertex x="-0.0891" y="1.4601" curve="26.063264" />
<vertex x="-0.1065" y="1.379" curve="178.024479" />
<vertex x="-0.0949" y="1.379" curve="-57.579798" />
<vertex x="-0.0718" y="1.4195" curve="-62.869986" />
<vertex x="-0.0196" y="1.4195" curve="-59.368405" />
<vertex x="0.0036" y="1.3964" curve="-20.212776" />
<vertex x="0.0151" y="1.3674" />
</polygon>
<polygon width="0.0058" layer="51">
<vertex x="-0.796" y="0.7706" />
<vertex x="-0.796" y="0.8112" />
<vertex x="-0.8076" y="0.817" curve="67.399158" />
<vertex x="-0.9003" y="0.8054" curve="49.560797" />
<vertex x="-0.9293" y="0.7416" curve="56.073444" />
<vertex x="-0.8887" y="0.6663" curve="67.475342" />
<vertex x="-0.796" y="0.6663" />
<vertex x="-0.796" y="0.7069" />
<vertex x="-0.8018" y="0.7011" curve="-80.981953" />
<vertex x="-0.8713" y="0.6953" curve="-41.829572" />
<vertex x="-0.8945" y="0.73" curve="-25.492604" />
<vertex x="-0.8945" y="0.759" curve="-51.892995" />
<vertex x="-0.8713" y="0.788" curve="-34.657774" />
<vertex x="-0.8308" y="0.7938" curve="-48.640994" />
</polygon>
<polygon width="0.0116" layer="51">
<vertex x="-0.5527" y="0.759" />
<vertex x="-0.5527" y="0.7764" curve="59.178608" />
<vertex x="-0.5758" y="0.817" curve="81.84062" />
<vertex x="-0.6396" y="0.8054" curve="24.203979" />
<vertex x="-0.6512" y="0.7822" curve="29.0334" />
<vertex x="-0.6512" y="0.759" />
<vertex x="-0.6454" y="0.7764" curve="-76.177546" />
<vertex x="-0.6048" y="0.7996" curve="-80.099456" />
<vertex x="-0.5758" y="0.7648" />
</polygon>
<polygon width="0.0116" layer="51">
<vertex x="-0.3036" y="0.759" />
<vertex x="-0.3036" y="0.7764" curve="59.178608" />
<vertex x="-0.3267" y="0.817" curve="81.84062" />
<vertex x="-0.3905" y="0.8054" curve="24.203979" />
<vertex x="-0.4021" y="0.7822" curve="29.0334" />
<vertex x="-0.4021" y="0.759" />
<vertex x="-0.3963" y="0.7764" curve="-76.177546" />
<vertex x="-0.3557" y="0.7996" curve="-80.099456" />
<vertex x="-0.3267" y="0.7648" />
</polygon>
</package>
</packages>
<symbols>
<symbol name="BTS428L2">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="5.08" width="0.254" layer="94" />
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94" />
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94" />
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.254" layer="94" />
<text x="2.54" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-8.89" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IN" x="-7.62" y="2.54" length="short" direction="in" />
<pin name="ST" x="-7.62" y="-2.54" length="short" direction="in" />
<pin name="GND" x="0" y="-7.62" visible="pad" length="short" direction="pwr" rot="R90" />
<pin name="VBB" x="0" y="7.62" visible="off" length="short" direction="pwr" rot="R270" />
<pin name="OUT" x="7.62" y="0" length="short" direction="out" rot="R180" />
</symbol>
</symbols>
<devicesets>
<deviceset name="BTS428L2" prefix="IC">
<description>&lt;b&gt;Smart High-Side Power Switch&lt;/b&gt;&lt;p&gt;
One Channel: 60mOhm Status Feedback&lt;br&gt;
Source: Source: www.infineon.com .. BTS428L2_20030912.pdf</description>
<gates>
<gate name="G$1" symbol="BTS428L2" x="0" y="0" />
</gates>
<devices>
<device name="" package="TO252-5-11">
<connects>
<connect gate="G$1" pin="GND" pad="1" />
<connect gate="G$1" pin="IN" pad="2" />
<connect gate="G$1" pin="OUT" pad="5" />
<connect gate="G$1" pin="ST" pad="4" />
<connect gate="G$1" pin="VBB" pad="TAB" />
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no" />
<attribute name="MPN" value="" constant="no" />
<attribute name="OC_FARNELL" value="unknown" constant="no" />
<attribute name="OC_NEWARK" value="unknown" constant="no" />
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>Parts copied unchanged from the original EAGLE library pinhead.lbr</description>
<packages>
<package name="2X12">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-15.24" y1="-1.905" x2="-14.605" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-14.605" y1="-2.54" x2="-13.335" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-13.335" y1="-2.54" x2="-12.7" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-12.7" y1="-1.905" x2="-12.065" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-12.065" y1="-2.54" x2="-10.795" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-10.795" y1="-2.54" x2="-10.16" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-10.16" y1="-1.905" x2="-9.525" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-9.525" y1="-2.54" x2="-8.255" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-8.255" y1="-2.54" x2="-7.62" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-7.62" y1="-1.905" x2="-6.985" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-6.985" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-5.715" y1="-2.54" x2="-5.08" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-3.175" y1="-2.54" x2="-2.54" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-0.635" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-15.24" y1="-1.905" x2="-15.24" y2="1.905" width="0.1524" layer="21" />
<wire x1="-15.24" y1="1.905" x2="-14.605" y2="2.54" width="0.1524" layer="21" />
<wire x1="-14.605" y1="2.54" x2="-13.335" y2="2.54" width="0.1524" layer="21" />
<wire x1="-13.335" y1="2.54" x2="-12.7" y2="1.905" width="0.1524" layer="21" />
<wire x1="-12.7" y1="1.905" x2="-12.065" y2="2.54" width="0.1524" layer="21" />
<wire x1="-12.065" y1="2.54" x2="-10.795" y2="2.54" width="0.1524" layer="21" />
<wire x1="-10.795" y1="2.54" x2="-10.16" y2="1.905" width="0.1524" layer="21" />
<wire x1="-10.16" y1="1.905" x2="-9.525" y2="2.54" width="0.1524" layer="21" />
<wire x1="-9.525" y1="2.54" x2="-8.255" y2="2.54" width="0.1524" layer="21" />
<wire x1="-8.255" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21" />
<wire x1="-7.62" y1="1.905" x2="-6.985" y2="2.54" width="0.1524" layer="21" />
<wire x1="-6.985" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21" />
<wire x1="-5.715" y1="2.54" x2="-5.08" y2="1.905" width="0.1524" layer="21" />
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.1524" layer="21" />
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="21" />
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.1524" layer="21" />
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21" />
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21" />
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21" />
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21" />
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21" />
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21" />
<wire x1="2.54" y1="1.905" x2="3.175" y2="2.54" width="0.1524" layer="21" />
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.1524" layer="21" />
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.1524" layer="21" />
<wire x1="5.08" y1="1.905" x2="5.715" y2="2.54" width="0.1524" layer="21" />
<wire x1="5.715" y1="2.54" x2="6.985" y2="2.54" width="0.1524" layer="21" />
<wire x1="6.985" y1="2.54" x2="7.62" y2="1.905" width="0.1524" layer="21" />
<wire x1="7.62" y1="1.905" x2="8.255" y2="2.54" width="0.1524" layer="21" />
<wire x1="8.255" y1="2.54" x2="9.525" y2="2.54" width="0.1524" layer="21" />
<wire x1="9.525" y1="2.54" x2="10.16" y2="1.905" width="0.1524" layer="21" />
<wire x1="10.16" y1="1.905" x2="10.795" y2="2.54" width="0.1524" layer="21" />
<wire x1="10.795" y1="2.54" x2="12.065" y2="2.54" width="0.1524" layer="21" />
<wire x1="12.065" y1="2.54" x2="12.7" y2="1.905" width="0.1524" layer="21" />
<wire x1="12.7" y1="-1.905" x2="12.065" y2="-2.54" width="0.1524" layer="21" />
<wire x1="12.065" y1="-2.54" x2="10.795" y2="-2.54" width="0.1524" layer="21" />
<wire x1="10.16" y1="-1.905" x2="10.795" y2="-2.54" width="0.1524" layer="21" />
<wire x1="10.16" y1="-1.905" x2="9.525" y2="-2.54" width="0.1524" layer="21" />
<wire x1="9.525" y1="-2.54" x2="8.255" y2="-2.54" width="0.1524" layer="21" />
<wire x1="7.62" y1="-1.905" x2="8.255" y2="-2.54" width="0.1524" layer="21" />
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21" />
<wire x1="6.985" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21" />
<wire x1="5.08" y1="-1.905" x2="5.715" y2="-2.54" width="0.1524" layer="21" />
<wire x1="5.08" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21" />
<wire x1="4.445" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21" />
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.1524" layer="21" />
<wire x1="2.54" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21" />
<wire x1="1.905" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21" />
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-10.16" y1="1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21" />
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21" />
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21" />
<wire x1="5.08" y1="1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21" />
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21" />
<wire x1="10.16" y1="1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21" />
<wire x1="12.7" y1="1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21" />
<wire x1="12.7" y1="1.905" x2="13.335" y2="2.54" width="0.1524" layer="21" />
<wire x1="13.335" y1="2.54" x2="14.605" y2="2.54" width="0.1524" layer="21" />
<wire x1="14.605" y1="2.54" x2="15.24" y2="1.905" width="0.1524" layer="21" />
<wire x1="15.24" y1="-1.905" x2="14.605" y2="-2.54" width="0.1524" layer="21" />
<wire x1="14.605" y1="-2.54" x2="13.335" y2="-2.54" width="0.1524" layer="21" />
<wire x1="12.7" y1="-1.905" x2="13.335" y2="-2.54" width="0.1524" layer="21" />
<wire x1="15.24" y1="1.905" x2="15.24" y2="-1.905" width="0.1524" layer="21" />
<pad name="1" x="-13.97" y="-1.27" drill="1.016" shape="octagon" />
<pad name="2" x="-13.97" y="1.27" drill="1.016" shape="octagon" />
<pad name="3" x="-11.43" y="-1.27" drill="1.016" shape="octagon" />
<pad name="4" x="-11.43" y="1.27" drill="1.016" shape="octagon" />
<pad name="5" x="-8.89" y="-1.27" drill="1.016" shape="octagon" />
<pad name="6" x="-8.89" y="1.27" drill="1.016" shape="octagon" />
<pad name="7" x="-6.35" y="-1.27" drill="1.016" shape="octagon" />
<pad name="8" x="-6.35" y="1.27" drill="1.016" shape="octagon" />
<pad name="9" x="-3.81" y="-1.27" drill="1.016" shape="octagon" />
<pad name="10" x="-3.81" y="1.27" drill="1.016" shape="octagon" />
<pad name="11" x="-1.27" y="-1.27" drill="1.016" shape="octagon" />
<pad name="12" x="-1.27" y="1.27" drill="1.016" shape="octagon" />
<pad name="13" x="1.27" y="-1.27" drill="1.016" shape="octagon" />
<pad name="14" x="1.27" y="1.27" drill="1.016" shape="octagon" />
<pad name="15" x="3.81" y="-1.27" drill="1.016" shape="octagon" />
<pad name="16" x="3.81" y="1.27" drill="1.016" shape="octagon" />
<pad name="17" x="6.35" y="-1.27" drill="1.016" shape="octagon" />
<pad name="18" x="6.35" y="1.27" drill="1.016" shape="octagon" />
<pad name="19" x="8.89" y="-1.27" drill="1.016" shape="octagon" />
<pad name="20" x="8.89" y="1.27" drill="1.016" shape="octagon" />
<pad name="21" x="11.43" y="-1.27" drill="1.016" shape="octagon" />
<pad name="22" x="11.43" y="1.27" drill="1.016" shape="octagon" />
<pad name="23" x="13.97" y="-1.27" drill="1.016" shape="octagon" />
<pad name="24" x="13.97" y="1.27" drill="1.016" shape="octagon" />
<text x="-15.24" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-15.24" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-14.224" y1="-1.524" x2="-13.716" y2="-1.016" layer="51" />
<rectangle x1="-14.224" y1="1.016" x2="-13.716" y2="1.524" layer="51" />
<rectangle x1="-11.684" y1="1.016" x2="-11.176" y2="1.524" layer="51" />
<rectangle x1="-11.684" y1="-1.524" x2="-11.176" y2="-1.016" layer="51" />
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51" />
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51" />
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51" />
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51" />
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51" />
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51" />
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51" />
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51" />
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51" />
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51" />
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51" />
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51" />
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51" />
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51" />
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51" />
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51" />
<rectangle x1="11.176" y1="1.016" x2="11.684" y2="1.524" layer="51" />
<rectangle x1="11.176" y1="-1.524" x2="11.684" y2="-1.016" layer="51" />
<rectangle x1="13.716" y1="1.016" x2="14.224" y2="1.524" layer="51" />
<rectangle x1="13.716" y1="-1.524" x2="14.224" y2="-1.016" layer="51" />
</package>
<package name="2X03">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21" />
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="1.905" width="0.1524" layer="21" />
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21" />
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21" />
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21" />
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21" />
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21" />
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21" />
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21" />
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21" />
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21" />
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21" />
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21" />
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21" />
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21" />
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21" />
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21" />
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21" />
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21" />
<pad name="1" x="-2.54" y="-1.27" drill="1.016" shape="octagon" />
<pad name="2" x="-2.54" y="1.27" drill="1.016" shape="octagon" />
<pad name="3" x="0" y="-1.27" drill="1.016" shape="octagon" />
<pad name="4" x="0" y="1.27" drill="1.016" shape="octagon" />
<pad name="5" x="2.54" y="-1.27" drill="1.016" shape="octagon" />
<pad name="6" x="2.54" y="1.27" drill="1.016" shape="octagon" />
<text x="-3.81" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51" />
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51" />
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51" />
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51" />
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51" />
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51" />
</package>
</packages>
<symbols>
<symbol name="PINH2X12">
<wire x1="-6.35" y1="-17.78" x2="8.89" y2="-17.78" width="0.4064" layer="94" />
<wire x1="8.89" y1="-17.78" x2="8.89" y2="15.24" width="0.4064" layer="94" />
<wire x1="8.89" y1="15.24" x2="-6.35" y2="15.24" width="0.4064" layer="94" />
<wire x1="-6.35" y1="15.24" x2="-6.35" y2="-17.78" width="0.4064" layer="94" />
<text x="-6.35" y="15.875" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="12.7" visible="pad" length="short" direction="pas" function="dot" />
<pin name="2" x="5.08" y="12.7" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="3" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot" />
<pin name="4" x="5.08" y="10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="5" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot" />
<pin name="6" x="5.08" y="7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="7" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot" />
<pin name="8" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="9" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot" />
<pin name="10" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="11" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot" />
<pin name="12" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="13" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot" />
<pin name="14" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="15" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot" />
<pin name="16" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="17" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot" />
<pin name="18" x="5.08" y="-7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="19" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot" />
<pin name="20" x="5.08" y="-10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="21" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot" />
<pin name="22" x="5.08" y="-12.7" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="23" x="-2.54" y="-15.24" visible="pad" length="short" direction="pas" function="dot" />
<pin name="24" x="5.08" y="-15.24" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
</symbol>
<symbol name="PINH2X3">
<wire x1="-6.35" y1="-5.08" x2="8.89" y2="-5.08" width="0.4064" layer="94" />
<wire x1="8.89" y1="-5.08" x2="8.89" y2="5.08" width="0.4064" layer="94" />
<wire x1="8.89" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94" />
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94" />
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot" />
<pin name="2" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot" />
<pin name="4" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot" />
<pin name="6" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180" />
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X12" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X12" x="0" y="0" />
</gates>
<devices>
<device name="" package="2X12">
<connects>
<connect gate="A" pin="1" pad="1" />
<connect gate="A" pin="10" pad="10" />
<connect gate="A" pin="11" pad="11" />
<connect gate="A" pin="12" pad="12" />
<connect gate="A" pin="13" pad="13" />
<connect gate="A" pin="14" pad="14" />
<connect gate="A" pin="15" pad="15" />
<connect gate="A" pin="16" pad="16" />
<connect gate="A" pin="17" pad="17" />
<connect gate="A" pin="18" pad="18" />
<connect gate="A" pin="19" pad="19" />
<connect gate="A" pin="2" pad="2" />
<connect gate="A" pin="20" pad="20" />
<connect gate="A" pin="21" pad="21" />
<connect gate="A" pin="22" pad="22" />
<connect gate="A" pin="23" pad="23" />
<connect gate="A" pin="24" pad="24" />
<connect gate="A" pin="3" pad="3" />
<connect gate="A" pin="4" pad="4" />
<connect gate="A" pin="5" pad="5" />
<connect gate="A" pin="6" pad="6" />
<connect gate="A" pin="7" pad="7" />
<connect gate="A" pin="8" pad="8" />
<connect gate="A" pin="9" pad="9" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-2X3" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X3" x="0" y="0" />
</gates>
<devices>
<device name="" package="2X03">
<connects>
<connect gate="A" pin="1" pad="1" />
<connect gate="A" pin="2" pad="2" />
<connect gate="A" pin="3" pad="3" />
<connect gate="A" pin="4" pad="4" />
<connect gate="A" pin="5" pad="5" />
<connect gate="A" pin="6" pad="6" />
</connects>
<technologies>
<technology name="" />
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes />
<variantdefs />
<classes>
<class number="0" name="default" width="0.25" drill="0.3" />
<class number="1" name="power" width="1.5" drill="0.6" />
<class number="2" name="medium" width="0.8" drill="0.4" />
</classes>
<parts>
<part name="D1" library="diode" deviceset="SUPPRESSOR-" device="SMBJ" value="SMBJ24A" />
<part name="D2" library="diode" deviceset="MBRA340T3" device="" value="MBRA340T3" />
<part name="C1" library="rcl" deviceset="CPOL-EU" device="153CLV-0810" value="220u/35V" />
<part name="C2" library="rcl" deviceset="C-EU" device="C0603" value="100n/50V" />
<part name="U1" library="linear" deviceset="LM2596S" device="" value="LM2596S-5.0" />
<part name="D3" library="diode" deviceset="MBRA340T3" device="" value="MBRA340T3" />
<part name="L1" library="rcl" deviceset="L-EU" device="CEP125" value="33u/3A" />
<part name="C3" library="rcl" deviceset="CPOL-EU" device="153CLV-0810" value="220u/16V" />
<part name="C4" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="D4" library="diode" deviceset="MBRA340T3" device="" value="MBRA340T3" />
<part name="F1" library="rcl" deviceset="R-EU_" device="R1206" value="PTC 0.2A 1206" />
<part name="C5" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R1" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="LED1" library="led" deviceset="LED" device="CHIPLED_0603" value="GREEN" />
<part name="C6" library="rcl" deviceset="C-EU" device="C0805" value="10u/16V X7R" />
<part name="Q1" library="canio" deviceset="PFET-SO8" device="" value="AO4407A" />
<part name="D5" library="diode" deviceset="ZENER-DIODE" device="SOT23" value="BZX84C12" />
<part name="R2" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R3" library="rcl" deviceset="R-EU_" device="R0603" value="56k" />
<part name="R4" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="C7" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R5" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R6" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="C8" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="P1" library="pinhead" deviceset="PINHD-2X12" device="" value="WEACT P1" />
<part name="P3" library="pinhead" deviceset="PINHD-2X3" device="" value="WEACT P3" />
<part name="P2" library="pinhead" deviceset="PINHD-2X12" device="" value="WEACT P2" />
<part name="P4" library="pinhead" deviceset="PINHD-2X3" device="" value="WEACT P4" />
<part name="U2" library="canio" deviceset="TJA1051T3" device="" value="TJA1051T/3" />
<part name="C9" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="C10" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R7" library="rcl" deviceset="R-EU_" device="R0603" value="60R4" />
<part name="R8" library="rcl" deviceset="R-EU_" device="R0603" value="60R4" />
<part name="C11" library="rcl" deviceset="C-EU" device="C0603" value="4n7/50V" />
<part name="SJ1" library="jumper" deviceset="SJ" device="" value="TERMINATION" />
<part name="D6" library="canio" deviceset="NUP2105L" device="" value="NUP2105L" />
<part name="U3" library="canio" deviceset="TLE9201SG" device="" value="TLE9201SG" />
<part name="R9" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R10" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="C12" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="C13" library="rcl" deviceset="C-EU" device="C0603" value="100n/50V" />
<part name="C14" library="rcl" deviceset="CPOL-EU" device="153CLV-0810" value="220u/35V" />
<part name="C15" library="rcl" deviceset="C-EU" device="C0603" value="10n/50V" />
<part name="C16" library="rcl" deviceset="C-EU" device="C0603" value="10n/50V" />
<part name="R11" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R12" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q2" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R13" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R14" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q3" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R15" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R16" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q4" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R17" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R18" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q5" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R19" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R20" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q6" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R21" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="R22" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="Q7" library="canio" deviceset="NCV8402" device="" value="NCV8402" />
<part name="R23" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R24" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="U4" library="infineon" deviceset="BTS428L2" device="" value="BTS428L2" />
<part name="R25" library="rcl" deviceset="R-EU_" device="R0603" value="150R" />
<part name="R26" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R27" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="U5" library="infineon" deviceset="BTS428L2" device="" value="BTS428L2" />
<part name="R28" library="rcl" deviceset="R-EU_" device="R0603" value="150R" />
<part name="R29" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R30" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="U6" library="infineon" deviceset="BTS428L2" device="" value="BTS428L2" />
<part name="R31" library="rcl" deviceset="R-EU_" device="R0603" value="150R" />
<part name="R32" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R33" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="U7" library="infineon" deviceset="BTS428L2" device="" value="BTS428L2" />
<part name="R34" library="rcl" deviceset="R-EU_" device="R0603" value="150R" />
<part name="J1" library="canio" deviceset="SICMA24-BLACK" device="" value="HCCPHPE24BKA90F" />
<part name="J2" library="canio" deviceset="SICMA24-GREY" device="" value="HCCPHPE24GYB90F" />
<part name="SJ2" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R35" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R36" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R37" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D7" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C17" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R38" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C18" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ3" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R39" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R40" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R41" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D8" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C19" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R42" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C20" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ4" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R43" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R44" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R45" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D9" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C21" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R46" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C22" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ5" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R47" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R48" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R49" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D10" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C23" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R50" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C24" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ6" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R51" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R52" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R53" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D11" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C25" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R54" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C26" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ7" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R55" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R56" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R57" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D12" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C27" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R58" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C28" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ8" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R59" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R60" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R61" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D13" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C29" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R62" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C30" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ9" library="jumper" deviceset="SJ" device="" value="NTC PULL-UP" />
<part name="R63" library="rcl" deviceset="R-EU_" device="R0603" value="2k49" />
<part name="R64" library="rcl" deviceset="R-EU_" device="R0603" value="100k" />
<part name="R65" library="rcl" deviceset="R-EU_" device="R0603" value="180k" />
<part name="D14" library="diode" deviceset="BAT54S" device="" value="BAV99" />
<part name="C31" library="rcl" deviceset="C-EU" device="C0603" value="1n" />
<part name="R66" library="rcl" deviceset="R-EU_" device="R0603" value="1k" />
<part name="C32" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="U8" library="canio" deviceset="TLV9004" device="" value="TLV9004IDR" />
<part name="C33" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="U9" library="canio" deviceset="TLV9004" device="" value="TLV9004IDR" />
<part name="C34" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R67" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="R68" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="C35" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="C36" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="R69" library="rcl" deviceset="R-EU_" device="R0603" value="1M" />
<part name="SJ10" library="jumper" deviceset="SJ" device="" value="FLOATING PROBE" />
<part name="U10" library="canio" deviceset="AD8497" device="" value="AD8497ARMZ" />
<part name="C37" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R70" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R71" library="rcl" deviceset="R-EU_" device="R0603" value="18k" />
<part name="C38" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R72" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="R73" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="C39" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="C40" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="R74" library="rcl" deviceset="R-EU_" device="R0603" value="1M" />
<part name="SJ11" library="jumper" deviceset="SJ" device="" value="FLOATING PROBE" />
<part name="U11" library="canio" deviceset="AD8497" device="" value="AD8497ARMZ" />
<part name="C41" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R75" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R76" library="rcl" deviceset="R-EU_" device="R0603" value="18k" />
<part name="C42" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R77" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="R78" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="C43" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="C44" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="R79" library="rcl" deviceset="R-EU_" device="R0603" value="1M" />
<part name="SJ12" library="jumper" deviceset="SJ" device="" value="FLOATING PROBE" />
<part name="U12" library="canio" deviceset="AD8497" device="" value="AD8497ARMZ" />
<part name="C45" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R80" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R81" library="rcl" deviceset="R-EU_" device="R0603" value="18k" />
<part name="C46" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R82" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="R83" library="rcl" deviceset="R-EU_" device="R0603" value="100R" />
<part name="C47" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="C48" library="rcl" deviceset="C-EU" device="C0603" value="10n" />
<part name="R84" library="rcl" deviceset="R-EU_" device="R0603" value="1M" />
<part name="SJ13" library="jumper" deviceset="SJ" device="" value="FLOATING PROBE" />
<part name="U13" library="canio" deviceset="AD8497" device="" value="AD8497ARMZ" />
<part name="C49" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="R85" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="R86" library="rcl" deviceset="R-EU_" device="R0603" value="18k" />
<part name="C50" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ14" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R87" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R88" library="rcl" deviceset="R-EU_" device="R0603" value="2k2" />
<part name="D15" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C51" library="rcl" deviceset="C-EU" device="C0603" value="47p" />
<part name="SJ15" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R89" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R90" library="rcl" deviceset="R-EU_" device="R0603" value="2k2" />
<part name="D16" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C52" library="rcl" deviceset="C-EU" device="C0603" value="47p" />
<part name="SJ16" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R91" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R92" library="rcl" deviceset="R-EU_" device="R0603" value="2k2" />
<part name="D17" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C53" library="rcl" deviceset="C-EU" device="C0603" value="47p" />
<part name="SJ17" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R93" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R94" library="rcl" deviceset="R-EU_" device="R0603" value="2k2" />
<part name="D18" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C54" library="rcl" deviceset="C-EU" device="C0603" value="47p" />
<part name="SJ18" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R95" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R96" library="rcl" deviceset="R-EU_" device="R0603" value="2k2" />
<part name="D19" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C55" library="rcl" deviceset="C-EU" device="C0603" value="47p" />
<part name="SJ19" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R97" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R98" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="D20" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C56" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ20" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R99" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R100" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="D21" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C57" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ21" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R101" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R102" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="D22" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C58" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
<part name="SJ22" library="jumper" deviceset="SJ" device="" value="PULL-UP" />
<part name="R103" library="rcl" deviceset="R-EU_" device="R0603" value="4k7" />
<part name="R104" library="rcl" deviceset="R-EU_" device="R0603" value="10k" />
<part name="D23" library="diode" deviceset="BAT54S" device="" value="BAT54S" />
<part name="C59" library="rcl" deviceset="C-EU" device="C0603" value="100n" />
</parts>
<sheets>
<sheet>
<description>CAN IO SHIELD FOR WEACT STM32F405 - SHEET 1: POWER, MCU HEADERS, CAN, H-BRIDGE, OUTPUTS, CONNECTOR</description>
<plain>
<text x="0" y="10.16" size="3.81" layer="97">CAN IO SHIELD FOR WEACT STM32F405 - SHEET 1: POWER, MCU HEADERS, CAN, H-BRIDGE, OUTPUTS, CONNECTOR</text>
<text x="-12.7" y="2.54" size="2.54" layer="97">POWER INPUT (fit an external fuse)</text>
<text x="53.34" y="2.54" size="2.54" layer="97">5 V BUCK (LM2596S-5.0)</text>
<text x="119.38" y="2.54" size="2.54" layer="97">5 V DISTRIBUTION</text>
<text x="185.42" y="2.54" size="2.54" layer="97">REVERSE BATTERY PROTECTION (feeds the H-bridge)</text>
<text x="251.46" y="2.54" size="2.54" layer="97">SUPPLY MONITORS</text>
<text x="317.5" y="2.54" size="2.54" layer="97">WEACT HEADER P1 + P3 (left side)</text>
<text x="383.54" y="2.54" size="2.54" layer="97">WEACT HEADER P2 + P4 (right side)</text>
<text x="-12.7" y="-86.36" size="2.54" layer="97">CAN TRANSCEIVER</text>
<text x="53.34" y="-86.36" size="2.54" layer="97">H-BRIDGE (wastegate / bypass actuator)</text>
<text x="119.38" y="-86.36" size="2.54" layer="97">LOW SIDE PWM1</text>
<text x="175.26" y="-86.36" size="2.54" layer="97">LOW SIDE PWM2</text>
<text x="231.14" y="-86.36" size="2.54" layer="97">LOW SIDE PWM3</text>
<text x="287.02" y="-86.36" size="2.54" layer="97">LOW SIDE PWM4</text>
<text x="342.9" y="-86.36" size="2.54" layer="97">LOW SIDE PWM5</text>
<text x="398.78" y="-86.36" size="2.54" layer="97">LOW SIDE PWM6</text>
<text x="-12.7" y="-208.28" size="2.54" layer="97">HIGH SIDE OUT7</text>
<text x="48.26" y="-208.28" size="2.54" layer="97">HIGH SIDE OUT8</text>
<text x="109.22" y="-208.28" size="2.54" layer="97">HIGH SIDE OUT9</text>
<text x="170.18" y="-208.28" size="2.54" layer="97">HIGH SIDE OUT10</text>
<text x="231.14" y="-208.28" size="2.54" layer="97">CONNECTOR A - BLACK - POWER, OUTPUTS, CAN, FREQUENCY</text>
<text x="302.26" y="-208.28" size="2.54" layer="97">CONNECTOR B - GREY - SENSORS</text>
</plain>
<instances>
<instance part="D1" gate="G$1" x="0" y="-10.16" rot="R90" />
<instance part="D2" gate="G$1" x="0" y="-20.32" />
<instance part="C1" gate="G$1" x="0" y="-30.48" rot="R90" />
<instance part="C2" gate="G$1" x="0" y="-40.64" rot="R90" />
<instance part="U1" gate="G$1" x="66.04" y="-12.7" />
<instance part="D3" gate="G$1" x="66.04" y="-33.02" />
<instance part="L1" gate="G$1" x="66.04" y="-43.18" rot="R90" />
<instance part="C3" gate="G$1" x="66.04" y="-53.34" rot="R90" />
<instance part="C4" gate="G$1" x="66.04" y="-63.5" rot="R90" />
<instance part="D4" gate="G$1" x="132.08" y="-10.16" />
<instance part="F1" gate="G$1" x="132.08" y="-20.32" />
<instance part="C5" gate="G$1" x="132.08" y="-30.48" rot="R90" />
<instance part="R1" gate="G$1" x="132.08" y="-40.64" />
<instance part="LED1" gate="G$1" x="132.08" y="-50.8" rot="R90" />
<instance part="C6" gate="G$1" x="132.08" y="-60.96" rot="R90" />
<instance part="Q1" gate="G$1" x="198.12" y="-10.16" />
<instance part="D5" gate="G$1" x="198.12" y="-22.86" />
<instance part="R2" gate="G$1" x="198.12" y="-33.02" />
<instance part="R3" gate="G$1" x="264.16" y="-10.16" />
<instance part="R4" gate="G$1" x="264.16" y="-20.32" />
<instance part="C7" gate="G$1" x="264.16" y="-30.48" rot="R90" />
<instance part="R5" gate="G$1" x="264.16" y="-40.64" />
<instance part="R6" gate="G$1" x="264.16" y="-50.8" />
<instance part="C8" gate="G$1" x="264.16" y="-60.96" rot="R90" />
<instance part="P1" gate="A" x="330.2" y="-22.86" />
<instance part="P3" gate="A" x="330.2" y="-50.8" />
<instance part="P2" gate="A" x="396.24" y="-22.86" />
<instance part="P4" gate="A" x="396.24" y="-50.8" />
<instance part="U2" gate="G$1" x="0" y="-104.14" />
<instance part="C9" gate="G$1" x="0" y="-116.84" rot="R90" />
<instance part="C10" gate="G$1" x="0" y="-127" rot="R90" />
<instance part="R7" gate="G$1" x="0" y="-137.16" />
<instance part="R8" gate="G$1" x="0" y="-147.32" />
<instance part="C11" gate="G$1" x="0" y="-157.48" rot="R90" />
<instance part="SJ1" gate="1" x="0" y="-167.64" />
<instance part="D6" gate="G$1" x="0" y="-177.8" />
<instance part="U3" gate="G$1" x="66.04" y="-106.68" />
<instance part="R9" gate="G$1" x="66.04" y="-124.46" />
<instance part="R10" gate="G$1" x="66.04" y="-134.62" />
<instance part="C12" gate="G$1" x="66.04" y="-144.78" rot="R90" />
<instance part="C13" gate="G$1" x="66.04" y="-154.94" rot="R90" />
<instance part="C14" gate="G$1" x="66.04" y="-165.1" rot="R90" />
<instance part="C15" gate="G$1" x="66.04" y="-175.26" rot="R90" />
<instance part="C16" gate="G$1" x="66.04" y="-185.42" rot="R90" />
<instance part="R11" gate="G$1" x="132.08" y="-99.06" />
<instance part="R12" gate="G$1" x="132.08" y="-109.22" />
<instance part="Q2" gate="G$1" x="132.08" y="-119.38" />
<instance part="R13" gate="G$1" x="187.96" y="-99.06" />
<instance part="R14" gate="G$1" x="187.96" y="-109.22" />
<instance part="Q3" gate="G$1" x="187.96" y="-119.38" />
<instance part="R15" gate="G$1" x="243.84" y="-99.06" />
<instance part="R16" gate="G$1" x="243.84" y="-109.22" />
<instance part="Q4" gate="G$1" x="243.84" y="-119.38" />
<instance part="R17" gate="G$1" x="299.72" y="-99.06" />
<instance part="R18" gate="G$1" x="299.72" y="-109.22" />
<instance part="Q5" gate="G$1" x="299.72" y="-119.38" />
<instance part="R19" gate="G$1" x="355.6" y="-99.06" />
<instance part="R20" gate="G$1" x="355.6" y="-109.22" />
<instance part="Q6" gate="G$1" x="355.6" y="-119.38" />
<instance part="R21" gate="G$1" x="411.48" y="-99.06" />
<instance part="R22" gate="G$1" x="411.48" y="-109.22" />
<instance part="Q7" gate="G$1" x="411.48" y="-119.38" />
<instance part="R23" gate="G$1" x="0" y="-220.98" />
<instance part="R24" gate="G$1" x="0" y="-231.14" />
<instance part="U4" gate="G$1" x="0" y="-248.92" />
<instance part="R25" gate="G$1" x="0" y="-266.7" />
<instance part="R26" gate="G$1" x="60.96" y="-220.98" />
<instance part="R27" gate="G$1" x="60.96" y="-231.14" />
<instance part="U5" gate="G$1" x="60.96" y="-248.92" />
<instance part="R28" gate="G$1" x="60.96" y="-266.7" />
<instance part="R29" gate="G$1" x="121.92" y="-220.98" />
<instance part="R30" gate="G$1" x="121.92" y="-231.14" />
<instance part="U6" gate="G$1" x="121.92" y="-248.92" />
<instance part="R31" gate="G$1" x="121.92" y="-266.7" />
<instance part="R32" gate="G$1" x="182.88" y="-220.98" />
<instance part="R33" gate="G$1" x="182.88" y="-231.14" />
<instance part="U7" gate="G$1" x="182.88" y="-248.92" />
<instance part="R34" gate="G$1" x="182.88" y="-266.7" />
<instance part="J1" gate="G$1" x="243.84" y="-236.22" />
<instance part="J2" gate="G$1" x="314.96" y="-236.22" />
</instances>
<busses />
<nets>
<net name="+3V3" class="2">
<segment>
<pinref part="P3" gate="A" pin="1" />
<wire x1="327.66" y1="-48.26" x2="325.12" y2="-48.26" width="0.1524" layer="91" />
<label x="325.12" y="-48.26" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P3" gate="A" pin="3" />
<wire x1="327.66" y1="-50.8" x2="325.12" y2="-50.8" width="0.1524" layer="91" />
<label x="325.12" y="-50.8" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P3" gate="A" pin="5" />
<wire x1="327.66" y1="-53.34" x2="325.12" y2="-53.34" width="0.1524" layer="91" />
<label x="325.12" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="VIO" />
<wire x1="15.24" y1="-101.6" x2="17.78" y2="-101.6" width="0.1524" layer="91" />
<label x="17.78" y="-101.6" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-127" x2="-5.08" y2="-127" width="0.1524" layer="91" />
<label x="-5.08" y="-127" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VSO" />
<wire x1="81.28" y1="-101.6" x2="83.82" y2="-101.6" width="0.1524" layer="91" />
<label x="83.82" y="-101.6" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="1" />
<wire x1="60.96" y1="-124.46" x2="58.42" y2="-124.46" width="0.1524" layer="91" />
<label x="58.42" y="-124.46" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1" />
<wire x1="60.96" y1="-134.62" x2="58.42" y2="-134.62" width="0.1524" layer="91" />
<label x="58.42" y="-134.62" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="1" />
<wire x1="63.5" y1="-144.78" x2="60.96" y2="-144.78" width="0.1524" layer="91" />
<label x="60.96" y="-144.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="+5V" class="2">
<segment>
<pinref part="U1" gate="G$1" pin="FB" />
<wire x1="76.2" y1="-15.24" x2="78.74" y2="-15.24" width="0.1524" layer="91" />
<label x="78.74" y="-15.24" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="L1" gate="G$1" pin="2" />
<wire x1="71.12" y1="-43.18" x2="73.66" y2="-43.18" width="0.1524" layer="91" />
<label x="73.66" y="-43.18" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="+" />
<wire x1="63.5" y1="-53.34" x2="60.96" y2="-53.34" width="0.1524" layer="91" />
<label x="60.96" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="1" />
<wire x1="63.5" y1="-63.5" x2="60.96" y2="-63.5" width="0.1524" layer="91" />
<label x="60.96" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D4" gate="G$1" pin="A" />
<wire x1="129.54" y1="-10.16" x2="127" y2="-10.16" width="0.1524" layer="91" />
<label x="127" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="F1" gate="G$1" pin="1" />
<wire x1="127" y1="-20.32" x2="124.46" y2="-20.32" width="0.1524" layer="91" />
<label x="124.46" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="1" />
<wire x1="127" y1="-40.64" x2="124.46" y2="-40.64" width="0.1524" layer="91" />
<label x="124.46" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="VCC" />
<wire x1="15.24" y1="-99.06" x2="17.78" y2="-99.06" width="0.1524" layer="91" />
<label x="17.78" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-116.84" x2="-5.08" y2="-116.84" width="0.1524" layer="91" />
<label x="-5.08" y="-116.84" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="5V_SENS" class="2">
<segment>
<pinref part="F1" gate="G$1" pin="2" />
<wire x1="137.16" y1="-20.32" x2="139.7" y2="-20.32" width="0.1524" layer="91" />
<label x="139.7" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="1" />
<wire x1="129.54" y1="-30.48" x2="127" y2="-30.48" width="0.1524" layer="91" />
<label x="127" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1" />
<wire x1="259.08" y1="-40.64" x2="256.54" y2="-40.64" width="0.1524" layer="91" />
<label x="256.54" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="A1" />
<wire x1="299.72" y1="-220.98" x2="297.18" y2="-220.98" width="0.1524" layer="91" />
<label x="297.18" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="A8" />
<wire x1="299.72" y1="-238.76" x2="297.18" y2="-238.76" width="0.1524" layer="91" />
<label x="297.18" y="-238.76" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A2" />
<wire x1="299.72" y1="-223.52" x2="297.18" y2="-223.52" width="0.1524" layer="91" />
<label x="297.18" y="-223.52" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_PA6" class="0">
<segment>
<pinref part="P1" gate="A" pin="15" />
<wire x1="327.66" y1="-27.94" x2="325.12" y2="-27.94" width="0.1524" layer="91" />
<label x="325.12" y="-27.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A3" />
<wire x1="299.72" y1="-226.06" x2="297.18" y2="-226.06" width="0.1524" layer="91" />
<label x="297.18" y="-226.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_PA7" class="0">
<segment>
<pinref part="P1" gate="A" pin="18" />
<wire x1="335.28" y1="-30.48" x2="337.82" y2="-30.48" width="0.1524" layer="91" />
<label x="337.82" y="-30.48" size="1.27" layer="95" />
</segment>
</net>
<net name="AN3_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A4" />
<wire x1="299.72" y1="-228.6" x2="297.18" y2="-228.6" width="0.1524" layer="91" />
<label x="297.18" y="-228.6" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN3_PC0" class="0">
<segment>
<pinref part="P1" gate="A" pin="5" />
<wire x1="327.66" y1="-15.24" x2="325.12" y2="-15.24" width="0.1524" layer="91" />
<label x="325.12" y="-15.24" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A5" />
<wire x1="299.72" y1="-231.14" x2="297.18" y2="-231.14" width="0.1524" layer="91" />
<label x="297.18" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_PC1" class="0">
<segment>
<pinref part="P1" gate="A" pin="8" />
<wire x1="335.28" y1="-17.78" x2="337.82" y2="-17.78" width="0.1524" layer="91" />
<label x="337.82" y="-17.78" size="1.27" layer="95" />
</segment>
</net>
<net name="AN5_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A6" />
<wire x1="299.72" y1="-233.68" x2="297.18" y2="-233.68" width="0.1524" layer="91" />
<label x="297.18" y="-233.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN5_PC2" class="0">
<segment>
<pinref part="P1" gate="A" pin="7" />
<wire x1="327.66" y1="-17.78" x2="325.12" y2="-17.78" width="0.1524" layer="91" />
<label x="325.12" y="-17.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="A7" />
<wire x1="299.72" y1="-236.22" x2="297.18" y2="-236.22" width="0.1524" layer="91" />
<label x="297.18" y="-236.22" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_PC3" class="0">
<segment>
<pinref part="P1" gate="A" pin="10" />
<wire x1="335.28" y1="-20.32" x2="337.82" y2="-20.32" width="0.1524" layer="91" />
<label x="337.82" y="-20.32" size="1.27" layer="95" />
</segment>
</net>
<net name="AN7_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B2" />
<wire x1="299.72" y1="-243.84" x2="297.18" y2="-243.84" width="0.1524" layer="91" />
<label x="297.18" y="-243.84" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN7_PC4" class="0">
<segment>
<pinref part="P1" gate="A" pin="17" />
<wire x1="327.66" y1="-30.48" x2="325.12" y2="-30.48" width="0.1524" layer="91" />
<label x="325.12" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B3" />
<wire x1="299.72" y1="-246.38" x2="297.18" y2="-246.38" width="0.1524" layer="91" />
<label x="297.18" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_PC5" class="0">
<segment>
<pinref part="P1" gate="A" pin="20" />
<wire x1="335.28" y1="-33.02" x2="337.82" y2="-33.02" width="0.1524" layer="91" />
<label x="337.82" y="-33.02" size="1.27" layer="95" />
</segment>
</net>
<net name="BUCK_SW" class="1">
<segment>
<pinref part="U1" gate="G$1" pin="OUT" />
<wire x1="76.2" y1="-10.16" x2="78.74" y2="-10.16" width="0.1524" layer="91" />
<label x="78.74" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D3" gate="G$1" pin="C" />
<wire x1="68.58" y1="-33.02" x2="71.12" y2="-33.02" width="0.1524" layer="91" />
<label x="71.12" y="-33.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="L1" gate="G$1" pin="1" />
<wire x1="60.96" y1="-43.18" x2="58.42" y2="-43.18" width="0.1524" layer="91" />
<label x="58.42" y="-43.18" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="CAN_H" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="CANH" />
<wire x1="15.24" y1="-104.14" x2="17.78" y2="-104.14" width="0.1524" layer="91" />
<label x="17.78" y="-104.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-137.16" x2="-7.62" y2="-137.16" width="0.1524" layer="91" />
<label x="-7.62" y="-137.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D6" gate="G$1" pin="CANH" />
<wire x1="-15.24" y1="-177.8" x2="-17.78" y2="-177.8" width="0.1524" layer="91" />
<label x="-17.78" y="-177.8" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B6" />
<wire x1="259.08" y1="-223.52" x2="261.62" y2="-223.52" width="0.1524" layer="91" />
<label x="261.62" y="-223.52" size="1.27" layer="95" />
</segment>
</net>
<net name="CAN_L" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="CANL" />
<wire x1="15.24" y1="-106.68" x2="17.78" y2="-106.68" width="0.1524" layer="91" />
<label x="17.78" y="-106.68" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ1" gate="1" pin="2" />
<wire x1="5.08" y1="-167.64" x2="7.62" y2="-167.64" width="0.1524" layer="91" />
<label x="7.62" y="-167.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D6" gate="G$1" pin="CANL" />
<wire x1="-15.24" y1="-180.34" x2="-17.78" y2="-180.34" width="0.1524" layer="91" />
<label x="-17.78" y="-180.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B7" />
<wire x1="259.08" y1="-226.06" x2="261.62" y2="-226.06" width="0.1524" layer="91" />
<label x="261.62" y="-226.06" size="1.27" layer="95" />
</segment>
</net>
<net name="CAN_MID" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="2" />
<wire x1="5.08" y1="-137.16" x2="7.62" y2="-137.16" width="0.1524" layer="91" />
<label x="7.62" y="-137.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-147.32" x2="-7.62" y2="-147.32" width="0.1524" layer="91" />
<label x="-7.62" y="-147.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-157.48" x2="-5.08" y2="-157.48" width="0.1524" layer="91" />
<label x="-5.08" y="-157.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="CAN_RX_PB8" class="0">
<segment>
<pinref part="P2" gate="A" pin="4" />
<wire x1="401.32" y1="-12.7" x2="403.86" y2="-12.7" width="0.1524" layer="91" />
<label x="403.86" y="-12.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="RXD" />
<wire x1="-15.24" y1="-101.6" x2="-17.78" y2="-101.6" width="0.1524" layer="91" />
<label x="-17.78" y="-101.6" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="CAN_TERM" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="2" />
<wire x1="5.08" y1="-147.32" x2="7.62" y2="-147.32" width="0.1524" layer="91" />
<label x="7.62" y="-147.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ1" gate="1" pin="1" />
<wire x1="-5.08" y1="-167.64" x2="-7.62" y2="-167.64" width="0.1524" layer="91" />
<label x="-7.62" y="-167.64" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="CAN_TX_PB9" class="0">
<segment>
<pinref part="P2" gate="A" pin="1" />
<wire x1="393.7" y1="-10.16" x2="391.16" y2="-10.16" width="0.1524" layer="91" />
<label x="391.16" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="TXD" />
<wire x1="-15.24" y1="-99.06" x2="-17.78" y2="-99.06" width="0.1524" layer="91" />
<label x="-17.78" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI1_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C1" />
<wire x1="330.2" y1="-231.14" x2="332.74" y2="-231.14" width="0.1524" layer="91" />
<label x="332.74" y="-231.14" size="1.27" layer="95" />
</segment>
</net>
<net name="DI1_PC13" class="0">
<segment>
<pinref part="P1" gate="A" pin="4" />
<wire x1="335.28" y1="-12.7" x2="337.82" y2="-12.7" width="0.1524" layer="91" />
<label x="337.82" y="-12.7" size="1.27" layer="95" />
</segment>
</net>
<net name="DI2_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C8" />
<wire x1="330.2" y1="-248.92" x2="332.74" y2="-248.92" width="0.1524" layer="91" />
<label x="332.74" y="-248.92" size="1.27" layer="95" />
</segment>
</net>
<net name="DI2_PD2" class="0">
<segment>
<pinref part="P2" gate="A" pin="10" />
<wire x1="401.32" y1="-20.32" x2="403.86" y2="-20.32" width="0.1524" layer="91" />
<label x="403.86" y="-20.32" size="1.27" layer="95" />
</segment>
</net>
<net name="DI3_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B4" />
<wire x1="299.72" y1="-248.92" x2="297.18" y2="-248.92" width="0.1524" layer="91" />
<label x="297.18" y="-248.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI3_PB12" class="0">
<segment>
<pinref part="P4" gate="A" pin="1" />
<wire x1="393.7" y1="-48.26" x2="391.16" y2="-48.26" width="0.1524" layer="91" />
<label x="391.16" y="-48.26" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI4_IN" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B5" />
<wire x1="330.2" y1="-220.98" x2="332.74" y2="-220.98" width="0.1524" layer="91" />
<label x="332.74" y="-220.98" size="1.27" layer="95" />
</segment>
</net>
<net name="DI4_PB4" class="0">
<segment>
<pinref part="P2" gate="A" pin="8" />
<wire x1="401.32" y1="-17.78" x2="403.86" y2="-17.78" width="0.1524" layer="91" />
<label x="403.86" y="-17.78" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT1_N" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C3" />
<wire x1="330.2" y1="-236.22" x2="332.74" y2="-236.22" width="0.1524" layer="91" />
<label x="332.74" y="-236.22" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT1_P" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C2" />
<wire x1="330.2" y1="-233.68" x2="332.74" y2="-233.68" width="0.1524" layer="91" />
<label x="332.74" y="-233.68" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT1_PA0" class="0">
<segment>
<pinref part="P1" gate="A" pin="9" />
<wire x1="327.66" y1="-20.32" x2="325.12" y2="-20.32" width="0.1524" layer="91" />
<label x="325.12" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_N" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C5" />
<wire x1="330.2" y1="-241.3" x2="332.74" y2="-241.3" width="0.1524" layer="91" />
<label x="332.74" y="-241.3" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT2_P" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C4" />
<wire x1="330.2" y1="-238.76" x2="332.74" y2="-238.76" width="0.1524" layer="91" />
<label x="332.74" y="-238.76" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT2_PA1" class="0">
<segment>
<pinref part="P1" gate="A" pin="12" />
<wire x1="335.28" y1="-22.86" x2="337.82" y2="-22.86" width="0.1524" layer="91" />
<label x="337.82" y="-22.86" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT3_N" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C7" />
<wire x1="330.2" y1="-246.38" x2="332.74" y2="-246.38" width="0.1524" layer="91" />
<label x="332.74" y="-246.38" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT3_P" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="C6" />
<wire x1="330.2" y1="-243.84" x2="332.74" y2="-243.84" width="0.1524" layer="91" />
<label x="332.74" y="-243.84" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT3_PA2" class="0">
<segment>
<pinref part="P1" gate="A" pin="11" />
<wire x1="327.66" y1="-22.86" x2="325.12" y2="-22.86" width="0.1524" layer="91" />
<label x="325.12" y="-22.86" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_N" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B7" />
<wire x1="330.2" y1="-226.06" x2="332.74" y2="-226.06" width="0.1524" layer="91" />
<label x="332.74" y="-226.06" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT4_P" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="B6" />
<wire x1="330.2" y1="-223.52" x2="332.74" y2="-223.52" width="0.1524" layer="91" />
<label x="332.74" y="-223.52" size="1.27" layer="95" />
</segment>
</net>
<net name="EGT4_PA3" class="0">
<segment>
<pinref part="P1" gate="A" pin="14" />
<wire x1="335.28" y1="-25.4" x2="337.82" y2="-25.4" width="0.1524" layer="91" />
<label x="337.82" y="-25.4" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ1_IN" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="C2" />
<wire x1="259.08" y1="-233.68" x2="261.62" y2="-233.68" width="0.1524" layer="91" />
<label x="261.62" y="-233.68" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ1_PA15" class="0">
<segment>
<pinref part="P2" gate="A" pin="14" />
<wire x1="401.32" y1="-25.4" x2="403.86" y2="-25.4" width="0.1524" layer="91" />
<label x="403.86" y="-25.4" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ2_IN" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="C3" />
<wire x1="259.08" y1="-236.22" x2="261.62" y2="-236.22" width="0.1524" layer="91" />
<label x="261.62" y="-236.22" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ2_PB3" class="0">
<segment>
<pinref part="P2" gate="A" pin="7" />
<wire x1="393.7" y1="-17.78" x2="391.16" y2="-17.78" width="0.1524" layer="91" />
<label x="391.16" y="-17.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ3_IN" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="C4" />
<wire x1="259.08" y1="-238.76" x2="261.62" y2="-238.76" width="0.1524" layer="91" />
<label x="261.62" y="-238.76" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ3_PB10" class="0">
<segment>
<pinref part="P1" gate="A" pin="24" />
<wire x1="335.28" y1="-38.1" x2="337.82" y2="-38.1" width="0.1524" layer="91" />
<label x="337.82" y="-38.1" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ4_IN" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="C5" />
<wire x1="259.08" y1="-241.3" x2="261.62" y2="-241.3" width="0.1524" layer="91" />
<label x="261.62" y="-241.3" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ4_PB11" class="0">
<segment>
<pinref part="P1" gate="A" pin="23" />
<wire x1="327.66" y1="-38.1" x2="325.12" y2="-38.1" width="0.1524" layer="91" />
<label x="325.12" y="-38.1" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ5_IN" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="C6" />
<wire x1="259.08" y1="-243.84" x2="261.62" y2="-243.84" width="0.1524" layer="91" />
<label x="261.62" y="-243.84" size="1.27" layer="95" />
</segment>
</net>
<net name="FREQ5_PA8" class="0">
<segment>
<pinref part="P2" gate="A" pin="17" />
<wire x1="393.7" y1="-30.48" x2="391.16" y2="-30.48" width="0.1524" layer="91" />
<label x="391.16" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="GND" class="1">
<segment>
<pinref part="D1" gate="G$1" pin="A" />
<wire x1="2.54" y1="-10.16" x2="5.08" y2="-10.16" width="0.1524" layer="91" />
<label x="5.08" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="-" />
<wire x1="5.08" y1="-30.48" x2="7.62" y2="-30.48" width="0.1524" layer="91" />
<label x="7.62" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2" />
<wire x1="5.08" y1="-40.64" x2="7.62" y2="-40.64" width="0.1524" layer="91" />
<label x="7.62" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="EN" />
<wire x1="55.88" y1="-15.24" x2="53.34" y2="-15.24" width="0.1524" layer="91" />
<label x="53.34" y="-15.24" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND" />
<wire x1="66.04" y1="-22.86" x2="66.04" y2="-25.4" width="0.1524" layer="91" />
<label x="66.04" y="-25.4" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND@1" />
<wire x1="68.58" y1="-22.86" x2="68.58" y2="-25.4" width="0.1524" layer="91" />
<label x="68.58" y="-25.4" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="D3" gate="G$1" pin="A" />
<wire x1="63.5" y1="-33.02" x2="60.96" y2="-33.02" width="0.1524" layer="91" />
<label x="60.96" y="-33.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="-" />
<wire x1="71.12" y1="-53.34" x2="73.66" y2="-53.34" width="0.1524" layer="91" />
<label x="73.66" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2" />
<wire x1="71.12" y1="-63.5" x2="73.66" y2="-63.5" width="0.1524" layer="91" />
<label x="73.66" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2" />
<wire x1="137.16" y1="-30.48" x2="139.7" y2="-30.48" width="0.1524" layer="91" />
<label x="139.7" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="C" />
<wire x1="137.16" y1="-50.8" x2="139.7" y2="-50.8" width="0.1524" layer="91" />
<label x="139.7" y="-50.8" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2" />
<wire x1="137.16" y1="-60.96" x2="139.7" y2="-60.96" width="0.1524" layer="91" />
<label x="139.7" y="-60.96" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2" />
<wire x1="203.2" y1="-33.02" x2="205.74" y2="-33.02" width="0.1524" layer="91" />
<label x="205.74" y="-33.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="2" />
<wire x1="269.24" y1="-20.32" x2="271.78" y2="-20.32" width="0.1524" layer="91" />
<label x="271.78" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2" />
<wire x1="269.24" y1="-30.48" x2="271.78" y2="-30.48" width="0.1524" layer="91" />
<label x="271.78" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2" />
<wire x1="269.24" y1="-50.8" x2="271.78" y2="-50.8" width="0.1524" layer="91" />
<label x="271.78" y="-50.8" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2" />
<wire x1="269.24" y1="-60.96" x2="271.78" y2="-60.96" width="0.1524" layer="91" />
<label x="271.78" y="-60.96" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P1" gate="A" pin="2" />
<wire x1="335.28" y1="-10.16" x2="337.82" y2="-10.16" width="0.1524" layer="91" />
<label x="337.82" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P3" gate="A" pin="2" />
<wire x1="335.28" y1="-48.26" x2="337.82" y2="-48.26" width="0.1524" layer="91" />
<label x="337.82" y="-48.26" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P3" gate="A" pin="4" />
<wire x1="335.28" y1="-50.8" x2="337.82" y2="-50.8" width="0.1524" layer="91" />
<label x="337.82" y="-50.8" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P3" gate="A" pin="6" />
<wire x1="335.28" y1="-53.34" x2="337.82" y2="-53.34" width="0.1524" layer="91" />
<label x="337.82" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P2" gate="A" pin="2" />
<wire x1="401.32" y1="-10.16" x2="403.86" y2="-10.16" width="0.1524" layer="91" />
<label x="403.86" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="P4" gate="A" pin="5" />
<wire x1="393.7" y1="-53.34" x2="391.16" y2="-53.34" width="0.1524" layer="91" />
<label x="391.16" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P4" gate="A" pin="6" />
<wire x1="401.32" y1="-53.34" x2="403.86" y2="-53.34" width="0.1524" layer="91" />
<label x="403.86" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="S" />
<wire x1="-15.24" y1="-104.14" x2="-17.78" y2="-104.14" width="0.1524" layer="91" />
<label x="-17.78" y="-104.14" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND" />
<wire x1="-15.24" y1="-106.68" x2="-17.78" y2="-106.68" width="0.1524" layer="91" />
<label x="-17.78" y="-106.68" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2" />
<wire x1="5.08" y1="-116.84" x2="7.62" y2="-116.84" width="0.1524" layer="91" />
<label x="7.62" y="-116.84" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2" />
<wire x1="5.08" y1="-127" x2="7.62" y2="-127" width="0.1524" layer="91" />
<label x="7.62" y="-127" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2" />
<wire x1="5.08" y1="-157.48" x2="7.62" y2="-157.48" width="0.1524" layer="91" />
<label x="7.62" y="-157.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D6" gate="G$1" pin="GND" />
<wire x1="15.24" y1="-177.8" x2="17.78" y2="-177.8" width="0.1524" layer="91" />
<label x="17.78" y="-177.8" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="SCK" />
<wire x1="50.8" y1="-109.22" x2="48.26" y2="-109.22" width="0.1524" layer="91" />
<label x="48.26" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="SI" />
<wire x1="50.8" y1="-111.76" x2="48.26" y2="-111.76" width="0.1524" layer="91" />
<label x="48.26" y="-111.76" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND" />
<wire x1="81.28" y1="-109.22" x2="83.82" y2="-109.22" width="0.1524" layer="91" />
<label x="83.82" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2" />
<wire x1="71.12" y1="-144.78" x2="73.66" y2="-144.78" width="0.1524" layer="91" />
<label x="73.66" y="-144.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="2" />
<wire x1="71.12" y1="-154.94" x2="73.66" y2="-154.94" width="0.1524" layer="91" />
<label x="73.66" y="-154.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C14" gate="G$1" pin="-" />
<wire x1="71.12" y1="-165.1" x2="73.66" y2="-165.1" width="0.1524" layer="91" />
<label x="73.66" y="-165.1" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="2" />
<wire x1="71.12" y1="-175.26" x2="73.66" y2="-175.26" width="0.1524" layer="91" />
<label x="73.66" y="-175.26" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2" />
<wire x1="71.12" y1="-185.42" x2="73.66" y2="-185.42" width="0.1524" layer="91" />
<label x="73.66" y="-185.42" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="2" />
<wire x1="137.16" y1="-109.22" x2="139.7" y2="-109.22" width="0.1524" layer="91" />
<label x="139.7" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="SOURCE" />
<wire x1="147.32" y1="-121.92" x2="149.86" y2="-121.92" width="0.1524" layer="91" />
<label x="149.86" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="2" />
<wire x1="193.04" y1="-109.22" x2="195.58" y2="-109.22" width="0.1524" layer="91" />
<label x="195.58" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q3" gate="G$1" pin="SOURCE" />
<wire x1="203.2" y1="-121.92" x2="205.74" y2="-121.92" width="0.1524" layer="91" />
<label x="205.74" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R16" gate="G$1" pin="2" />
<wire x1="248.92" y1="-109.22" x2="251.46" y2="-109.22" width="0.1524" layer="91" />
<label x="251.46" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q4" gate="G$1" pin="SOURCE" />
<wire x1="259.08" y1="-121.92" x2="261.62" y2="-121.92" width="0.1524" layer="91" />
<label x="261.62" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R18" gate="G$1" pin="2" />
<wire x1="304.8" y1="-109.22" x2="307.34" y2="-109.22" width="0.1524" layer="91" />
<label x="307.34" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q5" gate="G$1" pin="SOURCE" />
<wire x1="314.96" y1="-121.92" x2="317.5" y2="-121.92" width="0.1524" layer="91" />
<label x="317.5" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R20" gate="G$1" pin="2" />
<wire x1="360.68" y1="-109.22" x2="363.22" y2="-109.22" width="0.1524" layer="91" />
<label x="363.22" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q6" gate="G$1" pin="SOURCE" />
<wire x1="370.84" y1="-121.92" x2="373.38" y2="-121.92" width="0.1524" layer="91" />
<label x="373.38" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R22" gate="G$1" pin="2" />
<wire x1="416.56" y1="-109.22" x2="419.1" y2="-109.22" width="0.1524" layer="91" />
<label x="419.1" y="-109.22" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="Q7" gate="G$1" pin="SOURCE" />
<wire x1="426.72" y1="-121.92" x2="429.26" y2="-121.92" width="0.1524" layer="91" />
<label x="429.26" y="-121.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R24" gate="G$1" pin="2" />
<wire x1="5.08" y1="-231.14" x2="7.62" y2="-231.14" width="0.1524" layer="91" />
<label x="7.62" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R25" gate="G$1" pin="2" />
<wire x1="5.08" y1="-266.7" x2="7.62" y2="-266.7" width="0.1524" layer="91" />
<label x="7.62" y="-266.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="2" />
<wire x1="66.04" y1="-231.14" x2="68.58" y2="-231.14" width="0.1524" layer="91" />
<label x="68.58" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R28" gate="G$1" pin="2" />
<wire x1="66.04" y1="-266.7" x2="68.58" y2="-266.7" width="0.1524" layer="91" />
<label x="68.58" y="-266.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R30" gate="G$1" pin="2" />
<wire x1="127" y1="-231.14" x2="129.54" y2="-231.14" width="0.1524" layer="91" />
<label x="129.54" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R31" gate="G$1" pin="2" />
<wire x1="127" y1="-266.7" x2="129.54" y2="-266.7" width="0.1524" layer="91" />
<label x="129.54" y="-266.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R33" gate="G$1" pin="2" />
<wire x1="187.96" y1="-231.14" x2="190.5" y2="-231.14" width="0.1524" layer="91" />
<label x="190.5" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R34" gate="G$1" pin="2" />
<wire x1="187.96" y1="-266.7" x2="190.5" y2="-266.7" width="0.1524" layer="91" />
<label x="190.5" y="-266.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B1" />
<wire x1="228.6" y1="-241.3" x2="226.06" y2="-241.3" width="0.1524" layer="91" />
<label x="226.06" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B8" />
<wire x1="259.08" y1="-228.6" x2="261.62" y2="-228.6" width="0.1524" layer="91" />
<label x="261.62" y="-228.6" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="C7" />
<wire x1="259.08" y1="-246.38" x2="261.62" y2="-246.38" width="0.1524" layer="91" />
<label x="261.62" y="-246.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="B1" />
<wire x1="299.72" y1="-241.3" x2="297.18" y2="-241.3" width="0.1524" layer="91" />
<label x="297.18" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="B8" />
<wire x1="330.2" y1="-228.6" x2="332.74" y2="-228.6" width="0.1524" layer="91" />
<label x="332.74" y="-228.6" size="1.27" layer="95" />
</segment>
</net>
<net name="HB_CSN" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="CSN" />
<wire x1="50.8" y1="-106.68" x2="48.26" y2="-106.68" width="0.1524" layer="91" />
<label x="48.26" y="-106.68" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="2" />
<wire x1="71.12" y1="-124.46" x2="73.66" y2="-124.46" width="0.1524" layer="91" />
<label x="73.66" y="-124.46" size="1.27" layer="95" />
</segment>
</net>
<net name="HB_DIR_PB15" class="0">
<segment>
<pinref part="P2" gate="A" pin="24" />
<wire x1="401.32" y1="-38.1" x2="403.86" y2="-38.1" width="0.1524" layer="91" />
<label x="403.86" y="-38.1" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="DIR" />
<wire x1="50.8" y1="-101.6" x2="48.26" y2="-101.6" width="0.1524" layer="91" />
<label x="48.26" y="-101.6" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HB_DIS_PB13" class="0">
<segment>
<pinref part="P4" gate="A" pin="2" />
<wire x1="401.32" y1="-48.26" x2="403.86" y2="-48.26" width="0.1524" layer="91" />
<label x="403.86" y="-48.26" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="DIS" />
<wire x1="50.8" y1="-104.14" x2="48.26" y2="-104.14" width="0.1524" layer="91" />
<label x="48.26" y="-104.14" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="2" />
<wire x1="71.12" y1="-134.62" x2="73.66" y2="-134.62" width="0.1524" layer="91" />
<label x="73.66" y="-134.62" size="1.27" layer="95" />
</segment>
</net>
<net name="HB_PWM_PB14" class="0">
<segment>
<pinref part="P2" gate="A" pin="23" />
<wire x1="393.7" y1="-38.1" x2="391.16" y2="-38.1" width="0.1524" layer="91" />
<label x="391.16" y="-38.1" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="PWM" />
<wire x1="50.8" y1="-99.06" x2="48.26" y2="-99.06" width="0.1524" layer="91" />
<label x="48.26" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS10" class="1">
<segment>
<pinref part="U7" gate="G$1" pin="OUT" />
<wire x1="190.5" y1="-248.92" x2="193.04" y2="-248.92" width="0.1524" layer="91" />
<label x="193.04" y="-248.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B5" />
<wire x1="259.08" y1="-220.98" x2="261.62" y2="-220.98" width="0.1524" layer="91" />
<label x="261.62" y="-220.98" size="1.27" layer="95" />
</segment>
</net>
<net name="HS10_GND" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="GND" />
<wire x1="182.88" y1="-256.54" x2="182.88" y2="-259.08" width="0.1524" layer="91" />
<label x="182.88" y="-259.08" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="R34" gate="G$1" pin="1" />
<wire x1="177.8" y1="-266.7" x2="175.26" y2="-266.7" width="0.1524" layer="91" />
<label x="175.26" y="-266.7" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS10_IN" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="2" />
<wire x1="187.96" y1="-220.98" x2="190.5" y2="-220.98" width="0.1524" layer="91" />
<label x="190.5" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="IN" />
<wire x1="175.26" y1="-246.38" x2="172.72" y2="-246.38" width="0.1524" layer="91" />
<label x="172.72" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS7" class="1">
<segment>
<pinref part="U4" gate="G$1" pin="OUT" />
<wire x1="7.62" y1="-248.92" x2="10.16" y2="-248.92" width="0.1524" layer="91" />
<label x="10.16" y="-248.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B2" />
<wire x1="228.6" y1="-243.84" x2="226.06" y2="-243.84" width="0.1524" layer="91" />
<label x="226.06" y="-243.84" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS7_GND" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="GND" />
<wire x1="0" y1="-256.54" x2="0" y2="-259.08" width="0.1524" layer="91" />
<label x="0" y="-259.08" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="R25" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-266.7" x2="-7.62" y2="-266.7" width="0.1524" layer="91" />
<label x="-7.62" y="-266.7" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS7_IN" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="2" />
<wire x1="5.08" y1="-220.98" x2="7.62" y2="-220.98" width="0.1524" layer="91" />
<label x="7.62" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="IN" />
<wire x1="-7.62" y1="-246.38" x2="-10.16" y2="-246.38" width="0.1524" layer="91" />
<label x="-10.16" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS8" class="1">
<segment>
<pinref part="U5" gate="G$1" pin="OUT" />
<wire x1="68.58" y1="-248.92" x2="71.12" y2="-248.92" width="0.1524" layer="91" />
<label x="71.12" y="-248.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B3" />
<wire x1="228.6" y1="-246.38" x2="226.06" y2="-246.38" width="0.1524" layer="91" />
<label x="226.06" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS8_GND" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="GND" />
<wire x1="60.96" y1="-256.54" x2="60.96" y2="-259.08" width="0.1524" layer="91" />
<label x="60.96" y="-259.08" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="R28" gate="G$1" pin="1" />
<wire x1="55.88" y1="-266.7" x2="53.34" y2="-266.7" width="0.1524" layer="91" />
<label x="53.34" y="-266.7" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS8_IN" class="0">
<segment>
<pinref part="R26" gate="G$1" pin="2" />
<wire x1="66.04" y1="-220.98" x2="68.58" y2="-220.98" width="0.1524" layer="91" />
<label x="68.58" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="IN" />
<wire x1="53.34" y1="-246.38" x2="50.8" y2="-246.38" width="0.1524" layer="91" />
<label x="50.8" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS9" class="1">
<segment>
<pinref part="U6" gate="G$1" pin="OUT" />
<wire x1="129.54" y1="-248.92" x2="132.08" y2="-248.92" width="0.1524" layer="91" />
<label x="132.08" y="-248.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="B4" />
<wire x1="228.6" y1="-248.92" x2="226.06" y2="-248.92" width="0.1524" layer="91" />
<label x="226.06" y="-248.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS9_GND" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="GND" />
<wire x1="121.92" y1="-256.54" x2="121.92" y2="-259.08" width="0.1524" layer="91" />
<label x="121.92" y="-259.08" size="1.27" layer="95" rot="R270" />
</segment>
<segment>
<pinref part="R31" gate="G$1" pin="1" />
<wire x1="116.84" y1="-266.7" x2="114.3" y2="-266.7" width="0.1524" layer="91" />
<label x="114.3" y="-266.7" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="HS9_IN" class="0">
<segment>
<pinref part="R29" gate="G$1" pin="2" />
<wire x1="127" y1="-220.98" x2="129.54" y2="-220.98" width="0.1524" layer="91" />
<label x="129.54" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="IN" />
<wire x1="114.3" y1="-246.38" x2="111.76" y2="-246.38" width="0.1524" layer="91" />
<label x="111.76" y="-246.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LED_PWR" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2" />
<wire x1="137.16" y1="-40.64" x2="139.7" y2="-40.64" width="0.1524" layer="91" />
<label x="139.7" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="A" />
<wire x1="129.54" y1="-50.8" x2="127" y2="-50.8" width="0.1524" layer="91" />
<label x="127" y="-50.8" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS1" class="2">
<segment>
<pinref part="Q2" gate="G$1" pin="DRAIN" />
<wire x1="147.32" y1="-119.38" x2="149.86" y2="-119.38" width="0.1524" layer="91" />
<label x="149.86" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A2" />
<wire x1="228.6" y1="-223.52" x2="226.06" y2="-223.52" width="0.1524" layer="91" />
<label x="226.06" y="-223.52" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS1_G" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="2" />
<wire x1="137.16" y1="-99.06" x2="139.7" y2="-99.06" width="0.1524" layer="91" />
<label x="139.7" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1" />
<wire x1="127" y1="-109.22" x2="124.46" y2="-109.22" width="0.1524" layer="91" />
<label x="124.46" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="IN" />
<wire x1="116.84" y1="-119.38" x2="114.3" y2="-119.38" width="0.1524" layer="91" />
<label x="114.3" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS2" class="2">
<segment>
<pinref part="Q3" gate="G$1" pin="DRAIN" />
<wire x1="203.2" y1="-119.38" x2="205.74" y2="-119.38" width="0.1524" layer="91" />
<label x="205.74" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A3" />
<wire x1="228.6" y1="-226.06" x2="226.06" y2="-226.06" width="0.1524" layer="91" />
<label x="226.06" y="-226.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS2_G" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="2" />
<wire x1="193.04" y1="-99.06" x2="195.58" y2="-99.06" width="0.1524" layer="91" />
<label x="195.58" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="1" />
<wire x1="182.88" y1="-109.22" x2="180.34" y2="-109.22" width="0.1524" layer="91" />
<label x="180.34" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q3" gate="G$1" pin="IN" />
<wire x1="172.72" y1="-119.38" x2="170.18" y2="-119.38" width="0.1524" layer="91" />
<label x="170.18" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS3" class="2">
<segment>
<pinref part="Q4" gate="G$1" pin="DRAIN" />
<wire x1="259.08" y1="-119.38" x2="261.62" y2="-119.38" width="0.1524" layer="91" />
<label x="261.62" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A4" />
<wire x1="228.6" y1="-228.6" x2="226.06" y2="-228.6" width="0.1524" layer="91" />
<label x="226.06" y="-228.6" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS3_G" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="2" />
<wire x1="248.92" y1="-99.06" x2="251.46" y2="-99.06" width="0.1524" layer="91" />
<label x="251.46" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R16" gate="G$1" pin="1" />
<wire x1="238.76" y1="-109.22" x2="236.22" y2="-109.22" width="0.1524" layer="91" />
<label x="236.22" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q4" gate="G$1" pin="IN" />
<wire x1="228.6" y1="-119.38" x2="226.06" y2="-119.38" width="0.1524" layer="91" />
<label x="226.06" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS4" class="2">
<segment>
<pinref part="Q5" gate="G$1" pin="DRAIN" />
<wire x1="314.96" y1="-119.38" x2="317.5" y2="-119.38" width="0.1524" layer="91" />
<label x="317.5" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A5" />
<wire x1="228.6" y1="-231.14" x2="226.06" y2="-231.14" width="0.1524" layer="91" />
<label x="226.06" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS4_G" class="0">
<segment>
<pinref part="R17" gate="G$1" pin="2" />
<wire x1="304.8" y1="-99.06" x2="307.34" y2="-99.06" width="0.1524" layer="91" />
<label x="307.34" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R18" gate="G$1" pin="1" />
<wire x1="294.64" y1="-109.22" x2="292.1" y2="-109.22" width="0.1524" layer="91" />
<label x="292.1" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q5" gate="G$1" pin="IN" />
<wire x1="284.48" y1="-119.38" x2="281.94" y2="-119.38" width="0.1524" layer="91" />
<label x="281.94" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS5" class="2">
<segment>
<pinref part="Q6" gate="G$1" pin="DRAIN" />
<wire x1="370.84" y1="-119.38" x2="373.38" y2="-119.38" width="0.1524" layer="91" />
<label x="373.38" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A6" />
<wire x1="228.6" y1="-233.68" x2="226.06" y2="-233.68" width="0.1524" layer="91" />
<label x="226.06" y="-233.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS5_G" class="0">
<segment>
<pinref part="R19" gate="G$1" pin="2" />
<wire x1="360.68" y1="-99.06" x2="363.22" y2="-99.06" width="0.1524" layer="91" />
<label x="363.22" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R20" gate="G$1" pin="1" />
<wire x1="350.52" y1="-109.22" x2="347.98" y2="-109.22" width="0.1524" layer="91" />
<label x="347.98" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q6" gate="G$1" pin="IN" />
<wire x1="340.36" y1="-119.38" x2="337.82" y2="-119.38" width="0.1524" layer="91" />
<label x="337.82" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS6" class="2">
<segment>
<pinref part="Q7" gate="G$1" pin="DRAIN" />
<wire x1="426.72" y1="-119.38" x2="429.26" y2="-119.38" width="0.1524" layer="91" />
<label x="429.26" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A7" />
<wire x1="228.6" y1="-236.22" x2="226.06" y2="-236.22" width="0.1524" layer="91" />
<label x="226.06" y="-236.22" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="LS6_G" class="0">
<segment>
<pinref part="R21" gate="G$1" pin="2" />
<wire x1="416.56" y1="-99.06" x2="419.1" y2="-99.06" width="0.1524" layer="91" />
<label x="419.1" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R22" gate="G$1" pin="1" />
<wire x1="406.4" y1="-109.22" x2="403.86" y2="-109.22" width="0.1524" layer="91" />
<label x="403.86" y="-109.22" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q7" gate="G$1" pin="IN" />
<wire x1="396.24" y1="-119.38" x2="393.7" y2="-119.38" width="0.1524" layer="91" />
<label x="393.7" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="MOT_A" class="1">
<segment>
<pinref part="U3" gate="G$1" pin="OUT1" />
<wire x1="81.28" y1="-104.14" x2="83.82" y2="-104.14" width="0.1524" layer="91" />
<label x="83.82" y="-104.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="1" />
<wire x1="63.5" y1="-175.26" x2="60.96" y2="-175.26" width="0.1524" layer="91" />
<label x="60.96" y="-175.26" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="C1" />
<wire x1="259.08" y1="-231.14" x2="261.62" y2="-231.14" width="0.1524" layer="91" />
<label x="261.62" y="-231.14" size="1.27" layer="95" />
</segment>
</net>
<net name="MOT_B" class="1">
<segment>
<pinref part="U3" gate="G$1" pin="OUT2" />
<wire x1="81.28" y1="-106.68" x2="83.82" y2="-106.68" width="0.1524" layer="91" />
<label x="83.82" y="-106.68" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="1" />
<wire x1="63.5" y1="-185.42" x2="60.96" y2="-185.42" width="0.1524" layer="91" />
<label x="60.96" y="-185.42" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="C8" />
<wire x1="259.08" y1="-248.92" x2="261.62" y2="-248.92" width="0.1524" layer="91" />
<label x="261.62" y="-248.92" size="1.27" layer="95" />
</segment>
</net>
<net name="OUT10_PC12" class="0">
<segment>
<pinref part="P2" gate="A" pin="9" />
<wire x1="393.7" y1="-20.32" x2="391.16" y2="-20.32" width="0.1524" layer="91" />
<label x="391.16" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R32" gate="G$1" pin="1" />
<wire x1="177.8" y1="-220.98" x2="175.26" y2="-220.98" width="0.1524" layer="91" />
<label x="175.26" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R33" gate="G$1" pin="1" />
<wire x1="177.8" y1="-231.14" x2="175.26" y2="-231.14" width="0.1524" layer="91" />
<label x="175.26" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="OUT7_PB5" class="0">
<segment>
<pinref part="P2" gate="A" pin="5" />
<wire x1="393.7" y1="-15.24" x2="391.16" y2="-15.24" width="0.1524" layer="91" />
<label x="391.16" y="-15.24" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R23" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-220.98" x2="-7.62" y2="-220.98" width="0.1524" layer="91" />
<label x="-7.62" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R24" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-231.14" x2="-7.62" y2="-231.14" width="0.1524" layer="91" />
<label x="-7.62" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="OUT8_PA9" class="0">
<segment>
<pinref part="P2" gate="A" pin="18" />
<wire x1="401.32" y1="-30.48" x2="403.86" y2="-30.48" width="0.1524" layer="91" />
<label x="403.86" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R26" gate="G$1" pin="1" />
<wire x1="55.88" y1="-220.98" x2="53.34" y2="-220.98" width="0.1524" layer="91" />
<label x="53.34" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="1" />
<wire x1="55.88" y1="-231.14" x2="53.34" y2="-231.14" width="0.1524" layer="91" />
<label x="53.34" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="OUT9_PA10" class="0">
<segment>
<pinref part="P2" gate="A" pin="15" />
<wire x1="393.7" y1="-27.94" x2="391.16" y2="-27.94" width="0.1524" layer="91" />
<label x="391.16" y="-27.94" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R29" gate="G$1" pin="1" />
<wire x1="116.84" y1="-220.98" x2="114.3" y2="-220.98" width="0.1524" layer="91" />
<label x="114.3" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R30" gate="G$1" pin="1" />
<wire x1="116.84" y1="-231.14" x2="114.3" y2="-231.14" width="0.1524" layer="91" />
<label x="114.3" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM1_PC6" class="0">
<segment>
<pinref part="P2" gate="A" pin="21" />
<wire x1="393.7" y1="-35.56" x2="391.16" y2="-35.56" width="0.1524" layer="91" />
<label x="391.16" y="-35.56" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="1" />
<wire x1="127" y1="-99.06" x2="124.46" y2="-99.06" width="0.1524" layer="91" />
<label x="124.46" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM2_PC7" class="0">
<segment>
<pinref part="P2" gate="A" pin="22" />
<wire x1="401.32" y1="-35.56" x2="403.86" y2="-35.56" width="0.1524" layer="91" />
<label x="403.86" y="-35.56" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R13" gate="G$1" pin="1" />
<wire x1="182.88" y1="-99.06" x2="180.34" y2="-99.06" width="0.1524" layer="91" />
<label x="180.34" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM3_PC8" class="0">
<segment>
<pinref part="P2" gate="A" pin="19" />
<wire x1="393.7" y1="-33.02" x2="391.16" y2="-33.02" width="0.1524" layer="91" />
<label x="391.16" y="-33.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R15" gate="G$1" pin="1" />
<wire x1="238.76" y1="-99.06" x2="236.22" y2="-99.06" width="0.1524" layer="91" />
<label x="236.22" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM4_PC9" class="0">
<segment>
<pinref part="P2" gate="A" pin="20" />
<wire x1="401.32" y1="-33.02" x2="403.86" y2="-33.02" width="0.1524" layer="91" />
<label x="403.86" y="-33.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R17" gate="G$1" pin="1" />
<wire x1="294.64" y1="-99.06" x2="292.1" y2="-99.06" width="0.1524" layer="91" />
<label x="292.1" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM5_PB6" class="0">
<segment>
<pinref part="P2" gate="A" pin="6" />
<wire x1="401.32" y1="-15.24" x2="403.86" y2="-15.24" width="0.1524" layer="91" />
<label x="403.86" y="-15.24" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R19" gate="G$1" pin="1" />
<wire x1="350.52" y1="-99.06" x2="347.98" y2="-99.06" width="0.1524" layer="91" />
<label x="347.98" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="PWM6_PB7" class="0">
<segment>
<pinref part="P2" gate="A" pin="3" />
<wire x1="393.7" y1="-12.7" x2="391.16" y2="-12.7" width="0.1524" layer="91" />
<label x="391.16" y="-12.7" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R21" gate="G$1" pin="1" />
<wire x1="406.4" y1="-99.06" x2="403.86" y2="-99.06" width="0.1524" layer="91" />
<label x="403.86" y="-99.06" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="RP_GATE" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="G" />
<wire x1="182.88" y1="-10.16" x2="180.34" y2="-10.16" width="0.1524" layer="91" />
<label x="180.34" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D5" gate="G$1" pin="A" />
<wire x1="195.58" y1="-22.86" x2="193.04" y2="-22.86" width="0.1524" layer="91" />
<label x="193.04" y="-22.86" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1" />
<wire x1="193.04" y1="-33.02" x2="190.5" y2="-33.02" width="0.1524" layer="91" />
<label x="190.5" y="-33.02" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="V5MON_PB0" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="2" />
<wire x1="269.24" y1="-40.64" x2="271.78" y2="-40.64" width="0.1524" layer="91" />
<label x="271.78" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="1" />
<wire x1="259.08" y1="-50.8" x2="256.54" y2="-50.8" width="0.1524" layer="91" />
<label x="256.54" y="-50.8" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="1" />
<wire x1="261.62" y1="-60.96" x2="259.08" y2="-60.96" width="0.1524" layer="91" />
<label x="259.08" y="-60.96" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P1" gate="A" pin="19" />
<wire x1="327.66" y1="-33.02" x2="325.12" y2="-33.02" width="0.1524" layer="91" />
<label x="325.12" y="-33.02" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="VBAT" class="1">
<segment>
<pinref part="D1" gate="G$1" pin="C" />
<wire x1="-2.54" y1="-10.16" x2="-5.08" y2="-10.16" width="0.1524" layer="91" />
<label x="-5.08" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="A" />
<wire x1="-2.54" y1="-20.32" x2="-5.08" y2="-20.32" width="0.1524" layer="91" />
<label x="-5.08" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="D" />
<wire x1="213.36" y1="-10.16" x2="215.9" y2="-10.16" width="0.1524" layer="91" />
<label x="215.9" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="VBB" />
<wire x1="0" y1="-241.3" x2="0" y2="-238.76" width="0.1524" layer="91" />
<label x="0" y="-238.76" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="VBB" />
<wire x1="60.96" y1="-241.3" x2="60.96" y2="-238.76" width="0.1524" layer="91" />
<label x="60.96" y="-238.76" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="VBB" />
<wire x1="121.92" y1="-241.3" x2="121.92" y2="-238.76" width="0.1524" layer="91" />
<label x="121.92" y="-238.76" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="VBB" />
<wire x1="182.88" y1="-241.3" x2="182.88" y2="-238.76" width="0.1524" layer="91" />
<label x="182.88" y="-238.76" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A1" />
<wire x1="228.6" y1="-220.98" x2="226.06" y2="-220.98" width="0.1524" layer="91" />
<label x="226.06" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="A8" />
<wire x1="228.6" y1="-238.76" x2="226.06" y2="-238.76" width="0.1524" layer="91" />
<label x="226.06" y="-238.76" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="VBATMON_PB1" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2" />
<wire x1="269.24" y1="-10.16" x2="271.78" y2="-10.16" width="0.1524" layer="91" />
<label x="271.78" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="1" />
<wire x1="259.08" y1="-20.32" x2="256.54" y2="-20.32" width="0.1524" layer="91" />
<label x="256.54" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="1" />
<wire x1="261.62" y1="-30.48" x2="259.08" y2="-30.48" width="0.1524" layer="91" />
<label x="259.08" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P1" gate="A" pin="22" />
<wire x1="335.28" y1="-35.56" x2="337.82" y2="-35.56" width="0.1524" layer="91" />
<label x="337.82" y="-35.56" size="1.27" layer="95" />
</segment>
</net>
<net name="VBAT_PROT" class="1">
<segment>
<pinref part="D2" gate="G$1" pin="C" />
<wire x1="2.54" y1="-20.32" x2="5.08" y2="-20.32" width="0.1524" layer="91" />
<label x="5.08" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="+" />
<wire x1="-2.54" y1="-30.48" x2="-5.08" y2="-30.48" width="0.1524" layer="91" />
<label x="-5.08" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-40.64" x2="-5.08" y2="-40.64" width="0.1524" layer="91" />
<label x="-5.08" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IN" />
<wire x1="55.88" y1="-10.16" x2="53.34" y2="-10.16" width="0.1524" layer="91" />
<label x="53.34" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1" />
<wire x1="259.08" y1="-10.16" x2="256.54" y2="-10.16" width="0.1524" layer="91" />
<label x="256.54" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="VBAT_SW" class="1">
<segment>
<pinref part="Q1" gate="G$1" pin="S" />
<wire x1="213.36" y1="-12.7" x2="215.9" y2="-12.7" width="0.1524" layer="91" />
<label x="215.9" y="-12.7" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D5" gate="G$1" pin="C" />
<wire x1="200.66" y1="-22.86" x2="203.2" y2="-22.86" width="0.1524" layer="91" />
<label x="203.2" y="-22.86" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VS" />
<wire x1="81.28" y1="-99.06" x2="83.82" y2="-99.06" width="0.1524" layer="91" />
<label x="83.82" y="-99.06" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="1" />
<wire x1="63.5" y1="-154.94" x2="60.96" y2="-154.94" width="0.1524" layer="91" />
<label x="60.96" y="-154.94" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C14" gate="G$1" pin="+" />
<wire x1="63.5" y1="-165.1" x2="60.96" y2="-165.1" width="0.1524" layer="91" />
<label x="60.96" y="-165.1" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="VCC_MCU" class="2">
<segment>
<pinref part="D4" gate="G$1" pin="C" />
<wire x1="134.62" y1="-10.16" x2="137.16" y2="-10.16" width="0.1524" layer="91" />
<label x="137.16" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="1" />
<wire x1="129.54" y1="-60.96" x2="127" y2="-60.96" width="0.1524" layer="91" />
<label x="127" y="-60.96" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P4" gate="A" pin="3" />
<wire x1="393.7" y1="-50.8" x2="391.16" y2="-50.8" width="0.1524" layer="91" />
<label x="391.16" y="-50.8" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="P4" gate="A" pin="4" />
<wire x1="401.32" y1="-50.8" x2="403.86" y2="-50.8" width="0.1524" layer="91" />
<label x="403.86" y="-50.8" size="1.27" layer="95" />
</segment>
</net>
</nets>
</sheet>
<sheet>
<description>CAN IO SHIELD FOR WEACT STM32F405 - SHEET 2: ANALOG, EGT, FREQUENCY AND DIGITAL INPUTS</description>
<plain>
<text x="0" y="10.16" size="3.81" layer="97">CAN IO SHIELD FOR WEACT STM32F405 - SHEET 2: ANALOG, EGT, FREQUENCY AND DIGITAL INPUTS</text>
<text x="-12.7" y="2.54" size="2.54" layer="97">ANALOG AN1</text>
<text x="43.18" y="2.54" size="2.54" layer="97">ANALOG AN2</text>
<text x="99.06" y="2.54" size="2.54" layer="97">ANALOG AN3</text>
<text x="154.94" y="2.54" size="2.54" layer="97">ANALOG AN4</text>
<text x="210.82" y="2.54" size="2.54" layer="97">ANALOG AN5</text>
<text x="266.7" y="2.54" size="2.54" layer="97">ANALOG AN6</text>
<text x="322.58" y="2.54" size="2.54" layer="97">ANALOG AN7</text>
<text x="378.46" y="2.54" size="2.54" layer="97">ANALOG AN8</text>
<text x="-12.7" y="-106.68" size="2.54" layer="97">ANALOG BUFFERS (TLV9004, supplied from +5V)</text>
<text x="-12.7" y="-208.28" size="2.54" layer="97">EGT1 (K thermocouple)</text>
<text x="53.34" y="-208.28" size="2.54" layer="97">EGT2 (K thermocouple)</text>
<text x="119.38" y="-208.28" size="2.54" layer="97">EGT3 (K thermocouple)</text>
<text x="185.42" y="-208.28" size="2.54" layer="97">EGT4 (K thermocouple)</text>
<text x="-12.7" y="-353.06" size="2.54" layer="97">FREQUENCY / DIGITAL SENSOR FREQ1</text>
<text x="48.26" y="-353.06" size="2.54" layer="97">FREQUENCY / DIGITAL SENSOR FREQ2</text>
<text x="109.22" y="-353.06" size="2.54" layer="97">FREQUENCY / DIGITAL SENSOR FREQ3</text>
<text x="170.18" y="-353.06" size="2.54" layer="97">FREQUENCY / DIGITAL SENSOR FREQ4</text>
<text x="231.14" y="-353.06" size="2.54" layer="97">FREQUENCY / DIGITAL SENSOR FREQ5</text>
<text x="-12.7" y="-431.8" size="2.54" layer="97">DIGITAL INPUT DI1</text>
<text x="48.26" y="-431.8" size="2.54" layer="97">DIGITAL INPUT DI2</text>
<text x="109.22" y="-431.8" size="2.54" layer="97">DIGITAL INPUT DI3</text>
<text x="170.18" y="-431.8" size="2.54" layer="97">DIGITAL INPUT DI4</text>
</plain>
<instances>
<instance part="SJ2" gate="1" x="0" y="-10.16" />
<instance part="R35" gate="G$1" x="0" y="-20.32" />
<instance part="R36" gate="G$1" x="0" y="-30.48" />
<instance part="R37" gate="G$1" x="0" y="-40.64" />
<instance part="D7" gate="G$1" x="0" y="-53.34" />
<instance part="C17" gate="G$1" x="0" y="-63.5" rot="R90" />
<instance part="R38" gate="G$1" x="0" y="-73.66" />
<instance part="C18" gate="G$1" x="0" y="-83.82" rot="R90" />
<instance part="SJ3" gate="1" x="55.88" y="-10.16" />
<instance part="R39" gate="G$1" x="55.88" y="-20.32" />
<instance part="R40" gate="G$1" x="55.88" y="-30.48" />
<instance part="R41" gate="G$1" x="55.88" y="-40.64" />
<instance part="D8" gate="G$1" x="55.88" y="-53.34" />
<instance part="C19" gate="G$1" x="55.88" y="-63.5" rot="R90" />
<instance part="R42" gate="G$1" x="55.88" y="-73.66" />
<instance part="C20" gate="G$1" x="55.88" y="-83.82" rot="R90" />
<instance part="SJ4" gate="1" x="111.76" y="-10.16" />
<instance part="R43" gate="G$1" x="111.76" y="-20.32" />
<instance part="R44" gate="G$1" x="111.76" y="-30.48" />
<instance part="R45" gate="G$1" x="111.76" y="-40.64" />
<instance part="D9" gate="G$1" x="111.76" y="-53.34" />
<instance part="C21" gate="G$1" x="111.76" y="-63.5" rot="R90" />
<instance part="R46" gate="G$1" x="111.76" y="-73.66" />
<instance part="C22" gate="G$1" x="111.76" y="-83.82" rot="R90" />
<instance part="SJ5" gate="1" x="167.64" y="-10.16" />
<instance part="R47" gate="G$1" x="167.64" y="-20.32" />
<instance part="R48" gate="G$1" x="167.64" y="-30.48" />
<instance part="R49" gate="G$1" x="167.64" y="-40.64" />
<instance part="D10" gate="G$1" x="167.64" y="-53.34" />
<instance part="C23" gate="G$1" x="167.64" y="-63.5" rot="R90" />
<instance part="R50" gate="G$1" x="167.64" y="-73.66" />
<instance part="C24" gate="G$1" x="167.64" y="-83.82" rot="R90" />
<instance part="SJ6" gate="1" x="223.52" y="-10.16" />
<instance part="R51" gate="G$1" x="223.52" y="-20.32" />
<instance part="R52" gate="G$1" x="223.52" y="-30.48" />
<instance part="R53" gate="G$1" x="223.52" y="-40.64" />
<instance part="D11" gate="G$1" x="223.52" y="-53.34" />
<instance part="C25" gate="G$1" x="223.52" y="-63.5" rot="R90" />
<instance part="R54" gate="G$1" x="223.52" y="-73.66" />
<instance part="C26" gate="G$1" x="223.52" y="-83.82" rot="R90" />
<instance part="SJ7" gate="1" x="279.4" y="-10.16" />
<instance part="R55" gate="G$1" x="279.4" y="-20.32" />
<instance part="R56" gate="G$1" x="279.4" y="-30.48" />
<instance part="R57" gate="G$1" x="279.4" y="-40.64" />
<instance part="D12" gate="G$1" x="279.4" y="-53.34" />
<instance part="C27" gate="G$1" x="279.4" y="-63.5" rot="R90" />
<instance part="R58" gate="G$1" x="279.4" y="-73.66" />
<instance part="C28" gate="G$1" x="279.4" y="-83.82" rot="R90" />
<instance part="SJ8" gate="1" x="335.28" y="-10.16" />
<instance part="R59" gate="G$1" x="335.28" y="-20.32" />
<instance part="R60" gate="G$1" x="335.28" y="-30.48" />
<instance part="R61" gate="G$1" x="335.28" y="-40.64" />
<instance part="D13" gate="G$1" x="335.28" y="-53.34" />
<instance part="C29" gate="G$1" x="335.28" y="-63.5" rot="R90" />
<instance part="R62" gate="G$1" x="335.28" y="-73.66" />
<instance part="C30" gate="G$1" x="335.28" y="-83.82" rot="R90" />
<instance part="SJ9" gate="1" x="391.16" y="-10.16" />
<instance part="R63" gate="G$1" x="391.16" y="-20.32" />
<instance part="R64" gate="G$1" x="391.16" y="-30.48" />
<instance part="R65" gate="G$1" x="391.16" y="-40.64" />
<instance part="D14" gate="G$1" x="391.16" y="-53.34" />
<instance part="C31" gate="G$1" x="391.16" y="-63.5" rot="R90" />
<instance part="R66" gate="G$1" x="391.16" y="-73.66" />
<instance part="C32" gate="G$1" x="391.16" y="-83.82" rot="R90" />
<instance part="U8" gate="G$1" x="0" y="-129.54" />
<instance part="C33" gate="G$1" x="0" y="-147.32" rot="R90" />
<instance part="U9" gate="G$1" x="0" y="-167.64" />
<instance part="C34" gate="G$1" x="0" y="-185.42" rot="R90" />
<instance part="R67" gate="G$1" x="0" y="-220.98" />
<instance part="R68" gate="G$1" x="0" y="-231.14" />
<instance part="C35" gate="G$1" x="0" y="-241.3" rot="R90" />
<instance part="C36" gate="G$1" x="0" y="-251.46" rot="R90" />
<instance part="R69" gate="G$1" x="0" y="-261.62" />
<instance part="SJ10" gate="1" x="0" y="-271.78" />
<instance part="U10" gate="G$1" x="0" y="-287.02" />
<instance part="C37" gate="G$1" x="0" y="-299.72" rot="R90" />
<instance part="R70" gate="G$1" x="0" y="-309.88" />
<instance part="R71" gate="G$1" x="0" y="-320.04" />
<instance part="C38" gate="G$1" x="0" y="-330.2" rot="R90" />
<instance part="R72" gate="G$1" x="66.04" y="-220.98" />
<instance part="R73" gate="G$1" x="66.04" y="-231.14" />
<instance part="C39" gate="G$1" x="66.04" y="-241.3" rot="R90" />
<instance part="C40" gate="G$1" x="66.04" y="-251.46" rot="R90" />
<instance part="R74" gate="G$1" x="66.04" y="-261.62" />
<instance part="SJ11" gate="1" x="66.04" y="-271.78" />
<instance part="U11" gate="G$1" x="66.04" y="-287.02" />
<instance part="C41" gate="G$1" x="66.04" y="-299.72" rot="R90" />
<instance part="R75" gate="G$1" x="66.04" y="-309.88" />
<instance part="R76" gate="G$1" x="66.04" y="-320.04" />
<instance part="C42" gate="G$1" x="66.04" y="-330.2" rot="R90" />
<instance part="R77" gate="G$1" x="132.08" y="-220.98" />
<instance part="R78" gate="G$1" x="132.08" y="-231.14" />
<instance part="C43" gate="G$1" x="132.08" y="-241.3" rot="R90" />
<instance part="C44" gate="G$1" x="132.08" y="-251.46" rot="R90" />
<instance part="R79" gate="G$1" x="132.08" y="-261.62" />
<instance part="SJ12" gate="1" x="132.08" y="-271.78" />
<instance part="U12" gate="G$1" x="132.08" y="-287.02" />
<instance part="C45" gate="G$1" x="132.08" y="-299.72" rot="R90" />
<instance part="R80" gate="G$1" x="132.08" y="-309.88" />
<instance part="R81" gate="G$1" x="132.08" y="-320.04" />
<instance part="C46" gate="G$1" x="132.08" y="-330.2" rot="R90" />
<instance part="R82" gate="G$1" x="198.12" y="-220.98" />
<instance part="R83" gate="G$1" x="198.12" y="-231.14" />
<instance part="C47" gate="G$1" x="198.12" y="-241.3" rot="R90" />
<instance part="C48" gate="G$1" x="198.12" y="-251.46" rot="R90" />
<instance part="R84" gate="G$1" x="198.12" y="-261.62" />
<instance part="SJ13" gate="1" x="198.12" y="-271.78" />
<instance part="U13" gate="G$1" x="198.12" y="-287.02" />
<instance part="C49" gate="G$1" x="198.12" y="-299.72" rot="R90" />
<instance part="R85" gate="G$1" x="198.12" y="-309.88" />
<instance part="R86" gate="G$1" x="198.12" y="-320.04" />
<instance part="C50" gate="G$1" x="198.12" y="-330.2" rot="R90" />
<instance part="SJ14" gate="1" x="0" y="-365.76" />
<instance part="R87" gate="G$1" x="0" y="-375.92" />
<instance part="R88" gate="G$1" x="0" y="-386.08" />
<instance part="D15" gate="G$1" x="0" y="-398.78" />
<instance part="C51" gate="G$1" x="0" y="-408.94" rot="R90" />
<instance part="SJ15" gate="1" x="60.96" y="-365.76" />
<instance part="R89" gate="G$1" x="60.96" y="-375.92" />
<instance part="R90" gate="G$1" x="60.96" y="-386.08" />
<instance part="D16" gate="G$1" x="60.96" y="-398.78" />
<instance part="C52" gate="G$1" x="60.96" y="-408.94" rot="R90" />
<instance part="SJ16" gate="1" x="121.92" y="-365.76" />
<instance part="R91" gate="G$1" x="121.92" y="-375.92" />
<instance part="R92" gate="G$1" x="121.92" y="-386.08" />
<instance part="D17" gate="G$1" x="121.92" y="-398.78" />
<instance part="C53" gate="G$1" x="121.92" y="-408.94" rot="R90" />
<instance part="SJ17" gate="1" x="182.88" y="-365.76" />
<instance part="R93" gate="G$1" x="182.88" y="-375.92" />
<instance part="R94" gate="G$1" x="182.88" y="-386.08" />
<instance part="D18" gate="G$1" x="182.88" y="-398.78" />
<instance part="C54" gate="G$1" x="182.88" y="-408.94" rot="R90" />
<instance part="SJ18" gate="1" x="243.84" y="-365.76" />
<instance part="R95" gate="G$1" x="243.84" y="-375.92" />
<instance part="R96" gate="G$1" x="243.84" y="-386.08" />
<instance part="D19" gate="G$1" x="243.84" y="-398.78" />
<instance part="C55" gate="G$1" x="243.84" y="-408.94" rot="R90" />
<instance part="SJ19" gate="1" x="0" y="-444.5" />
<instance part="R97" gate="G$1" x="0" y="-454.66" />
<instance part="R98" gate="G$1" x="0" y="-464.82" />
<instance part="D20" gate="G$1" x="0" y="-477.52" />
<instance part="C56" gate="G$1" x="0" y="-487.68" rot="R90" />
<instance part="SJ20" gate="1" x="60.96" y="-444.5" />
<instance part="R99" gate="G$1" x="60.96" y="-454.66" />
<instance part="R100" gate="G$1" x="60.96" y="-464.82" />
<instance part="D21" gate="G$1" x="60.96" y="-477.52" />
<instance part="C57" gate="G$1" x="60.96" y="-487.68" rot="R90" />
<instance part="SJ21" gate="1" x="121.92" y="-444.5" />
<instance part="R101" gate="G$1" x="121.92" y="-454.66" />
<instance part="R102" gate="G$1" x="121.92" y="-464.82" />
<instance part="D22" gate="G$1" x="121.92" y="-477.52" />
<instance part="C58" gate="G$1" x="121.92" y="-487.68" rot="R90" />
<instance part="SJ22" gate="1" x="182.88" y="-444.5" />
<instance part="R103" gate="G$1" x="182.88" y="-454.66" />
<instance part="R104" gate="G$1" x="182.88" y="-464.82" />
<instance part="D23" gate="G$1" x="182.88" y="-477.52" />
<instance part="C59" gate="G$1" x="182.88" y="-487.68" rot="R90" />
</instances>
<busses />
<nets>
<net name="+3V3" class="2">
<segment>
<pinref part="D7" gate="G$1" pin="C2" />
<wire x1="5.08" y1="-53.34" x2="7.62" y2="-53.34" width="0.1524" layer="91" />
<label x="7.62" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D8" gate="G$1" pin="C2" />
<wire x1="60.96" y1="-53.34" x2="63.5" y2="-53.34" width="0.1524" layer="91" />
<label x="63.5" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D9" gate="G$1" pin="C2" />
<wire x1="116.84" y1="-53.34" x2="119.38" y2="-53.34" width="0.1524" layer="91" />
<label x="119.38" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D10" gate="G$1" pin="C2" />
<wire x1="172.72" y1="-53.34" x2="175.26" y2="-53.34" width="0.1524" layer="91" />
<label x="175.26" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D11" gate="G$1" pin="C2" />
<wire x1="228.6" y1="-53.34" x2="231.14" y2="-53.34" width="0.1524" layer="91" />
<label x="231.14" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D12" gate="G$1" pin="C2" />
<wire x1="284.48" y1="-53.34" x2="287.02" y2="-53.34" width="0.1524" layer="91" />
<label x="287.02" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D13" gate="G$1" pin="C2" />
<wire x1="340.36" y1="-53.34" x2="342.9" y2="-53.34" width="0.1524" layer="91" />
<label x="342.9" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D14" gate="G$1" pin="C2" />
<wire x1="396.24" y1="-53.34" x2="398.78" y2="-53.34" width="0.1524" layer="91" />
<label x="398.78" y="-53.34" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D15" gate="G$1" pin="C2" />
<wire x1="5.08" y1="-398.78" x2="7.62" y2="-398.78" width="0.1524" layer="91" />
<label x="7.62" y="-398.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D16" gate="G$1" pin="C2" />
<wire x1="66.04" y1="-398.78" x2="68.58" y2="-398.78" width="0.1524" layer="91" />
<label x="68.58" y="-398.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D17" gate="G$1" pin="C2" />
<wire x1="127" y1="-398.78" x2="129.54" y2="-398.78" width="0.1524" layer="91" />
<label x="129.54" y="-398.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D18" gate="G$1" pin="C2" />
<wire x1="187.96" y1="-398.78" x2="190.5" y2="-398.78" width="0.1524" layer="91" />
<label x="190.5" y="-398.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D19" gate="G$1" pin="C2" />
<wire x1="248.92" y1="-398.78" x2="251.46" y2="-398.78" width="0.1524" layer="91" />
<label x="251.46" y="-398.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D20" gate="G$1" pin="C2" />
<wire x1="5.08" y1="-477.52" x2="7.62" y2="-477.52" width="0.1524" layer="91" />
<label x="7.62" y="-477.52" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D21" gate="G$1" pin="C2" />
<wire x1="66.04" y1="-477.52" x2="68.58" y2="-477.52" width="0.1524" layer="91" />
<label x="68.58" y="-477.52" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D22" gate="G$1" pin="C2" />
<wire x1="127" y1="-477.52" x2="129.54" y2="-477.52" width="0.1524" layer="91" />
<label x="129.54" y="-477.52" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D23" gate="G$1" pin="C2" />
<wire x1="187.96" y1="-477.52" x2="190.5" y2="-477.52" width="0.1524" layer="91" />
<label x="190.5" y="-477.52" size="1.27" layer="95" />
</segment>
</net>
<net name="+5V" class="2">
<segment>
<pinref part="U8" gate="G$1" pin="V+" />
<wire x1="15.24" y1="-119.38" x2="17.78" y2="-119.38" width="0.1524" layer="91" />
<label x="17.78" y="-119.38" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C33" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-147.32" x2="-5.08" y2="-147.32" width="0.1524" layer="91" />
<label x="-5.08" y="-147.32" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="V+" />
<wire x1="15.24" y1="-157.48" x2="17.78" y2="-157.48" width="0.1524" layer="91" />
<label x="17.78" y="-157.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C34" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-185.42" x2="-5.08" y2="-185.42" width="0.1524" layer="91" />
<label x="-5.08" y="-185.42" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="+VS" />
<wire x1="15.24" y1="-281.94" x2="17.78" y2="-281.94" width="0.1524" layer="91" />
<label x="17.78" y="-281.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-299.72" x2="-5.08" y2="-299.72" width="0.1524" layer="91" />
<label x="-5.08" y="-299.72" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="+VS" />
<wire x1="81.28" y1="-281.94" x2="83.82" y2="-281.94" width="0.1524" layer="91" />
<label x="83.82" y="-281.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C41" gate="G$1" pin="1" />
<wire x1="63.5" y1="-299.72" x2="60.96" y2="-299.72" width="0.1524" layer="91" />
<label x="60.96" y="-299.72" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="+VS" />
<wire x1="147.32" y1="-281.94" x2="149.86" y2="-281.94" width="0.1524" layer="91" />
<label x="149.86" y="-281.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C45" gate="G$1" pin="1" />
<wire x1="129.54" y1="-299.72" x2="127" y2="-299.72" width="0.1524" layer="91" />
<label x="127" y="-299.72" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="+VS" />
<wire x1="213.36" y1="-281.94" x2="215.9" y2="-281.94" width="0.1524" layer="91" />
<label x="215.9" y="-281.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C49" gate="G$1" pin="1" />
<wire x1="195.58" y1="-299.72" x2="193.04" y2="-299.72" width="0.1524" layer="91" />
<label x="193.04" y="-299.72" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ19" gate="1" pin="1" />
<wire x1="-5.08" y1="-444.5" x2="-7.62" y2="-444.5" width="0.1524" layer="91" />
<label x="-7.62" y="-444.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ20" gate="1" pin="1" />
<wire x1="55.88" y1="-444.5" x2="53.34" y2="-444.5" width="0.1524" layer="91" />
<label x="53.34" y="-444.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ21" gate="1" pin="1" />
<wire x1="116.84" y1="-444.5" x2="114.3" y2="-444.5" width="0.1524" layer="91" />
<label x="114.3" y="-444.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ22" gate="1" pin="1" />
<wire x1="177.8" y1="-444.5" x2="175.26" y2="-444.5" width="0.1524" layer="91" />
<label x="175.26" y="-444.5" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="5V_SENS" class="2">
<segment>
<pinref part="SJ2" gate="1" pin="1" />
<wire x1="-5.08" y1="-10.16" x2="-7.62" y2="-10.16" width="0.1524" layer="91" />
<label x="-7.62" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ3" gate="1" pin="1" />
<wire x1="50.8" y1="-10.16" x2="48.26" y2="-10.16" width="0.1524" layer="91" />
<label x="48.26" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ4" gate="1" pin="1" />
<wire x1="106.68" y1="-10.16" x2="104.14" y2="-10.16" width="0.1524" layer="91" />
<label x="104.14" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ5" gate="1" pin="1" />
<wire x1="162.56" y1="-10.16" x2="160.02" y2="-10.16" width="0.1524" layer="91" />
<label x="160.02" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ6" gate="1" pin="1" />
<wire x1="218.44" y1="-10.16" x2="215.9" y2="-10.16" width="0.1524" layer="91" />
<label x="215.9" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ7" gate="1" pin="1" />
<wire x1="274.32" y1="-10.16" x2="271.78" y2="-10.16" width="0.1524" layer="91" />
<label x="271.78" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ8" gate="1" pin="1" />
<wire x1="330.2" y1="-10.16" x2="327.66" y2="-10.16" width="0.1524" layer="91" />
<label x="327.66" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ9" gate="1" pin="1" />
<wire x1="386.08" y1="-10.16" x2="383.54" y2="-10.16" width="0.1524" layer="91" />
<label x="383.54" y="-10.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ14" gate="1" pin="1" />
<wire x1="-5.08" y1="-365.76" x2="-7.62" y2="-365.76" width="0.1524" layer="91" />
<label x="-7.62" y="-365.76" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ15" gate="1" pin="1" />
<wire x1="55.88" y1="-365.76" x2="53.34" y2="-365.76" width="0.1524" layer="91" />
<label x="53.34" y="-365.76" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ16" gate="1" pin="1" />
<wire x1="116.84" y1="-365.76" x2="114.3" y2="-365.76" width="0.1524" layer="91" />
<label x="114.3" y="-365.76" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ17" gate="1" pin="1" />
<wire x1="177.8" y1="-365.76" x2="175.26" y2="-365.76" width="0.1524" layer="91" />
<label x="175.26" y="-365.76" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="SJ18" gate="1" pin="1" />
<wire x1="238.76" y1="-365.76" x2="236.22" y2="-365.76" width="0.1524" layer="91" />
<label x="236.22" y="-365.76" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_BUF" class="0">
<segment>
<pinref part="R38" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-73.66" x2="-7.62" y2="-73.66" width="0.1524" layer="91" />
<label x="-7.62" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="-INA" />
<wire x1="-15.24" y1="-121.92" x2="-17.78" y2="-121.92" width="0.1524" layer="91" />
<label x="-17.78" y="-121.92" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="OUTA" />
<wire x1="15.24" y1="-121.92" x2="17.78" y2="-121.92" width="0.1524" layer="91" />
<label x="17.78" y="-121.92" size="1.27" layer="95" />
</segment>
</net>
<net name="AN1_DIV" class="0">
<segment>
<pinref part="R36" gate="G$1" pin="2" />
<wire x1="5.08" y1="-30.48" x2="7.62" y2="-30.48" width="0.1524" layer="91" />
<label x="7.62" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R37" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-40.64" x2="-7.62" y2="-40.64" width="0.1524" layer="91" />
<label x="-7.62" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D7" gate="G$1" pin="C1A2" />
<wire x1="0" y1="-50.8" x2="0" y2="-48.26" width="0.1524" layer="91" />
<label x="0" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-63.5" x2="-5.08" y2="-63.5" width="0.1524" layer="91" />
<label x="-5.08" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="+INA" />
<wire x1="-15.24" y1="-119.38" x2="-17.78" y2="-119.38" width="0.1524" layer="91" />
<label x="-17.78" y="-119.38" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_IN" class="0">
<segment>
<pinref part="R35" gate="G$1" pin="2" />
<wire x1="5.08" y1="-20.32" x2="7.62" y2="-20.32" width="0.1524" layer="91" />
<label x="7.62" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R36" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-30.48" x2="-7.62" y2="-30.48" width="0.1524" layer="91" />
<label x="-7.62" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_PA6" class="0">
<segment>
<pinref part="R38" gate="G$1" pin="2" />
<wire x1="5.08" y1="-73.66" x2="7.62" y2="-73.66" width="0.1524" layer="91" />
<label x="7.62" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-83.82" x2="-5.08" y2="-83.82" width="0.1524" layer="91" />
<label x="-5.08" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN1_PU" class="0">
<segment>
<pinref part="SJ2" gate="1" pin="2" />
<wire x1="5.08" y1="-10.16" x2="7.62" y2="-10.16" width="0.1524" layer="91" />
<label x="7.62" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R35" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-20.32" x2="-7.62" y2="-20.32" width="0.1524" layer="91" />
<label x="-7.62" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_BUF" class="0">
<segment>
<pinref part="R42" gate="G$1" pin="1" />
<wire x1="50.8" y1="-73.66" x2="48.26" y2="-73.66" width="0.1524" layer="91" />
<label x="48.26" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="-INB" />
<wire x1="-15.24" y1="-127" x2="-17.78" y2="-127" width="0.1524" layer="91" />
<label x="-17.78" y="-127" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="OUTB" />
<wire x1="15.24" y1="-124.46" x2="17.78" y2="-124.46" width="0.1524" layer="91" />
<label x="17.78" y="-124.46" size="1.27" layer="95" />
</segment>
</net>
<net name="AN2_DIV" class="0">
<segment>
<pinref part="R40" gate="G$1" pin="2" />
<wire x1="60.96" y1="-30.48" x2="63.5" y2="-30.48" width="0.1524" layer="91" />
<label x="63.5" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R41" gate="G$1" pin="1" />
<wire x1="50.8" y1="-40.64" x2="48.26" y2="-40.64" width="0.1524" layer="91" />
<label x="48.26" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D8" gate="G$1" pin="C1A2" />
<wire x1="55.88" y1="-50.8" x2="55.88" y2="-48.26" width="0.1524" layer="91" />
<label x="55.88" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="1" />
<wire x1="53.34" y1="-63.5" x2="50.8" y2="-63.5" width="0.1524" layer="91" />
<label x="50.8" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="+INB" />
<wire x1="-15.24" y1="-124.46" x2="-17.78" y2="-124.46" width="0.1524" layer="91" />
<label x="-17.78" y="-124.46" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_IN" class="0">
<segment>
<pinref part="R39" gate="G$1" pin="2" />
<wire x1="60.96" y1="-20.32" x2="63.5" y2="-20.32" width="0.1524" layer="91" />
<label x="63.5" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R40" gate="G$1" pin="1" />
<wire x1="50.8" y1="-30.48" x2="48.26" y2="-30.48" width="0.1524" layer="91" />
<label x="48.26" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_PA7" class="0">
<segment>
<pinref part="R42" gate="G$1" pin="2" />
<wire x1="60.96" y1="-73.66" x2="63.5" y2="-73.66" width="0.1524" layer="91" />
<label x="63.5" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="1" />
<wire x1="53.34" y1="-83.82" x2="50.8" y2="-83.82" width="0.1524" layer="91" />
<label x="50.8" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN2_PU" class="0">
<segment>
<pinref part="SJ3" gate="1" pin="2" />
<wire x1="60.96" y1="-10.16" x2="63.5" y2="-10.16" width="0.1524" layer="91" />
<label x="63.5" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R39" gate="G$1" pin="1" />
<wire x1="50.8" y1="-20.32" x2="48.26" y2="-20.32" width="0.1524" layer="91" />
<label x="48.26" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN3_BUF" class="0">
<segment>
<pinref part="R46" gate="G$1" pin="1" />
<wire x1="106.68" y1="-73.66" x2="104.14" y2="-73.66" width="0.1524" layer="91" />
<label x="104.14" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="-INC" />
<wire x1="-15.24" y1="-132.08" x2="-17.78" y2="-132.08" width="0.1524" layer="91" />
<label x="-17.78" y="-132.08" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="OUTC" />
<wire x1="15.24" y1="-127" x2="17.78" y2="-127" width="0.1524" layer="91" />
<label x="17.78" y="-127" size="1.27" layer="95" />
</segment>
</net>
<net name="AN3_DIV" class="0">
<segment>
<pinref part="R44" gate="G$1" pin="2" />
<wire x1="116.84" y1="-30.48" x2="119.38" y2="-30.48" width="0.1524" layer="91" />
<label x="119.38" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R45" gate="G$1" pin="1" />
<wire x1="106.68" y1="-40.64" x2="104.14" y2="-40.64" width="0.1524" layer="91" />
<label x="104.14" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D9" gate="G$1" pin="C1A2" />
<wire x1="111.76" y1="-50.8" x2="111.76" y2="-48.26" width="0.1524" layer="91" />
<label x="111.76" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="1" />
<wire x1="109.22" y1="-63.5" x2="106.68" y2="-63.5" width="0.1524" layer="91" />
<label x="106.68" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="+INC" />
<wire x1="-15.24" y1="-129.54" x2="-17.78" y2="-129.54" width="0.1524" layer="91" />
<label x="-17.78" y="-129.54" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN3_IN" class="0">
<segment>
<pinref part="R43" gate="G$1" pin="2" />
<wire x1="116.84" y1="-20.32" x2="119.38" y2="-20.32" width="0.1524" layer="91" />
<label x="119.38" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R44" gate="G$1" pin="1" />
<wire x1="106.68" y1="-30.48" x2="104.14" y2="-30.48" width="0.1524" layer="91" />
<label x="104.14" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN3_PC0" class="0">
<segment>
<pinref part="R46" gate="G$1" pin="2" />
<wire x1="116.84" y1="-73.66" x2="119.38" y2="-73.66" width="0.1524" layer="91" />
<label x="119.38" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="1" />
<wire x1="109.22" y1="-83.82" x2="106.68" y2="-83.82" width="0.1524" layer="91" />
<label x="106.68" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN3_PU" class="0">
<segment>
<pinref part="SJ4" gate="1" pin="2" />
<wire x1="116.84" y1="-10.16" x2="119.38" y2="-10.16" width="0.1524" layer="91" />
<label x="119.38" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R43" gate="G$1" pin="1" />
<wire x1="106.68" y1="-20.32" x2="104.14" y2="-20.32" width="0.1524" layer="91" />
<label x="104.14" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_BUF" class="0">
<segment>
<pinref part="R50" gate="G$1" pin="1" />
<wire x1="162.56" y1="-73.66" x2="160.02" y2="-73.66" width="0.1524" layer="91" />
<label x="160.02" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="-IND" />
<wire x1="-15.24" y1="-137.16" x2="-17.78" y2="-137.16" width="0.1524" layer="91" />
<label x="-17.78" y="-137.16" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="OUTD" />
<wire x1="15.24" y1="-129.54" x2="17.78" y2="-129.54" width="0.1524" layer="91" />
<label x="17.78" y="-129.54" size="1.27" layer="95" />
</segment>
</net>
<net name="AN4_DIV" class="0">
<segment>
<pinref part="R48" gate="G$1" pin="2" />
<wire x1="172.72" y1="-30.48" x2="175.26" y2="-30.48" width="0.1524" layer="91" />
<label x="175.26" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R49" gate="G$1" pin="1" />
<wire x1="162.56" y1="-40.64" x2="160.02" y2="-40.64" width="0.1524" layer="91" />
<label x="160.02" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D10" gate="G$1" pin="C1A2" />
<wire x1="167.64" y1="-50.8" x2="167.64" y2="-48.26" width="0.1524" layer="91" />
<label x="167.64" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C23" gate="G$1" pin="1" />
<wire x1="165.1" y1="-63.5" x2="162.56" y2="-63.5" width="0.1524" layer="91" />
<label x="162.56" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="+IND" />
<wire x1="-15.24" y1="-134.62" x2="-17.78" y2="-134.62" width="0.1524" layer="91" />
<label x="-17.78" y="-134.62" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_IN" class="0">
<segment>
<pinref part="R47" gate="G$1" pin="2" />
<wire x1="172.72" y1="-20.32" x2="175.26" y2="-20.32" width="0.1524" layer="91" />
<label x="175.26" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R48" gate="G$1" pin="1" />
<wire x1="162.56" y1="-30.48" x2="160.02" y2="-30.48" width="0.1524" layer="91" />
<label x="160.02" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_PC1" class="0">
<segment>
<pinref part="R50" gate="G$1" pin="2" />
<wire x1="172.72" y1="-73.66" x2="175.26" y2="-73.66" width="0.1524" layer="91" />
<label x="175.26" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="1" />
<wire x1="165.1" y1="-83.82" x2="162.56" y2="-83.82" width="0.1524" layer="91" />
<label x="162.56" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN4_PU" class="0">
<segment>
<pinref part="SJ5" gate="1" pin="2" />
<wire x1="172.72" y1="-10.16" x2="175.26" y2="-10.16" width="0.1524" layer="91" />
<label x="175.26" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R47" gate="G$1" pin="1" />
<wire x1="162.56" y1="-20.32" x2="160.02" y2="-20.32" width="0.1524" layer="91" />
<label x="160.02" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN5_BUF" class="0">
<segment>
<pinref part="R54" gate="G$1" pin="1" />
<wire x1="218.44" y1="-73.66" x2="215.9" y2="-73.66" width="0.1524" layer="91" />
<label x="215.9" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="-INA" />
<wire x1="-15.24" y1="-160.02" x2="-17.78" y2="-160.02" width="0.1524" layer="91" />
<label x="-17.78" y="-160.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="OUTA" />
<wire x1="15.24" y1="-160.02" x2="17.78" y2="-160.02" width="0.1524" layer="91" />
<label x="17.78" y="-160.02" size="1.27" layer="95" />
</segment>
</net>
<net name="AN5_DIV" class="0">
<segment>
<pinref part="R52" gate="G$1" pin="2" />
<wire x1="228.6" y1="-30.48" x2="231.14" y2="-30.48" width="0.1524" layer="91" />
<label x="231.14" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R53" gate="G$1" pin="1" />
<wire x1="218.44" y1="-40.64" x2="215.9" y2="-40.64" width="0.1524" layer="91" />
<label x="215.9" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D11" gate="G$1" pin="C1A2" />
<wire x1="223.52" y1="-50.8" x2="223.52" y2="-48.26" width="0.1524" layer="91" />
<label x="223.52" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="1" />
<wire x1="220.98" y1="-63.5" x2="218.44" y2="-63.5" width="0.1524" layer="91" />
<label x="218.44" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="+INA" />
<wire x1="-15.24" y1="-157.48" x2="-17.78" y2="-157.48" width="0.1524" layer="91" />
<label x="-17.78" y="-157.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN5_IN" class="0">
<segment>
<pinref part="R51" gate="G$1" pin="2" />
<wire x1="228.6" y1="-20.32" x2="231.14" y2="-20.32" width="0.1524" layer="91" />
<label x="231.14" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R52" gate="G$1" pin="1" />
<wire x1="218.44" y1="-30.48" x2="215.9" y2="-30.48" width="0.1524" layer="91" />
<label x="215.9" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN5_PC2" class="0">
<segment>
<pinref part="R54" gate="G$1" pin="2" />
<wire x1="228.6" y1="-73.66" x2="231.14" y2="-73.66" width="0.1524" layer="91" />
<label x="231.14" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="1" />
<wire x1="220.98" y1="-83.82" x2="218.44" y2="-83.82" width="0.1524" layer="91" />
<label x="218.44" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN5_PU" class="0">
<segment>
<pinref part="SJ6" gate="1" pin="2" />
<wire x1="228.6" y1="-10.16" x2="231.14" y2="-10.16" width="0.1524" layer="91" />
<label x="231.14" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R51" gate="G$1" pin="1" />
<wire x1="218.44" y1="-20.32" x2="215.9" y2="-20.32" width="0.1524" layer="91" />
<label x="215.9" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_BUF" class="0">
<segment>
<pinref part="R58" gate="G$1" pin="1" />
<wire x1="274.32" y1="-73.66" x2="271.78" y2="-73.66" width="0.1524" layer="91" />
<label x="271.78" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="-INB" />
<wire x1="-15.24" y1="-165.1" x2="-17.78" y2="-165.1" width="0.1524" layer="91" />
<label x="-17.78" y="-165.1" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="OUTB" />
<wire x1="15.24" y1="-162.56" x2="17.78" y2="-162.56" width="0.1524" layer="91" />
<label x="17.78" y="-162.56" size="1.27" layer="95" />
</segment>
</net>
<net name="AN6_DIV" class="0">
<segment>
<pinref part="R56" gate="G$1" pin="2" />
<wire x1="284.48" y1="-30.48" x2="287.02" y2="-30.48" width="0.1524" layer="91" />
<label x="287.02" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R57" gate="G$1" pin="1" />
<wire x1="274.32" y1="-40.64" x2="271.78" y2="-40.64" width="0.1524" layer="91" />
<label x="271.78" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D12" gate="G$1" pin="C1A2" />
<wire x1="279.4" y1="-50.8" x2="279.4" y2="-48.26" width="0.1524" layer="91" />
<label x="279.4" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C27" gate="G$1" pin="1" />
<wire x1="276.86" y1="-63.5" x2="274.32" y2="-63.5" width="0.1524" layer="91" />
<label x="274.32" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="+INB" />
<wire x1="-15.24" y1="-162.56" x2="-17.78" y2="-162.56" width="0.1524" layer="91" />
<label x="-17.78" y="-162.56" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_IN" class="0">
<segment>
<pinref part="R55" gate="G$1" pin="2" />
<wire x1="284.48" y1="-20.32" x2="287.02" y2="-20.32" width="0.1524" layer="91" />
<label x="287.02" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R56" gate="G$1" pin="1" />
<wire x1="274.32" y1="-30.48" x2="271.78" y2="-30.48" width="0.1524" layer="91" />
<label x="271.78" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_PC3" class="0">
<segment>
<pinref part="R58" gate="G$1" pin="2" />
<wire x1="284.48" y1="-73.66" x2="287.02" y2="-73.66" width="0.1524" layer="91" />
<label x="287.02" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C28" gate="G$1" pin="1" />
<wire x1="276.86" y1="-83.82" x2="274.32" y2="-83.82" width="0.1524" layer="91" />
<label x="274.32" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN6_PU" class="0">
<segment>
<pinref part="SJ7" gate="1" pin="2" />
<wire x1="284.48" y1="-10.16" x2="287.02" y2="-10.16" width="0.1524" layer="91" />
<label x="287.02" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R55" gate="G$1" pin="1" />
<wire x1="274.32" y1="-20.32" x2="271.78" y2="-20.32" width="0.1524" layer="91" />
<label x="271.78" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN7_BUF" class="0">
<segment>
<pinref part="R62" gate="G$1" pin="1" />
<wire x1="330.2" y1="-73.66" x2="327.66" y2="-73.66" width="0.1524" layer="91" />
<label x="327.66" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="-INC" />
<wire x1="-15.24" y1="-170.18" x2="-17.78" y2="-170.18" width="0.1524" layer="91" />
<label x="-17.78" y="-170.18" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="OUTC" />
<wire x1="15.24" y1="-165.1" x2="17.78" y2="-165.1" width="0.1524" layer="91" />
<label x="17.78" y="-165.1" size="1.27" layer="95" />
</segment>
</net>
<net name="AN7_DIV" class="0">
<segment>
<pinref part="R60" gate="G$1" pin="2" />
<wire x1="340.36" y1="-30.48" x2="342.9" y2="-30.48" width="0.1524" layer="91" />
<label x="342.9" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R61" gate="G$1" pin="1" />
<wire x1="330.2" y1="-40.64" x2="327.66" y2="-40.64" width="0.1524" layer="91" />
<label x="327.66" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D13" gate="G$1" pin="C1A2" />
<wire x1="335.28" y1="-50.8" x2="335.28" y2="-48.26" width="0.1524" layer="91" />
<label x="335.28" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C29" gate="G$1" pin="1" />
<wire x1="332.74" y1="-63.5" x2="330.2" y2="-63.5" width="0.1524" layer="91" />
<label x="330.2" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="+INC" />
<wire x1="-15.24" y1="-167.64" x2="-17.78" y2="-167.64" width="0.1524" layer="91" />
<label x="-17.78" y="-167.64" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN7_IN" class="0">
<segment>
<pinref part="R59" gate="G$1" pin="2" />
<wire x1="340.36" y1="-20.32" x2="342.9" y2="-20.32" width="0.1524" layer="91" />
<label x="342.9" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R60" gate="G$1" pin="1" />
<wire x1="330.2" y1="-30.48" x2="327.66" y2="-30.48" width="0.1524" layer="91" />
<label x="327.66" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN7_PC4" class="0">
<segment>
<pinref part="R62" gate="G$1" pin="2" />
<wire x1="340.36" y1="-73.66" x2="342.9" y2="-73.66" width="0.1524" layer="91" />
<label x="342.9" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C30" gate="G$1" pin="1" />
<wire x1="332.74" y1="-83.82" x2="330.2" y2="-83.82" width="0.1524" layer="91" />
<label x="330.2" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN7_PU" class="0">
<segment>
<pinref part="SJ8" gate="1" pin="2" />
<wire x1="340.36" y1="-10.16" x2="342.9" y2="-10.16" width="0.1524" layer="91" />
<label x="342.9" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R59" gate="G$1" pin="1" />
<wire x1="330.2" y1="-20.32" x2="327.66" y2="-20.32" width="0.1524" layer="91" />
<label x="327.66" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_BUF" class="0">
<segment>
<pinref part="R66" gate="G$1" pin="1" />
<wire x1="386.08" y1="-73.66" x2="383.54" y2="-73.66" width="0.1524" layer="91" />
<label x="383.54" y="-73.66" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="-IND" />
<wire x1="-15.24" y1="-175.26" x2="-17.78" y2="-175.26" width="0.1524" layer="91" />
<label x="-17.78" y="-175.26" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="OUTD" />
<wire x1="15.24" y1="-167.64" x2="17.78" y2="-167.64" width="0.1524" layer="91" />
<label x="17.78" y="-167.64" size="1.27" layer="95" />
</segment>
</net>
<net name="AN8_DIV" class="0">
<segment>
<pinref part="R64" gate="G$1" pin="2" />
<wire x1="396.24" y1="-30.48" x2="398.78" y2="-30.48" width="0.1524" layer="91" />
<label x="398.78" y="-30.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R65" gate="G$1" pin="1" />
<wire x1="386.08" y1="-40.64" x2="383.54" y2="-40.64" width="0.1524" layer="91" />
<label x="383.54" y="-40.64" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="D14" gate="G$1" pin="C1A2" />
<wire x1="391.16" y1="-50.8" x2="391.16" y2="-48.26" width="0.1524" layer="91" />
<label x="391.16" y="-48.26" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C31" gate="G$1" pin="1" />
<wire x1="388.62" y1="-63.5" x2="386.08" y2="-63.5" width="0.1524" layer="91" />
<label x="386.08" y="-63.5" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="+IND" />
<wire x1="-15.24" y1="-172.72" x2="-17.78" y2="-172.72" width="0.1524" layer="91" />
<label x="-17.78" y="-172.72" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_IN" class="0">
<segment>
<pinref part="R63" gate="G$1" pin="2" />
<wire x1="396.24" y1="-20.32" x2="398.78" y2="-20.32" width="0.1524" layer="91" />
<label x="398.78" y="-20.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R64" gate="G$1" pin="1" />
<wire x1="386.08" y1="-30.48" x2="383.54" y2="-30.48" width="0.1524" layer="91" />
<label x="383.54" y="-30.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_PC5" class="0">
<segment>
<pinref part="R66" gate="G$1" pin="2" />
<wire x1="396.24" y1="-73.66" x2="398.78" y2="-73.66" width="0.1524" layer="91" />
<label x="398.78" y="-73.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C32" gate="G$1" pin="1" />
<wire x1="388.62" y1="-83.82" x2="386.08" y2="-83.82" width="0.1524" layer="91" />
<label x="386.08" y="-83.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="AN8_PU" class="0">
<segment>
<pinref part="SJ9" gate="1" pin="2" />
<wire x1="396.24" y1="-10.16" x2="398.78" y2="-10.16" width="0.1524" layer="91" />
<label x="398.78" y="-10.16" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R63" gate="G$1" pin="1" />
<wire x1="386.08" y1="-20.32" x2="383.54" y2="-20.32" width="0.1524" layer="91" />
<label x="383.54" y="-20.32" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI1_IN" class="0">
<segment>
<pinref part="R97" gate="G$1" pin="2" />
<wire x1="5.08" y1="-454.66" x2="7.62" y2="-454.66" width="0.1524" layer="91" />
<label x="7.62" y="-454.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R98" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-464.82" x2="-7.62" y2="-464.82" width="0.1524" layer="91" />
<label x="-7.62" y="-464.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI1_PC13" class="0">
<segment>
<pinref part="R98" gate="G$1" pin="2" />
<wire x1="5.08" y1="-464.82" x2="7.62" y2="-464.82" width="0.1524" layer="91" />
<label x="7.62" y="-464.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D20" gate="G$1" pin="C1A2" />
<wire x1="0" y1="-474.98" x2="0" y2="-472.44" width="0.1524" layer="91" />
<label x="0" y="-472.44" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C56" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-487.68" x2="-5.08" y2="-487.68" width="0.1524" layer="91" />
<label x="-5.08" y="-487.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI1_PU" class="0">
<segment>
<pinref part="SJ19" gate="1" pin="2" />
<wire x1="5.08" y1="-444.5" x2="7.62" y2="-444.5" width="0.1524" layer="91" />
<label x="7.62" y="-444.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R97" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-454.66" x2="-7.62" y2="-454.66" width="0.1524" layer="91" />
<label x="-7.62" y="-454.66" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI2_IN" class="0">
<segment>
<pinref part="R99" gate="G$1" pin="2" />
<wire x1="66.04" y1="-454.66" x2="68.58" y2="-454.66" width="0.1524" layer="91" />
<label x="68.58" y="-454.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R100" gate="G$1" pin="1" />
<wire x1="55.88" y1="-464.82" x2="53.34" y2="-464.82" width="0.1524" layer="91" />
<label x="53.34" y="-464.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI2_PD2" class="0">
<segment>
<pinref part="R100" gate="G$1" pin="2" />
<wire x1="66.04" y1="-464.82" x2="68.58" y2="-464.82" width="0.1524" layer="91" />
<label x="68.58" y="-464.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D21" gate="G$1" pin="C1A2" />
<wire x1="60.96" y1="-474.98" x2="60.96" y2="-472.44" width="0.1524" layer="91" />
<label x="60.96" y="-472.44" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C57" gate="G$1" pin="1" />
<wire x1="58.42" y1="-487.68" x2="55.88" y2="-487.68" width="0.1524" layer="91" />
<label x="55.88" y="-487.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI2_PU" class="0">
<segment>
<pinref part="SJ20" gate="1" pin="2" />
<wire x1="66.04" y1="-444.5" x2="68.58" y2="-444.5" width="0.1524" layer="91" />
<label x="68.58" y="-444.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R99" gate="G$1" pin="1" />
<wire x1="55.88" y1="-454.66" x2="53.34" y2="-454.66" width="0.1524" layer="91" />
<label x="53.34" y="-454.66" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI3_IN" class="0">
<segment>
<pinref part="R101" gate="G$1" pin="2" />
<wire x1="127" y1="-454.66" x2="129.54" y2="-454.66" width="0.1524" layer="91" />
<label x="129.54" y="-454.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R102" gate="G$1" pin="1" />
<wire x1="116.84" y1="-464.82" x2="114.3" y2="-464.82" width="0.1524" layer="91" />
<label x="114.3" y="-464.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI3_PB12" class="0">
<segment>
<pinref part="R102" gate="G$1" pin="2" />
<wire x1="127" y1="-464.82" x2="129.54" y2="-464.82" width="0.1524" layer="91" />
<label x="129.54" y="-464.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D22" gate="G$1" pin="C1A2" />
<wire x1="121.92" y1="-474.98" x2="121.92" y2="-472.44" width="0.1524" layer="91" />
<label x="121.92" y="-472.44" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C58" gate="G$1" pin="1" />
<wire x1="119.38" y1="-487.68" x2="116.84" y2="-487.68" width="0.1524" layer="91" />
<label x="116.84" y="-487.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI3_PU" class="0">
<segment>
<pinref part="SJ21" gate="1" pin="2" />
<wire x1="127" y1="-444.5" x2="129.54" y2="-444.5" width="0.1524" layer="91" />
<label x="129.54" y="-444.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R101" gate="G$1" pin="1" />
<wire x1="116.84" y1="-454.66" x2="114.3" y2="-454.66" width="0.1524" layer="91" />
<label x="114.3" y="-454.66" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI4_IN" class="0">
<segment>
<pinref part="R103" gate="G$1" pin="2" />
<wire x1="187.96" y1="-454.66" x2="190.5" y2="-454.66" width="0.1524" layer="91" />
<label x="190.5" y="-454.66" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R104" gate="G$1" pin="1" />
<wire x1="177.8" y1="-464.82" x2="175.26" y2="-464.82" width="0.1524" layer="91" />
<label x="175.26" y="-464.82" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI4_PB4" class="0">
<segment>
<pinref part="R104" gate="G$1" pin="2" />
<wire x1="187.96" y1="-464.82" x2="190.5" y2="-464.82" width="0.1524" layer="91" />
<label x="190.5" y="-464.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D23" gate="G$1" pin="C1A2" />
<wire x1="182.88" y1="-474.98" x2="182.88" y2="-472.44" width="0.1524" layer="91" />
<label x="182.88" y="-472.44" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C59" gate="G$1" pin="1" />
<wire x1="180.34" y1="-487.68" x2="177.8" y2="-487.68" width="0.1524" layer="91" />
<label x="177.8" y="-487.68" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="DI4_PU" class="0">
<segment>
<pinref part="SJ22" gate="1" pin="2" />
<wire x1="187.96" y1="-444.5" x2="190.5" y2="-444.5" width="0.1524" layer="91" />
<label x="190.5" y="-444.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R103" gate="G$1" pin="1" />
<wire x1="177.8" y1="-454.66" x2="175.26" y2="-454.66" width="0.1524" layer="91" />
<label x="175.26" y="-454.66" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_INN" class="0">
<segment>
<pinref part="R68" gate="G$1" pin="2" />
<wire x1="5.08" y1="-231.14" x2="7.62" y2="-231.14" width="0.1524" layer="91" />
<label x="7.62" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-251.46" x2="-5.08" y2="-251.46" width="0.1524" layer="91" />
<label x="-5.08" y="-251.46" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R69" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-261.62" x2="-7.62" y2="-261.62" width="0.1524" layer="91" />
<label x="-7.62" y="-261.62" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="-IN" />
<wire x1="-15.24" y1="-284.48" x2="-17.78" y2="-284.48" width="0.1524" layer="91" />
<label x="-17.78" y="-284.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_INP" class="0">
<segment>
<pinref part="R67" gate="G$1" pin="2" />
<wire x1="5.08" y1="-220.98" x2="7.62" y2="-220.98" width="0.1524" layer="91" />
<label x="7.62" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C35" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-241.3" x2="-5.08" y2="-241.3" width="0.1524" layer="91" />
<label x="-5.08" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="+IN" />
<wire x1="-15.24" y1="-281.94" x2="-17.78" y2="-281.94" width="0.1524" layer="91" />
<label x="-17.78" y="-281.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_N" class="0">
<segment>
<pinref part="R68" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-231.14" x2="-7.62" y2="-231.14" width="0.1524" layer="91" />
<label x="-7.62" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_OUT" class="0">
<segment>
<pinref part="U10" gate="G$1" pin="OUT" />
<wire x1="15.24" y1="-284.48" x2="17.78" y2="-284.48" width="0.1524" layer="91" />
<label x="17.78" y="-284.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="SENSE" />
<wire x1="15.24" y1="-287.02" x2="17.78" y2="-287.02" width="0.1524" layer="91" />
<label x="17.78" y="-287.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R70" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-309.88" x2="-7.62" y2="-309.88" width="0.1524" layer="91" />
<label x="-7.62" y="-309.88" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_P" class="0">
<segment>
<pinref part="R67" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-220.98" x2="-7.62" y2="-220.98" width="0.1524" layer="91" />
<label x="-7.62" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_PA0" class="0">
<segment>
<pinref part="R70" gate="G$1" pin="2" />
<wire x1="5.08" y1="-309.88" x2="7.62" y2="-309.88" width="0.1524" layer="91" />
<label x="7.62" y="-309.88" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R71" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-320.04" x2="-7.62" y2="-320.04" width="0.1524" layer="91" />
<label x="-7.62" y="-320.04" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C38" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-330.2" x2="-5.08" y2="-330.2" width="0.1524" layer="91" />
<label x="-5.08" y="-330.2" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT1_REF" class="0">
<segment>
<pinref part="R69" gate="G$1" pin="2" />
<wire x1="5.08" y1="-261.62" x2="7.62" y2="-261.62" width="0.1524" layer="91" />
<label x="7.62" y="-261.62" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ10" gate="1" pin="1" />
<wire x1="-5.08" y1="-271.78" x2="-7.62" y2="-271.78" width="0.1524" layer="91" />
<label x="-7.62" y="-271.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_INN" class="0">
<segment>
<pinref part="R73" gate="G$1" pin="2" />
<wire x1="71.12" y1="-231.14" x2="73.66" y2="-231.14" width="0.1524" layer="91" />
<label x="73.66" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C40" gate="G$1" pin="1" />
<wire x1="63.5" y1="-251.46" x2="60.96" y2="-251.46" width="0.1524" layer="91" />
<label x="60.96" y="-251.46" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R74" gate="G$1" pin="1" />
<wire x1="60.96" y1="-261.62" x2="58.42" y2="-261.62" width="0.1524" layer="91" />
<label x="58.42" y="-261.62" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="-IN" />
<wire x1="50.8" y1="-284.48" x2="48.26" y2="-284.48" width="0.1524" layer="91" />
<label x="48.26" y="-284.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_INP" class="0">
<segment>
<pinref part="R72" gate="G$1" pin="2" />
<wire x1="71.12" y1="-220.98" x2="73.66" y2="-220.98" width="0.1524" layer="91" />
<label x="73.66" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C39" gate="G$1" pin="1" />
<wire x1="63.5" y1="-241.3" x2="60.96" y2="-241.3" width="0.1524" layer="91" />
<label x="60.96" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="+IN" />
<wire x1="50.8" y1="-281.94" x2="48.26" y2="-281.94" width="0.1524" layer="91" />
<label x="48.26" y="-281.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_N" class="0">
<segment>
<pinref part="R73" gate="G$1" pin="1" />
<wire x1="60.96" y1="-231.14" x2="58.42" y2="-231.14" width="0.1524" layer="91" />
<label x="58.42" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_OUT" class="0">
<segment>
<pinref part="U11" gate="G$1" pin="OUT" />
<wire x1="81.28" y1="-284.48" x2="83.82" y2="-284.48" width="0.1524" layer="91" />
<label x="83.82" y="-284.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="SENSE" />
<wire x1="81.28" y1="-287.02" x2="83.82" y2="-287.02" width="0.1524" layer="91" />
<label x="83.82" y="-287.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R75" gate="G$1" pin="1" />
<wire x1="60.96" y1="-309.88" x2="58.42" y2="-309.88" width="0.1524" layer="91" />
<label x="58.42" y="-309.88" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_P" class="0">
<segment>
<pinref part="R72" gate="G$1" pin="1" />
<wire x1="60.96" y1="-220.98" x2="58.42" y2="-220.98" width="0.1524" layer="91" />
<label x="58.42" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_PA1" class="0">
<segment>
<pinref part="R75" gate="G$1" pin="2" />
<wire x1="71.12" y1="-309.88" x2="73.66" y2="-309.88" width="0.1524" layer="91" />
<label x="73.66" y="-309.88" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R76" gate="G$1" pin="1" />
<wire x1="60.96" y1="-320.04" x2="58.42" y2="-320.04" width="0.1524" layer="91" />
<label x="58.42" y="-320.04" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C42" gate="G$1" pin="1" />
<wire x1="63.5" y1="-330.2" x2="60.96" y2="-330.2" width="0.1524" layer="91" />
<label x="60.96" y="-330.2" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT2_REF" class="0">
<segment>
<pinref part="R74" gate="G$1" pin="2" />
<wire x1="71.12" y1="-261.62" x2="73.66" y2="-261.62" width="0.1524" layer="91" />
<label x="73.66" y="-261.62" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ11" gate="1" pin="1" />
<wire x1="60.96" y1="-271.78" x2="58.42" y2="-271.78" width="0.1524" layer="91" />
<label x="58.42" y="-271.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_INN" class="0">
<segment>
<pinref part="R78" gate="G$1" pin="2" />
<wire x1="137.16" y1="-231.14" x2="139.7" y2="-231.14" width="0.1524" layer="91" />
<label x="139.7" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C44" gate="G$1" pin="1" />
<wire x1="129.54" y1="-251.46" x2="127" y2="-251.46" width="0.1524" layer="91" />
<label x="127" y="-251.46" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R79" gate="G$1" pin="1" />
<wire x1="127" y1="-261.62" x2="124.46" y2="-261.62" width="0.1524" layer="91" />
<label x="124.46" y="-261.62" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="-IN" />
<wire x1="116.84" y1="-284.48" x2="114.3" y2="-284.48" width="0.1524" layer="91" />
<label x="114.3" y="-284.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_INP" class="0">
<segment>
<pinref part="R77" gate="G$1" pin="2" />
<wire x1="137.16" y1="-220.98" x2="139.7" y2="-220.98" width="0.1524" layer="91" />
<label x="139.7" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C43" gate="G$1" pin="1" />
<wire x1="129.54" y1="-241.3" x2="127" y2="-241.3" width="0.1524" layer="91" />
<label x="127" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="+IN" />
<wire x1="116.84" y1="-281.94" x2="114.3" y2="-281.94" width="0.1524" layer="91" />
<label x="114.3" y="-281.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_N" class="0">
<segment>
<pinref part="R78" gate="G$1" pin="1" />
<wire x1="127" y1="-231.14" x2="124.46" y2="-231.14" width="0.1524" layer="91" />
<label x="124.46" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_OUT" class="0">
<segment>
<pinref part="U12" gate="G$1" pin="OUT" />
<wire x1="147.32" y1="-284.48" x2="149.86" y2="-284.48" width="0.1524" layer="91" />
<label x="149.86" y="-284.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="SENSE" />
<wire x1="147.32" y1="-287.02" x2="149.86" y2="-287.02" width="0.1524" layer="91" />
<label x="149.86" y="-287.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R80" gate="G$1" pin="1" />
<wire x1="127" y1="-309.88" x2="124.46" y2="-309.88" width="0.1524" layer="91" />
<label x="124.46" y="-309.88" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_P" class="0">
<segment>
<pinref part="R77" gate="G$1" pin="1" />
<wire x1="127" y1="-220.98" x2="124.46" y2="-220.98" width="0.1524" layer="91" />
<label x="124.46" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_PA2" class="0">
<segment>
<pinref part="R80" gate="G$1" pin="2" />
<wire x1="137.16" y1="-309.88" x2="139.7" y2="-309.88" width="0.1524" layer="91" />
<label x="139.7" y="-309.88" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R81" gate="G$1" pin="1" />
<wire x1="127" y1="-320.04" x2="124.46" y2="-320.04" width="0.1524" layer="91" />
<label x="124.46" y="-320.04" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C46" gate="G$1" pin="1" />
<wire x1="129.54" y1="-330.2" x2="127" y2="-330.2" width="0.1524" layer="91" />
<label x="127" y="-330.2" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT3_REF" class="0">
<segment>
<pinref part="R79" gate="G$1" pin="2" />
<wire x1="137.16" y1="-261.62" x2="139.7" y2="-261.62" width="0.1524" layer="91" />
<label x="139.7" y="-261.62" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ12" gate="1" pin="1" />
<wire x1="127" y1="-271.78" x2="124.46" y2="-271.78" width="0.1524" layer="91" />
<label x="124.46" y="-271.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_INN" class="0">
<segment>
<pinref part="R83" gate="G$1" pin="2" />
<wire x1="203.2" y1="-231.14" x2="205.74" y2="-231.14" width="0.1524" layer="91" />
<label x="205.74" y="-231.14" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C48" gate="G$1" pin="1" />
<wire x1="195.58" y1="-251.46" x2="193.04" y2="-251.46" width="0.1524" layer="91" />
<label x="193.04" y="-251.46" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="R84" gate="G$1" pin="1" />
<wire x1="193.04" y1="-261.62" x2="190.5" y2="-261.62" width="0.1524" layer="91" />
<label x="190.5" y="-261.62" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="-IN" />
<wire x1="182.88" y1="-284.48" x2="180.34" y2="-284.48" width="0.1524" layer="91" />
<label x="180.34" y="-284.48" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_INP" class="0">
<segment>
<pinref part="R82" gate="G$1" pin="2" />
<wire x1="203.2" y1="-220.98" x2="205.74" y2="-220.98" width="0.1524" layer="91" />
<label x="205.74" y="-220.98" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C47" gate="G$1" pin="1" />
<wire x1="195.58" y1="-241.3" x2="193.04" y2="-241.3" width="0.1524" layer="91" />
<label x="193.04" y="-241.3" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="+IN" />
<wire x1="182.88" y1="-281.94" x2="180.34" y2="-281.94" width="0.1524" layer="91" />
<label x="180.34" y="-281.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_N" class="0">
<segment>
<pinref part="R83" gate="G$1" pin="1" />
<wire x1="193.04" y1="-231.14" x2="190.5" y2="-231.14" width="0.1524" layer="91" />
<label x="190.5" y="-231.14" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_OUT" class="0">
<segment>
<pinref part="U13" gate="G$1" pin="OUT" />
<wire x1="213.36" y1="-284.48" x2="215.9" y2="-284.48" width="0.1524" layer="91" />
<label x="215.9" y="-284.48" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="SENSE" />
<wire x1="213.36" y1="-287.02" x2="215.9" y2="-287.02" width="0.1524" layer="91" />
<label x="215.9" y="-287.02" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R85" gate="G$1" pin="1" />
<wire x1="193.04" y1="-309.88" x2="190.5" y2="-309.88" width="0.1524" layer="91" />
<label x="190.5" y="-309.88" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_P" class="0">
<segment>
<pinref part="R82" gate="G$1" pin="1" />
<wire x1="193.04" y1="-220.98" x2="190.5" y2="-220.98" width="0.1524" layer="91" />
<label x="190.5" y="-220.98" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_PA3" class="0">
<segment>
<pinref part="R85" gate="G$1" pin="2" />
<wire x1="203.2" y1="-309.88" x2="205.74" y2="-309.88" width="0.1524" layer="91" />
<label x="205.74" y="-309.88" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R86" gate="G$1" pin="1" />
<wire x1="193.04" y1="-320.04" x2="190.5" y2="-320.04" width="0.1524" layer="91" />
<label x="190.5" y="-320.04" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C50" gate="G$1" pin="1" />
<wire x1="195.58" y1="-330.2" x2="193.04" y2="-330.2" width="0.1524" layer="91" />
<label x="193.04" y="-330.2" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="EGT4_REF" class="0">
<segment>
<pinref part="R84" gate="G$1" pin="2" />
<wire x1="203.2" y1="-261.62" x2="205.74" y2="-261.62" width="0.1524" layer="91" />
<label x="205.74" y="-261.62" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ13" gate="1" pin="1" />
<wire x1="193.04" y1="-271.78" x2="190.5" y2="-271.78" width="0.1524" layer="91" />
<label x="190.5" y="-271.78" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ1_IN" class="0">
<segment>
<pinref part="R87" gate="G$1" pin="2" />
<wire x1="5.08" y1="-375.92" x2="7.62" y2="-375.92" width="0.1524" layer="91" />
<label x="7.62" y="-375.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R88" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-386.08" x2="-7.62" y2="-386.08" width="0.1524" layer="91" />
<label x="-7.62" y="-386.08" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ1_PA15" class="0">
<segment>
<pinref part="R88" gate="G$1" pin="2" />
<wire x1="5.08" y1="-386.08" x2="7.62" y2="-386.08" width="0.1524" layer="91" />
<label x="7.62" y="-386.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D15" gate="G$1" pin="C1A2" />
<wire x1="0" y1="-396.24" x2="0" y2="-393.7" width="0.1524" layer="91" />
<label x="0" y="-393.7" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C51" gate="G$1" pin="1" />
<wire x1="-2.54" y1="-408.94" x2="-5.08" y2="-408.94" width="0.1524" layer="91" />
<label x="-5.08" y="-408.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ1_PU" class="0">
<segment>
<pinref part="SJ14" gate="1" pin="2" />
<wire x1="5.08" y1="-365.76" x2="7.62" y2="-365.76" width="0.1524" layer="91" />
<label x="7.62" y="-365.76" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R87" gate="G$1" pin="1" />
<wire x1="-5.08" y1="-375.92" x2="-7.62" y2="-375.92" width="0.1524" layer="91" />
<label x="-7.62" y="-375.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ2_IN" class="0">
<segment>
<pinref part="R89" gate="G$1" pin="2" />
<wire x1="66.04" y1="-375.92" x2="68.58" y2="-375.92" width="0.1524" layer="91" />
<label x="68.58" y="-375.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R90" gate="G$1" pin="1" />
<wire x1="55.88" y1="-386.08" x2="53.34" y2="-386.08" width="0.1524" layer="91" />
<label x="53.34" y="-386.08" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ2_PB3" class="0">
<segment>
<pinref part="R90" gate="G$1" pin="2" />
<wire x1="66.04" y1="-386.08" x2="68.58" y2="-386.08" width="0.1524" layer="91" />
<label x="68.58" y="-386.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D16" gate="G$1" pin="C1A2" />
<wire x1="60.96" y1="-396.24" x2="60.96" y2="-393.7" width="0.1524" layer="91" />
<label x="60.96" y="-393.7" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C52" gate="G$1" pin="1" />
<wire x1="58.42" y1="-408.94" x2="55.88" y2="-408.94" width="0.1524" layer="91" />
<label x="55.88" y="-408.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ2_PU" class="0">
<segment>
<pinref part="SJ15" gate="1" pin="2" />
<wire x1="66.04" y1="-365.76" x2="68.58" y2="-365.76" width="0.1524" layer="91" />
<label x="68.58" y="-365.76" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R89" gate="G$1" pin="1" />
<wire x1="55.88" y1="-375.92" x2="53.34" y2="-375.92" width="0.1524" layer="91" />
<label x="53.34" y="-375.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ3_IN" class="0">
<segment>
<pinref part="R91" gate="G$1" pin="2" />
<wire x1="127" y1="-375.92" x2="129.54" y2="-375.92" width="0.1524" layer="91" />
<label x="129.54" y="-375.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R92" gate="G$1" pin="1" />
<wire x1="116.84" y1="-386.08" x2="114.3" y2="-386.08" width="0.1524" layer="91" />
<label x="114.3" y="-386.08" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ3_PB10" class="0">
<segment>
<pinref part="R92" gate="G$1" pin="2" />
<wire x1="127" y1="-386.08" x2="129.54" y2="-386.08" width="0.1524" layer="91" />
<label x="129.54" y="-386.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D17" gate="G$1" pin="C1A2" />
<wire x1="121.92" y1="-396.24" x2="121.92" y2="-393.7" width="0.1524" layer="91" />
<label x="121.92" y="-393.7" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C53" gate="G$1" pin="1" />
<wire x1="119.38" y1="-408.94" x2="116.84" y2="-408.94" width="0.1524" layer="91" />
<label x="116.84" y="-408.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ3_PU" class="0">
<segment>
<pinref part="SJ16" gate="1" pin="2" />
<wire x1="127" y1="-365.76" x2="129.54" y2="-365.76" width="0.1524" layer="91" />
<label x="129.54" y="-365.76" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R91" gate="G$1" pin="1" />
<wire x1="116.84" y1="-375.92" x2="114.3" y2="-375.92" width="0.1524" layer="91" />
<label x="114.3" y="-375.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ4_IN" class="0">
<segment>
<pinref part="R93" gate="G$1" pin="2" />
<wire x1="187.96" y1="-375.92" x2="190.5" y2="-375.92" width="0.1524" layer="91" />
<label x="190.5" y="-375.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R94" gate="G$1" pin="1" />
<wire x1="177.8" y1="-386.08" x2="175.26" y2="-386.08" width="0.1524" layer="91" />
<label x="175.26" y="-386.08" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ4_PB11" class="0">
<segment>
<pinref part="R94" gate="G$1" pin="2" />
<wire x1="187.96" y1="-386.08" x2="190.5" y2="-386.08" width="0.1524" layer="91" />
<label x="190.5" y="-386.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D18" gate="G$1" pin="C1A2" />
<wire x1="182.88" y1="-396.24" x2="182.88" y2="-393.7" width="0.1524" layer="91" />
<label x="182.88" y="-393.7" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C54" gate="G$1" pin="1" />
<wire x1="180.34" y1="-408.94" x2="177.8" y2="-408.94" width="0.1524" layer="91" />
<label x="177.8" y="-408.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ4_PU" class="0">
<segment>
<pinref part="SJ17" gate="1" pin="2" />
<wire x1="187.96" y1="-365.76" x2="190.5" y2="-365.76" width="0.1524" layer="91" />
<label x="190.5" y="-365.76" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R93" gate="G$1" pin="1" />
<wire x1="177.8" y1="-375.92" x2="175.26" y2="-375.92" width="0.1524" layer="91" />
<label x="175.26" y="-375.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ5_IN" class="0">
<segment>
<pinref part="R95" gate="G$1" pin="2" />
<wire x1="248.92" y1="-375.92" x2="251.46" y2="-375.92" width="0.1524" layer="91" />
<label x="251.46" y="-375.92" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R96" gate="G$1" pin="1" />
<wire x1="238.76" y1="-386.08" x2="236.22" y2="-386.08" width="0.1524" layer="91" />
<label x="236.22" y="-386.08" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ5_PA8" class="0">
<segment>
<pinref part="R96" gate="G$1" pin="2" />
<wire x1="248.92" y1="-386.08" x2="251.46" y2="-386.08" width="0.1524" layer="91" />
<label x="251.46" y="-386.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D19" gate="G$1" pin="C1A2" />
<wire x1="243.84" y1="-396.24" x2="243.84" y2="-393.7" width="0.1524" layer="91" />
<label x="243.84" y="-393.7" size="1.27" layer="95" rot="R90" />
</segment>
<segment>
<pinref part="C55" gate="G$1" pin="1" />
<wire x1="241.3" y1="-408.94" x2="238.76" y2="-408.94" width="0.1524" layer="91" />
<label x="238.76" y="-408.94" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="FREQ5_PU" class="0">
<segment>
<pinref part="SJ18" gate="1" pin="2" />
<wire x1="248.92" y1="-365.76" x2="251.46" y2="-365.76" width="0.1524" layer="91" />
<label x="251.46" y="-365.76" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R95" gate="G$1" pin="1" />
<wire x1="238.76" y1="-375.92" x2="236.22" y2="-375.92" width="0.1524" layer="91" />
<label x="236.22" y="-375.92" size="1.27" layer="95" rot="R180" />
</segment>
</net>
<net name="GND" class="1">
<segment>
<pinref part="R37" gate="G$1" pin="2" />
<wire x1="5.08" y1="-40.64" x2="7.62" y2="-40.64" width="0.1524" layer="91" />
<label x="7.62" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D7" gate="G$1" pin="A1" />
<wire x1="-5.08" y1="-53.34" x2="-7.62" y2="-53.34" width="0.1524" layer="91" />
<label x="-7.62" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="2" />
<wire x1="5.08" y1="-63.5" x2="7.62" y2="-63.5" width="0.1524" layer="91" />
<label x="7.62" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2" />
<wire x1="5.08" y1="-83.82" x2="7.62" y2="-83.82" width="0.1524" layer="91" />
<label x="7.62" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R41" gate="G$1" pin="2" />
<wire x1="60.96" y1="-40.64" x2="63.5" y2="-40.64" width="0.1524" layer="91" />
<label x="63.5" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D8" gate="G$1" pin="A1" />
<wire x1="50.8" y1="-53.34" x2="48.26" y2="-53.34" width="0.1524" layer="91" />
<label x="48.26" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2" />
<wire x1="60.96" y1="-63.5" x2="63.5" y2="-63.5" width="0.1524" layer="91" />
<label x="63.5" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="2" />
<wire x1="60.96" y1="-83.82" x2="63.5" y2="-83.82" width="0.1524" layer="91" />
<label x="63.5" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R45" gate="G$1" pin="2" />
<wire x1="116.84" y1="-40.64" x2="119.38" y2="-40.64" width="0.1524" layer="91" />
<label x="119.38" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D9" gate="G$1" pin="A1" />
<wire x1="106.68" y1="-53.34" x2="104.14" y2="-53.34" width="0.1524" layer="91" />
<label x="104.14" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="2" />
<wire x1="116.84" y1="-63.5" x2="119.38" y2="-63.5" width="0.1524" layer="91" />
<label x="119.38" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="2" />
<wire x1="116.84" y1="-83.82" x2="119.38" y2="-83.82" width="0.1524" layer="91" />
<label x="119.38" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R49" gate="G$1" pin="2" />
<wire x1="172.72" y1="-40.64" x2="175.26" y2="-40.64" width="0.1524" layer="91" />
<label x="175.26" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D10" gate="G$1" pin="A1" />
<wire x1="162.56" y1="-53.34" x2="160.02" y2="-53.34" width="0.1524" layer="91" />
<label x="160.02" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C23" gate="G$1" pin="2" />
<wire x1="172.72" y1="-63.5" x2="175.26" y2="-63.5" width="0.1524" layer="91" />
<label x="175.26" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="2" />
<wire x1="172.72" y1="-83.82" x2="175.26" y2="-83.82" width="0.1524" layer="91" />
<label x="175.26" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R53" gate="G$1" pin="2" />
<wire x1="228.6" y1="-40.64" x2="231.14" y2="-40.64" width="0.1524" layer="91" />
<label x="231.14" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D11" gate="G$1" pin="A1" />
<wire x1="218.44" y1="-53.34" x2="215.9" y2="-53.34" width="0.1524" layer="91" />
<label x="215.9" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="2" />
<wire x1="228.6" y1="-63.5" x2="231.14" y2="-63.5" width="0.1524" layer="91" />
<label x="231.14" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="2" />
<wire x1="228.6" y1="-83.82" x2="231.14" y2="-83.82" width="0.1524" layer="91" />
<label x="231.14" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R57" gate="G$1" pin="2" />
<wire x1="284.48" y1="-40.64" x2="287.02" y2="-40.64" width="0.1524" layer="91" />
<label x="287.02" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D12" gate="G$1" pin="A1" />
<wire x1="274.32" y1="-53.34" x2="271.78" y2="-53.34" width="0.1524" layer="91" />
<label x="271.78" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C27" gate="G$1" pin="2" />
<wire x1="284.48" y1="-63.5" x2="287.02" y2="-63.5" width="0.1524" layer="91" />
<label x="287.02" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C28" gate="G$1" pin="2" />
<wire x1="284.48" y1="-83.82" x2="287.02" y2="-83.82" width="0.1524" layer="91" />
<label x="287.02" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R61" gate="G$1" pin="2" />
<wire x1="340.36" y1="-40.64" x2="342.9" y2="-40.64" width="0.1524" layer="91" />
<label x="342.9" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D13" gate="G$1" pin="A1" />
<wire x1="330.2" y1="-53.34" x2="327.66" y2="-53.34" width="0.1524" layer="91" />
<label x="327.66" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C29" gate="G$1" pin="2" />
<wire x1="340.36" y1="-63.5" x2="342.9" y2="-63.5" width="0.1524" layer="91" />
<label x="342.9" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C30" gate="G$1" pin="2" />
<wire x1="340.36" y1="-83.82" x2="342.9" y2="-83.82" width="0.1524" layer="91" />
<label x="342.9" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R65" gate="G$1" pin="2" />
<wire x1="396.24" y1="-40.64" x2="398.78" y2="-40.64" width="0.1524" layer="91" />
<label x="398.78" y="-40.64" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D14" gate="G$1" pin="A1" />
<wire x1="386.08" y1="-53.34" x2="383.54" y2="-53.34" width="0.1524" layer="91" />
<label x="383.54" y="-53.34" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C31" gate="G$1" pin="2" />
<wire x1="396.24" y1="-63.5" x2="398.78" y2="-63.5" width="0.1524" layer="91" />
<label x="398.78" y="-63.5" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C32" gate="G$1" pin="2" />
<wire x1="396.24" y1="-83.82" x2="398.78" y2="-83.82" width="0.1524" layer="91" />
<label x="398.78" y="-83.82" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U8" gate="G$1" pin="V-" />
<wire x1="15.24" y1="-132.08" x2="17.78" y2="-132.08" width="0.1524" layer="91" />
<label x="17.78" y="-132.08" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C33" gate="G$1" pin="2" />
<wire x1="5.08" y1="-147.32" x2="7.62" y2="-147.32" width="0.1524" layer="91" />
<label x="7.62" y="-147.32" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="V-" />
<wire x1="15.24" y1="-170.18" x2="17.78" y2="-170.18" width="0.1524" layer="91" />
<label x="17.78" y="-170.18" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C34" gate="G$1" pin="2" />
<wire x1="5.08" y1="-185.42" x2="7.62" y2="-185.42" width="0.1524" layer="91" />
<label x="7.62" y="-185.42" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C35" gate="G$1" pin="2" />
<wire x1="5.08" y1="-241.3" x2="7.62" y2="-241.3" width="0.1524" layer="91" />
<label x="7.62" y="-241.3" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C36" gate="G$1" pin="2" />
<wire x1="5.08" y1="-251.46" x2="7.62" y2="-251.46" width="0.1524" layer="91" />
<label x="7.62" y="-251.46" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ10" gate="1" pin="2" />
<wire x1="5.08" y1="-271.78" x2="7.62" y2="-271.78" width="0.1524" layer="91" />
<label x="7.62" y="-271.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="REF" />
<wire x1="-15.24" y1="-287.02" x2="-17.78" y2="-287.02" width="0.1524" layer="91" />
<label x="-17.78" y="-287.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U10" gate="G$1" pin="-VS" />
<wire x1="-15.24" y1="-289.56" x2="-17.78" y2="-289.56" width="0.1524" layer="91" />
<label x="-17.78" y="-289.56" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C37" gate="G$1" pin="2" />
<wire x1="5.08" y1="-299.72" x2="7.62" y2="-299.72" width="0.1524" layer="91" />
<label x="7.62" y="-299.72" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R71" gate="G$1" pin="2" />
<wire x1="5.08" y1="-320.04" x2="7.62" y2="-320.04" width="0.1524" layer="91" />
<label x="7.62" y="-320.04" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C38" gate="G$1" pin="2" />
<wire x1="5.08" y1="-330.2" x2="7.62" y2="-330.2" width="0.1524" layer="91" />
<label x="7.62" y="-330.2" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C39" gate="G$1" pin="2" />
<wire x1="71.12" y1="-241.3" x2="73.66" y2="-241.3" width="0.1524" layer="91" />
<label x="73.66" y="-241.3" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C40" gate="G$1" pin="2" />
<wire x1="71.12" y1="-251.46" x2="73.66" y2="-251.46" width="0.1524" layer="91" />
<label x="73.66" y="-251.46" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ11" gate="1" pin="2" />
<wire x1="71.12" y1="-271.78" x2="73.66" y2="-271.78" width="0.1524" layer="91" />
<label x="73.66" y="-271.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="REF" />
<wire x1="50.8" y1="-287.02" x2="48.26" y2="-287.02" width="0.1524" layer="91" />
<label x="48.26" y="-287.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="-VS" />
<wire x1="50.8" y1="-289.56" x2="48.26" y2="-289.56" width="0.1524" layer="91" />
<label x="48.26" y="-289.56" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C41" gate="G$1" pin="2" />
<wire x1="71.12" y1="-299.72" x2="73.66" y2="-299.72" width="0.1524" layer="91" />
<label x="73.66" y="-299.72" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R76" gate="G$1" pin="2" />
<wire x1="71.12" y1="-320.04" x2="73.66" y2="-320.04" width="0.1524" layer="91" />
<label x="73.66" y="-320.04" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C42" gate="G$1" pin="2" />
<wire x1="71.12" y1="-330.2" x2="73.66" y2="-330.2" width="0.1524" layer="91" />
<label x="73.66" y="-330.2" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C43" gate="G$1" pin="2" />
<wire x1="137.16" y1="-241.3" x2="139.7" y2="-241.3" width="0.1524" layer="91" />
<label x="139.7" y="-241.3" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C44" gate="G$1" pin="2" />
<wire x1="137.16" y1="-251.46" x2="139.7" y2="-251.46" width="0.1524" layer="91" />
<label x="139.7" y="-251.46" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ12" gate="1" pin="2" />
<wire x1="137.16" y1="-271.78" x2="139.7" y2="-271.78" width="0.1524" layer="91" />
<label x="139.7" y="-271.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="REF" />
<wire x1="116.84" y1="-287.02" x2="114.3" y2="-287.02" width="0.1524" layer="91" />
<label x="114.3" y="-287.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U12" gate="G$1" pin="-VS" />
<wire x1="116.84" y1="-289.56" x2="114.3" y2="-289.56" width="0.1524" layer="91" />
<label x="114.3" y="-289.56" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C45" gate="G$1" pin="2" />
<wire x1="137.16" y1="-299.72" x2="139.7" y2="-299.72" width="0.1524" layer="91" />
<label x="139.7" y="-299.72" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R81" gate="G$1" pin="2" />
<wire x1="137.16" y1="-320.04" x2="139.7" y2="-320.04" width="0.1524" layer="91" />
<label x="139.7" y="-320.04" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C46" gate="G$1" pin="2" />
<wire x1="137.16" y1="-330.2" x2="139.7" y2="-330.2" width="0.1524" layer="91" />
<label x="139.7" y="-330.2" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C47" gate="G$1" pin="2" />
<wire x1="203.2" y1="-241.3" x2="205.74" y2="-241.3" width="0.1524" layer="91" />
<label x="205.74" y="-241.3" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C48" gate="G$1" pin="2" />
<wire x1="203.2" y1="-251.46" x2="205.74" y2="-251.46" width="0.1524" layer="91" />
<label x="205.74" y="-251.46" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="SJ13" gate="1" pin="2" />
<wire x1="203.2" y1="-271.78" x2="205.74" y2="-271.78" width="0.1524" layer="91" />
<label x="205.74" y="-271.78" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="REF" />
<wire x1="182.88" y1="-287.02" x2="180.34" y2="-287.02" width="0.1524" layer="91" />
<label x="180.34" y="-287.02" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="-VS" />
<wire x1="182.88" y1="-289.56" x2="180.34" y2="-289.56" width="0.1524" layer="91" />
<label x="180.34" y="-289.56" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C49" gate="G$1" pin="2" />
<wire x1="203.2" y1="-299.72" x2="205.74" y2="-299.72" width="0.1524" layer="91" />
<label x="205.74" y="-299.72" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="R86" gate="G$1" pin="2" />
<wire x1="203.2" y1="-320.04" x2="205.74" y2="-320.04" width="0.1524" layer="91" />
<label x="205.74" y="-320.04" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="C50" gate="G$1" pin="2" />
<wire x1="203.2" y1="-330.2" x2="205.74" y2="-330.2" width="0.1524" layer="91" />
<label x="205.74" y="-330.2" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D15" gate="G$1" pin="A1" />
<wire x1="-5.08" y1="-398.78" x2="-7.62" y2="-398.78" width="0.1524" layer="91" />
<label x="-7.62" y="-398.78" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C51" gate="G$1" pin="2" />
<wire x1="5.08" y1="-408.94" x2="7.62" y2="-408.94" width="0.1524" layer="91" />
<label x="7.62" y="-408.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D16" gate="G$1" pin="A1" />
<wire x1="55.88" y1="-398.78" x2="53.34" y2="-398.78" width="0.1524" layer="91" />
<label x="53.34" y="-398.78" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C52" gate="G$1" pin="2" />
<wire x1="66.04" y1="-408.94" x2="68.58" y2="-408.94" width="0.1524" layer="91" />
<label x="68.58" y="-408.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D17" gate="G$1" pin="A1" />
<wire x1="116.84" y1="-398.78" x2="114.3" y2="-398.78" width="0.1524" layer="91" />
<label x="114.3" y="-398.78" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C53" gate="G$1" pin="2" />
<wire x1="127" y1="-408.94" x2="129.54" y2="-408.94" width="0.1524" layer="91" />
<label x="129.54" y="-408.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D18" gate="G$1" pin="A1" />
<wire x1="177.8" y1="-398.78" x2="175.26" y2="-398.78" width="0.1524" layer="91" />
<label x="175.26" y="-398.78" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C54" gate="G$1" pin="2" />
<wire x1="187.96" y1="-408.94" x2="190.5" y2="-408.94" width="0.1524" layer="91" />
<label x="190.5" y="-408.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D19" gate="G$1" pin="A1" />
<wire x1="238.76" y1="-398.78" x2="236.22" y2="-398.78" width="0.1524" layer="91" />
<label x="236.22" y="-398.78" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C55" gate="G$1" pin="2" />
<wire x1="248.92" y1="-408.94" x2="251.46" y2="-408.94" width="0.1524" layer="91" />
<label x="251.46" y="-408.94" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D20" gate="G$1" pin="A1" />
<wire x1="-5.08" y1="-477.52" x2="-7.62" y2="-477.52" width="0.1524" layer="91" />
<label x="-7.62" y="-477.52" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C56" gate="G$1" pin="2" />
<wire x1="5.08" y1="-487.68" x2="7.62" y2="-487.68" width="0.1524" layer="91" />
<label x="7.62" y="-487.68" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D21" gate="G$1" pin="A1" />
<wire x1="55.88" y1="-477.52" x2="53.34" y2="-477.52" width="0.1524" layer="91" />
<label x="53.34" y="-477.52" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C57" gate="G$1" pin="2" />
<wire x1="66.04" y1="-487.68" x2="68.58" y2="-487.68" width="0.1524" layer="91" />
<label x="68.58" y="-487.68" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D22" gate="G$1" pin="A1" />
<wire x1="116.84" y1="-477.52" x2="114.3" y2="-477.52" width="0.1524" layer="91" />
<label x="114.3" y="-477.52" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C58" gate="G$1" pin="2" />
<wire x1="127" y1="-487.68" x2="129.54" y2="-487.68" width="0.1524" layer="91" />
<label x="129.54" y="-487.68" size="1.27" layer="95" />
</segment>
<segment>
<pinref part="D23" gate="G$1" pin="A1" />
<wire x1="177.8" y1="-477.52" x2="175.26" y2="-477.52" width="0.1524" layer="91" />
<label x="175.26" y="-477.52" size="1.27" layer="95" rot="R180" />
</segment>
<segment>
<pinref part="C59" gate="G$1" pin="2" />
<wire x1="187.96" y1="-487.68" x2="190.5" y2="-487.68" width="0.1524" layer="91" />
<label x="190.5" y="-487.68" size="1.27" layer="95" />
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
