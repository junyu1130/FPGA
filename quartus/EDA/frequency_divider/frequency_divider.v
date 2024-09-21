module frequency_divider
#(
	parameter N = 17 
)
(			
	input clk,
	input reset_n,
	input [N-1:0]period_param,//period_param为预置的分频系数
	input [N-1:0]duty_param,//duty_param为预置的高电平系数
	output reg div_out
);

reg [16:0]cnt;

always @(posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		cnt <= 17'd0;
		div_out <= 1'b1;
	end
	else if(cnt == duty_param-1)
	begin
		div_out <= ~div_out;
		cnt <= cnt + 1'd1;
	end
	else if(cnt == period_param-1)
	begin
		div_out <= ~div_out;
		cnt <= 17'd0;
	end
	else
	begin
		cnt <= cnt + 1'd1;
	end
end

endmodule

