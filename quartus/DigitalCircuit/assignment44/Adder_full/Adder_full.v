module  Adder_full(A,B,CI,S,CO);
	input A,B,CI;
	output S,CO;
	reg S,CO;
	always @(A,B,CI,S,CO)
		case({A,B,CI})
		3'b000:{CO,S}<=2'b00;
		3'b001:{CO,S}<=2'b01;
		3'b010:{CO,S}<=2'b01;
		3'b011:{CO,S}<=2'b10;
		3'b100:{CO,S}<=2'b01;
		3'b101:{CO,S}<=2'b10;
		3'b110:{CO,S}<=2'b10;
		3'b111:{CO,S}<=2'b11;
		default:{CO,S}<=2'b00;
		endcase
endmodule