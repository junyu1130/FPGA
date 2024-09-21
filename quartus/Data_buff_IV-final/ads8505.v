module ads8505
(
	// global clock   200M 
	clk,
	rst_n,
	adc_rc
);
input clk, rst_n; // 时钟和复位
output adc_rc;
// ads8505 时序参数
`define		T_START_CONV		16'd10		//开始转换     max：1750ns   min:40ns
`define		T_WORK				16'd1000	//工作状态        min:4us      50M  20ns 0.02us
reg adc_rc;
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
