set_property SRC_FILE_INFO {cfile:D:/Projects/FPGA/Vivado/AZPR_SoC/project/AZPR/AZPR.srcs/constrs_1/imports/constraint/system.xdc rfile:../../../AZPR.srcs/constrs_1/imports/constraint/system.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y18  IOSTANDARD LVCMOS33 } [get_ports { clk_ref }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVCMOS33} [get_ports reset_sw];
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB8 [get_ports {gpio_out[0]}]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA8 [get_ports {gpio_out[1]}]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W6 [get_ports {gpio_in[0]}]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y7 [get_ports {gpio_in[1]}]
