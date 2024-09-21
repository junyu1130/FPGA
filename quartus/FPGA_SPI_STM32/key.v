`timescale 1ns / 1ps

module key
(
	input clk, 
	input [3:0]key_in,
	output reg [3:0]flag_key//flag=1代表被按下了
);

wire rst_n = 1'b1;

//寄存器定义
reg [19:0]count;
reg [3:0]key_scan; //按键扫描值 KEY

//==============================================
// 采样按键值， 20ms 扫描一次,采样频率小于按键毛刺频率，相当于滤除掉了高频毛刺信号。
//==============================================

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n) //复位信号低有效
		count <= 20'd0; //计数器清 0
	else
		begin
			if(count == 20'd999_999) //20ms 扫描一次按键,20ms 计数(50M/50-1=999_999)
				begin
					count <= 20'b0; //计数器计到 20ms，计数器清零
					key_scan <= key_in; //采样按键输入电平
				end
			else
				count <= count + 20'b1; //计数器加 1
		end
end

//====================================================
// 按键信号锁存一个时钟节拍
//====================================================
reg [3:0]key_scan_r;
always @(posedge clk)
	begin
		key_scan_r <= key_scan;
		flag_key = key_scan_r[3:0] & (~key_scan[3:0]); //当检测到按键有下降沿变化时，代表该按键被按下，按键有效
	end

endmodule





