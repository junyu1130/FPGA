module BCDGray(A3,A2,A1,A0,G3,G2,G1,G0);
	input A3,A2,A1,A0;
	output G3,G2,G1,G0;
	reg G3,G2,G1,G0;
	always @(A3,A2,A1,A0,G3,G2,G1,G0)
		case({A3,A2,A1,A0})
		4'b0000:{G3,G2,G1,G0}<=4'b0000;
		4'b0001:{G3,G2,G1,G0}<=4'b0001;
		4'b0010:{G3,G2,G1,G0}<=4'b0011;
		4'b0011:{G3,G2,G1,G0}<=4'b0010;
		4'b0100:{G3,G2,G1,G0}<=4'b0110;
		4'b0101:{G3,G2,G1,G0}<=4'b0111;
		4'b0110:{G3,G2,G1,G0}<=4'b0101;
		4'b0111:{G3,G2,G1,G0}<=4'b0100;
		4'b1000:{G3,G2,G1,G0}<=4'b1100;
		4'b1001:{G3,G2,G1,G0}<=4'b1101;
		default:{G3,G2,G1,G0}<=4'b1111;
		endcase
endmodule
