// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Jun  4 12:00:37 2020
// Host        : DESKTOP-GUJ90GN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dds_hdu_ip_0_stub.v
// Design      : dds_hdu_ip_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "read_write_data,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst_n, spi_sck, spi_cs_n, spi_mosi, spi_miso, 
  change_flag, ch1_wave, ch2_wave, amp1, freq1, phase1, amp2, freq2, phase2)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,spi_sck,spi_cs_n,spi_mosi,spi_miso,change_flag,ch1_wave[15:0],ch2_wave[15:0],amp1[31:0],freq1[31:0],phase1[31:0],amp2[31:0],freq2[31:0],phase2[31:0]" */;
  input clk;
  input rst_n;
  input spi_sck;
  input spi_cs_n;
  input spi_mosi;
  output spi_miso;
  output change_flag;
  output [15:0]ch1_wave;
  output [15:0]ch2_wave;
  output [31:0]amp1;
  output [31:0]freq1;
  output [31:0]phase1;
  output [31:0]amp2;
  output [31:0]freq2;
  output [31:0]phase2;
endmodule
