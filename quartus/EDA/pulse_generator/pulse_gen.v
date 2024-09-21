module pulse_gen	
#(
	parameter N = 26,
	parameter DUTY = 1000*50,
	parameter PERIOD_MAX = 50*1000*1000	
)
(			//分频器，周期为div_param
	input clk,
	input reset_n,
	input [N-1:0] period_param,
	output reg div_out
);

reg [N-1:0] count;

always @(posedge clk, negedge reset_n)
begin

	if(!reset_n)
	begin
		div_out <= 0;
		count <= 0;
	end
	//分频系数大于高电平脉宽DUTY,小于最大分频系数PERIOD_MAX
	else if(period_param > DUTY && period_param < PERIOD_MAX)
	begin
		count <= count + 1;
		if(count < DUTY)
			div_out <= 1;
		else
		begin
			div_out <= 0;
			if(count >= period_param)
				count <= 0;
		end
	end
	//分频系数大于最大分频系数PERIOD_MAX,最大只能1s
	else if(period_param >= PERIOD_MAX)
	begin
		count <= count + 1;
		if(count < DUTY)
			div_out <= 1;
		else
		begin
			div_out <= 0;
			if(count >= PERIOD_MAX)
				count <= 0;
		end
	end	
	//分频系数比DUTY还要小，输出一直为高
	else
		div_out <= 1;
end

endmodule
