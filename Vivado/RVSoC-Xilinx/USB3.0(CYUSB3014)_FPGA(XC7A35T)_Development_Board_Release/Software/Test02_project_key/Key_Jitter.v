`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:55 02/28/2016 
// Design Name: 
// Module Name:    led_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Key_Jitter(
    input sys_clk,
    input sys_rst_n,
    output led_1,
    input key_1
    );

reg r_led;

//led output register control
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			r_led <= 1'b1;
		end
	else if(!key_1)
		begin
			r_led <= 1'b0;
		end
	else
		begin
			r_led <= 1'b1;
		end
end

assign led_1 = r_led;

endmodule
