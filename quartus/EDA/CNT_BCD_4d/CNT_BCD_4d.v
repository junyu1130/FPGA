module bcd_4d_cnt(		//4位十进制计数器
	input clk,
	input reset_n,
	input en,
	input load,
	input [15:0] d,
	output reg [15:0] bcd
);
	
	always @ (posedge clk or negedge reset_n)
		if(!reset_n)
			bcd <= 0;
		else if(load)
			bcd <= d;
		else if(en)
			if(bcd[3:0] < 9) bcd[3:0] <= bcd[3:0] + 1'b1;
			else if(bcd[7:4] < 9) begin bcd[7:4]<=bcd[7:4] + 1'b1;bcd[3:0]<=0; end
			else if(bcd[11:8] < 9) begin bcd[11:8]<=bcd[11:8] + 1'b1;bcd[7:0]<=0; end
			else if(bcd[15:12] < 9) begin bcd[15:12]<=bcd[15:12] + 1'b1;bcd[11:0]<=0; end
			else bcd <= 0;

			
endmodule 