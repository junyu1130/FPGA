module ask_wave
(
	input clk,
	input rst_n,
	input [7:0]sin_out,
	output [7:0]ASK_out

);

reg [15:0] counter;
reg Data_fb;
reg [7:0] data;

//分频产生二进制序列
always @(posedge clk or negedge rst_n)
	if(!rst_n) 
	begin
		counter <= 0;
		Data_fb <= 0;
	end
	else
		if(counter >= 14400)
		begin
			counter <= 0;
			Data_fb <= ~Data_fb;
		end
		else
			counter <= counter + 1'b1;

//ASK调制
always @(posedge clk or negedge rst_n)
	if(!rst_n) data <= 0;
	else
		case(Data_fb)
			1'b1: data <= sin_out;
			1'b0: data <= {1'b1,7'b0};
			default: data <= sin_out;
		endcase
		
assign ASK_out = data;

endmodule 
