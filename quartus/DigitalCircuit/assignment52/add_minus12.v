module add_minus12(CON,CS,NS);
	input [3:0]CS;
	input CON;
	output [3:0]NS;
	reg [3:0]NS;
	always @(CON,CS,NS)
	if(CON==0) 
	begin
		case(CS)
			4'b0000 :NS<=4'b0001;
			4'b0001 :NS<=4'b0010;
			4'b0010 :NS<=4'b0011;
			4'b0011 :NS<=4'b0100;
			4'b0100 :NS<=4'b0101;
			4'b0101 :NS<=4'b0110;
			4'b0110 :NS<=4'b0111;
			4'b0111 :NS<=4'b1000;
			4'b1000 :NS<=4'b1001;
			4'b1001 :NS<=4'b1010;
			4'b1010 :NS<=4'b1011;
			4'b1011 :NS<=4'b0000;
			default :NS<=4'b0000;
		endcase
	end
	else
	begin
		case(CS)
			4'b0000 :NS<=4'b1011;
			4'b0001 :NS<=4'b0000;
			4'b0010 :NS<=4'b0001;
			4'b0011 :NS<=4'b0010;
			4'b0100 :NS<=4'b0011;
			4'b0101 :NS<=4'b0100;
			4'b0110 :NS<=4'b0101;
			4'b0111 :NS<=4'b0110;
			4'b1000 :NS<=4'b0111;
			4'b1001 :NS<=4'b1000;
			4'b1010 :NS<=4'b1001;
			4'b1011 :NS<=4'b1010;
			default :NS<=4'b0000;
		endcase
	end
endmodule