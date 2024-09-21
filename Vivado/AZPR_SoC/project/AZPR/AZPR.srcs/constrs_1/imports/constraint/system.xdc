#clock
set_property -dict { PACKAGE_PIN Y18  IOSTANDARD LVCMOS33 } [get_ports { clk_ref }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports { clk_ref }];

#reset
set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVCMOS33} [get_ports reset_sw];

#GPIO out
set_property PACKAGE_PIN AB8 [get_ports {gpio_out[0]}]
set_property PACKAGE_PIN AA8 [get_ports {gpio_out[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_out[1]}]

set_property PULLDOWN true [get_ports {gpio_out[0]}]
set_property PULLDOWN true [get_ports {gpio_out[1]}]

#GPIO in
set_property PACKAGE_PIN W6 [get_ports {gpio_in[0]}]
set_property PACKAGE_PIN Y7 [get_ports {gpio_in[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {gpio_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_in[1]}]