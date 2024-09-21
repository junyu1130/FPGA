module CNT10
(
	input CLK_50M,
	input [2:0]KEY,
	
	input [3:0]SW,
	output [3:0]DOUT,
	output COUT
);

localparam DIV_LEN = 50_000_000;
reg clk;
reg [25:0]div_cnt;

wire en, load_n, rst_n;
wire [3:0]DATA;
wire cout;

reg [3:0]Q1;

assign en = KEY[0];		//KEY2 -> en 	KEY3 -> load_n	 KEY4 -> rst_n
assign load_n = KEY[1];
assign rst_n = KEY[2];
assign DATA = SW;			//[3:0]SW -> [3:0]DATA
assign DOUT = Q1;

/*********分频	得到1Hz*********/
always @(posedge CLK_50M or negedge rst_n)
begin
	if(!rst_n)
		clk <= 1'b0;
	else if(div_cnt < DIV_LEN/2)
		clk <= 1'b1;
	else 
		clk <= 1'b0;
end

always @(posedge CLK_50M or negedge rst_n)
begin
	if(!rst_n)
		div_cnt <= 1'b0;
	else if(div_cnt < DIV_LEN)
		div_cnt <= div_cnt + 1'b1;
	else 
		div_cnt <= 26'd0;
end
/*****************************/

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Q1 <= 4'd0;
	else if(en)
	begin 
		if(!load_n)
			Q1 <= DATA;
		else if(Q1 < 4'h9)
			Q1 <= Q1 + 1'b1;
		else 
			Q1 <= 4'b0;
	end
end

assign cout = (Q1 == 9);

endmodule

