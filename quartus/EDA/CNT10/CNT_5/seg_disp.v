module seg_disp
(
	input clk,
	input rst_n,
	input [31:0]Q1,
	
	output reg [7:0]SEL,
	output reg [7:0]DIG
);

reg [1:0]cnt_sel;
reg [3:0]cnt_disp;

wire [3:0]q0;
wire [3:0]q1;
wire [3:0]q2;

assign q0 = Q1[23:20];
assign q1 = Q1[27:24];
assign q2 = Q1[31:28];

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt_sel <= 2'b0;
	else if(cnt_sel < 2'd2)
		cnt_sel <= cnt_sel + 1'b1;
	else
		cnt_sel <= 2'b0;
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		SEL <= 8'b1111_1111;
	else
		begin
			case(cnt_sel)
				2'd0 : 
					begin
						SEL <= 8'b1111_1011;
						cnt_disp <= q0;
					end
				2'd1 :
					begin
						SEL <= 8'b1111_1101;
						cnt_disp <= q1;
					end
				2'd2 :
					begin
						SEL <= 8'b1111_1110;
						cnt_disp <= q2;
					end
				default : 
					begin
						SEL <= 8'b1111_1111;
						cnt_disp <= 4'hFF;
					end
			endcase
		end
end

always @*
begin
	case(cnt_disp)
		4'h0 : DIG <= 7'b1000_000;
		4'h1 : DIG <= 7'b1111_001;
		4'h2 : DIG <= 7'b0100_100;
		4'h3 : DIG <= 7'b0110_000;
		4'h4 : DIG <= 7'b0011_001;
		4'h5 : DIG <= 7'b0010_010;
		4'h6 : DIG <= 7'b0000_010;
		4'h7 : DIG <= 7'b1111_000;
		4'h8 : DIG <= 7'b0000_000;
		4'h9 : DIG <= 7'b0010_000;
		4'hA : DIG <= 7'b0001_000;
		4'hB : DIG <= 7'b0000_011;
		4'hC : DIG <= 7'b1000_110;
		4'hD : DIG <= 7'b0100_001;
		4'hE : DIG <= 7'b0000_110;
		4'hF : DIG <= 7'b0001_110;
		default : DIG <= 7'b1000_000;
	endcase
end

endmodule



