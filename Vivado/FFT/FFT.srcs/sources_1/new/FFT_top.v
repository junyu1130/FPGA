`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 11:25:35
// Design Name: 
// Module Name: FFT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FFT_top(
    input rst_n,
    input clk,
    input adc_busy, 
    input [15:0] data_in,
    
    output adc_rc,
    output [23:0]   fft_real,
    output [23:0]   fft_imag,
    output [46:0]   amp,
    output fft_out_valid
);

wire clk_128M;
reg [11:0] adc_data;
    
clk_wiz_0 user_clk(
    .clk_out1(clk_128M),    
    .clk_in1(clk)
);      
    
ADS8505  user_ADS8505(
    .clk(clk_128M),
    .rst_n(rst_n),  
    .adc_rc(adc_rc)
);

always @(negedge adc_busy) begin
    adc_data <= data_in[11:0];
end
  
FFT_interface user_FFT_interface(
    .aclk(clk),
    .aresetn(rst_n),

    .input_data_ch1(adc_data),
    .fft_real(fft_real),
    .fft_imag(fft_imag),
    .amp(amp),
    .fft_out_valid(fft_out_valid)
);    
    
endmodule
