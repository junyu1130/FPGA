module CNT10_DISP
(
	input CLK_50,
	input [2:0]KEY,//KEY3 -> en 	KEY2 -> load_n	 KEY1 -> rst_n
	input [3:0]SW,//[3:0]SW -> [3:0]DATA
	
	output [7:0]SEL,
	output [7:0]DIG
);

localparam DIV_LEN = 50_000_000;
reg [25:0]div_cnt;
reg clk;

wire en ,load_n, rst_n;
wire cout;
wire [3:0]DATA;

reg [6:0]DIG7S;
reg [3:0]Q1;

assign {en, load_n, rst_n} = KEY;
assign DIG = {~cout, DIG7S};
assign DATA = SW;
assign DOUT = Q1;
assign SEL = 8'b1111_1110;

/*********分频	得到1Hz*********/
always @(posedge CLK_50 or negedge rst_n)
begin
	if(!rst_n)
		clk <= 1'b0;
	else if(div_cnt < DIV_LEN/2)
		clk <= 1'b1;
	else 
		clk <= 1'b0;
end

always @(posedge CLK_50 or negedge rst_n)
begin
	if(!rst_n)
		div_cnt <= 26'd0;
	else if(div_cnt < DIV_LEN - 1'b1)
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
			Q1 <= 4'd0;
	end
end

assign cout = (Q1 == 9);

/************数码管显示****************/
always @* 
begin
	case(Q1)
		4'h0 : DIG7S <= 7'b1000_000;
		4'h1 : DIG7S <= 7'b1111_001;
		4'h2 : DIG7S <= 7'b0100_100;
		4'h3 : DIG7S <= 7'b0110_000;
		4'h4 : DIG7S <= 7'b0011_001;
		4'h5 : DIG7S <= 7'b0010_010;
		4'h6 : DIG7S <= 7'b0000_010;
		4'h7 : DIG7S <= 7'b1111_000;
		4'h8 : DIG7S <= 7'b0000_000;
		4'h9 : DIG7S <= 7'b0010_000;
		4'hA : DIG7S <= 7'b0001_000;
		4'hB : DIG7S <= 7'b0000_011;
		4'hC : DIG7S <= 7'b1000_110;
		4'hD : DIG7S <= 7'b0100_001;
		4'hE : DIG7S <= 7'b0000_110;
		4'hF : DIG7S <= 7'b0001_110;
		default : DIG7S <= 7'b1000_000;
	endcase
end
/***********************************/

endmodule






