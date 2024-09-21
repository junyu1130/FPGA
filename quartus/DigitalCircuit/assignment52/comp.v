module comp(CS,A,R);
	input [3:0]CS,A;
	output R;
	reg R;
	always @(CS,A,R)
		case(CS)
			A       :R<=1'b1;
			default :R<=1'b0;
		endcase
endmodule