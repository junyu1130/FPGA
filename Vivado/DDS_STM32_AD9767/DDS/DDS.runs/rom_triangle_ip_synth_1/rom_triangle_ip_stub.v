// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed May 27 19:33:21 2020
// Host        : DESKTOP-GUJ90GN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Projects/FPGA/Vivado/DDS/DDS.runs/rom_triangle_ip_synth_1/rom_triangle_ip_stub.v
// Design      : rom_triangle_ip
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module rom_triangle_ip(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[9:0],douta[13:0]" */;
  input clka;
  input [9:0]addra;
  output [13:0]douta;
endmodule