
## Clock signal
set_property IOSTANDARD LVCMOS33 [get_ports CLK_50]
set_property PACKAGE_PIN N14 [get_ports CLK_50]

##LEDs
set_property -dict { PACKAGE_PIN N3   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN L4   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
#set_property -dict { PACKAGE_PIN C4   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];

#VGA
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS]
set_property PACKAGE_PIN C1 [get_ports {VGA_G[3]}]
set_property PACKAGE_PIN B2 [get_ports {VGA_G[2]}]
set_property PACKAGE_PIN B4 [get_ports {VGA_G[1]}]
set_property PACKAGE_PIN A5 [get_ports {VGA_G[0]}]
set_property PACKAGE_PIN C7 [get_ports {VGA_B[3]}]
set_property PACKAGE_PIN B6 [get_ports {VGA_B[2]}]
set_property PACKAGE_PIN D6 [get_ports {VGA_B[1]}]
set_property PACKAGE_PIN B7 [get_ports {VGA_B[0]}]
set_property PACKAGE_PIN C3 [get_ports {VGA_R[3]}]
set_property PACKAGE_PIN E2 [get_ports {VGA_R[2]}]
set_property PACKAGE_PIN D4 [get_ports {VGA_R[1]}]
set_property PACKAGE_PIN J5 [get_ports {VGA_R[0]}]
set_property PACKAGE_PIN E3 [get_ports VGA_HS]
set_property PACKAGE_PIN F2 [get_ports VGA_VS]

#UART
set_property IOSTANDARD LVCMOS33 [get_ports UART_RXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TXD]
set_property PACKAGE_PIN G5 [get_ports UART_RXD]
set_property PACKAGE_PIN G4 [get_ports UART_TXD]

#SEG
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIG[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SEL[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEL}]
set_property PACKAGE_PIN C6 [get_ports {DIG[7]}]
set_property PACKAGE_PIN B1 [get_ports {DIG[6]}]
set_property PACKAGE_PIN A2 [get_ports {DIG[5]}]
set_property PACKAGE_PIN A7 [get_ports {DIG[4]}]
set_property PACKAGE_PIN D5 [get_ports {DIG[3]}]
set_property PACKAGE_PIN B5 [get_ports {DIG[2]}]
set_property PACKAGE_PIN A4 [get_ports {DIG[1]}]
set_property PACKAGE_PIN A3 [get_ports {DIG[0]}]
#set_property PACKAGE_PIN D1 [get_ports {SEL[7]}]
#set_property PACKAGE_PIN C2 [get_ports {SEL[6]}]
#set_property PACKAGE_PIN J2 [get_ports {SEL[5]}]
#set_property PACKAGE_PIN K2 [get_ports {SEL[4]}]
#set_property PACKAGE_PIN F6 [get_ports {SEL[3]}]
#set_property PACKAGE_PIN L3 [get_ports {SEL[2]}]
#set_property PACKAGE_PIN G3 [get_ports {SEL[1]}]
set_property PACKAGE_PIN J4 [get_ports {SEL}]

##Quad SPI Flash
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { FLASH_CS }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_cs
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { FLASH_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { FLASH_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { FLASH_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { FLASH_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
