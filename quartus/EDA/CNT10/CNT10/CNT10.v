module CNT10
(
	input CLK,
	input RSTN,
	input EN,
	input LOAD,

	input [3:0]DATA,
	output [3:0]DOUT,
	output reg COUT
);

reg [3:0]Q1;

assign DOUT = Q1;

always @(posedge CLK or negedge RSTN)
begin
	if(!RSTN)	
		Q1 <= 0;

	else if(EN)
		begin
			if(!LOAD)//置数 0有效
				Q1 <= DATA;
			else if(Q1 < 9)
				Q1 <= Q1+1;
			else
				Q1 <= 4'b0000;
		end
end

always @(Q1)
begin
	if(Q1 == 4'h9)
		COUT = 1'b1;//为什么非阻塞赋值会延迟1个时钟置1？
						//如果条件判断式中含有本模块的非阻塞赋值的reg变量，
						//那么在该条件分支下的非阻塞赋值语句会延后一个周期完成
						//（相对于条件判断式中的变量的赋值完成）
	else
		COUT = 1'b0;
end

endmodule 




