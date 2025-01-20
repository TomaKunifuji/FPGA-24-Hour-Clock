##Clock signal
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports CLK]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports CLK]

##Buttons
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports RESET]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports BTN1]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS33} [get_ports BTN2]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports BTN3]

##Slide_Switch
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports SEL_DOWN]

##7segLEDports(JE)
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {LED7seg[0]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {LED7seg[1]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {LED7seg[2]}]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {LED7seg[3]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {LED7seg[4]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {LED7seg[5]}]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {LED7seg[6]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {LED7seg[7]}]

##Pmod Header JC
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {SA[0]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {SA[1]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {SA[2]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {SA[3]}]

set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR2[0] }]
set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR2[1] }]
set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR2[2] }]

set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR3[0] }]
set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR3[1] }]
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR3[2] }]

set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR1[0] }]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR1[1] }]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR1[2] }]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { CS_COLOR1[3] }]