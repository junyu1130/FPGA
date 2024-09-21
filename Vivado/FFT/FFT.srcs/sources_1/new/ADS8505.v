`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 11:28:37
// Design Name: 
// Module Name: ADS8505
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

module ADS8505(
    input clk,
    input rst_n,
    
    output reg adc_rc
);

//clk input = 128M, fs = 128k     
// ads8505 时序参数
`define		T_START_CONV		16'd10		//开始转换     max：1750ns   min:40ns
`define		T_WORK				16'd1000	//工作状态     min:4us      50M  20ns 0.02us

reg [15:0] t_counter;
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
    begin
        adc_rc <= 1'b1;
        t_counter <= 0;
    end
	else
    begin
        if(t_counter < `T_WORK - 1)
        begin
            if(t_counter < `T_START_CONV)
            begin
                adc_rc <= 1'b0;
            end
            else
            begin
                adc_rc <= 1'b1;
            end
            t_counter <= t_counter + 1'b1;
        end
        else
        begin
            adc_rc <= 1'b0;
            t_counter <= 0;
        end
    end
end

endmodule
