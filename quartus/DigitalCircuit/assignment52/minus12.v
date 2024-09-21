module minus12(EN,CS1,NS1);
	input [3:0]CS1;
	input EN;
	output [3:0]NS1;
	reg [3:0]NS1;
	always @(EN,CS1,NS1)
	if(EN==1)
	begin
		case(CS1)
			4'b0001 :NS1<=4'b0000;
			4'b0010 :NS1<=4'b0001;
			4'b0011 :NS1<=4'b0010;
			4'b0100 :NS1<=4'b0011;
			4'b0101 :NS1<=4'b0100;
			4'b0110 :NS1<=4'b0101;
			4'b0111 :NS1<=4'b0110;
			4'b1000 :NS1<=4'b0111;
			4'b1001 :NS1<=4'b1000;
			4'b1010 :NS1<=4'b1001;
			4'b1011 :NS1<=4'b1010;
			default :NS1<=4'b0000;
		endcase
	end
endmodule