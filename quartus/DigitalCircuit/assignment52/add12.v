module add12(EN,CS0,NS0);
	input [3:0]CS0;
	input EN;
	output [3:0]NS0;
	reg [3:0]NS0;
	always @(EN,CS0,NS0)
	if(EN==0) 
	begin
		case(CS0)
			4'b0000 :NS0<=4'b0001;
			4'b0001 :NS0<=4'b0010;
			4'b0010 :NS0<=4'b0011;
			4'b0011 :NS0<=4'b0100;
			4'b0100 :NS0<=4'b0101;
			4'b0101 :NS0<=4'b0110;
			4'b0110 :NS0<=4'b0111;
			4'b0111 :NS0<=4'b1000;
			4'b1000 :NS0<=4'b1001;
			4'b1001 :NS0<=4'b1010;
			4'b1010 :NS0<=4'b1011;
			default :NS0<=4'b0000;
		endcase
	end
endmodule