// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Jun  8 12:18:57 2020
// Host        : DESKTOP-GUJ90GN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top afifo_64i_32o_128 -prefix
//               afifo_64i_32o_128_ afifo_64i_32o_128_stub.v
// Design      : afifo_64i_32o_128
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4" *)
module afifo_64i_32o_128(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, rd_data_count, wr_data_count)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[63:0],wr_en,rd_en,dout[31:0],full,empty,rd_data_count[7:0],wr_data_count[6:0]" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [63:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output empty;
  output [7:0]rd_data_count;
  output [6:0]wr_data_count;
endmodule
