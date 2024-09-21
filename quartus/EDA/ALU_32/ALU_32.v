module ALU_32
(
	input [31:0] data_a_in,
	input [31:0] data_b_in,
	input carry_in,
	input [3:0] op_code,
	output reg carry_out,
	output reg [31:0] result_out
);

parameter plus=0, alusub=1, andOp=2, orOp=3, xorOp=4, notOp_a=5, notOp_b=6;

always @(data_a_in, data_b_in, carry_in, op_code)
begin
	case(op_code)
		plus	 	: {carry_out,result_out} <= data_a_in + data_b_in + carry_in;
		alusub 	: {carry_out,result_out} <= data_a_in - data_b_in - carry_in;
		andOp	 	: result_out <= data_a_in & data_b_in;
		orOp		: result_out <= data_a_in | data_b_in;
		xorOp		: result_out <= data_a_in ^ data_b_in;
		notOp_a	: result_out <= ~data_a_in;
		notOp_b	: result_out <= ~data_b_in;
		default 	: result_out <= data_a_in;
	endcase		
end

endmodule
