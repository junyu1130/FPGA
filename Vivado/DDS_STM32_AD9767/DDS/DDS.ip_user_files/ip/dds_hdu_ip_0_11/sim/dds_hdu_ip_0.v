// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:dds_hdu_ip:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module dds_hdu_ip_0 (
  clk,
  rst_n,
  spi_sck,
  spi_cs_n,
  spi_mosi,
  spi_miso,
  change_flag,
  ch1_wave,
  ch2_wave,
  amp1,
  freq1,
  phase1,
  amp2,
  freq2,
  phase2
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire spi_sck;
input wire spi_cs_n;
input wire spi_mosi;
output wire spi_miso;
output wire change_flag;
output wire [15 : 0] ch1_wave;
output wire [15 : 0] ch2_wave;
output wire [31 : 0] amp1;
output wire [31 : 0] freq1;
output wire [31 : 0] phase1;
output wire [31 : 0] amp2;
output wire [31 : 0] freq2;
output wire [31 : 0] phase2;

  read_write_data inst (
    .clk(clk),
    .rst_n(rst_n),
    .spi_sck(spi_sck),
    .spi_cs_n(spi_cs_n),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),
    .change_flag(change_flag),
    .ch1_wave(ch1_wave),
    .ch2_wave(ch2_wave),
    .amp1(amp1),
    .freq1(freq1),
    .phase1(phase1),
    .amp2(amp2),
    .freq2(freq2),
    .phase2(phase2)
  );
endmodule
