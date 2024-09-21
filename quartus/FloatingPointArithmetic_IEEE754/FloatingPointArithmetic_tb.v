`timescale 1 ns / 100 ps

module FloatingPointArithmetic_tb();

// test vector input registers
reg     clk;
reg     rst;
reg     [31:0] input_a;
reg     [31:0] input_b;
reg     [1:0] select;
// wires                                               
wire    [31:0] output_z;

FloatingPointArithmetic u1(
    .input_a    (input_a),
    .input_b    (input_b),
    .select     (select),
    .clk        (clk),
    .rst        (rst),
    .output_z   (output_z)
);


initial begin
    clk = 1'b0;
    rst = 1'b1;
	select = 2'd0;
	#100 
	rst = 1'b0;
	 
	select = 2'd1;
    input_a = 32'b01000100000000100010000101001000;//520.520
	input_b = 32'b01000001010100100011110101110001;//13.14
	 
	#1000
	input_a = 32'b01000100000000100010000101001000;//520.520
	input_b = 32'b11000001010100100011110101110001;//-13.14
	 
	#2000
	select = 2'd2;
    input_a = 32'b01000100000000100010000101001000;//520.520
	input_b = 32'b01000001010100100011110101110001;//13.14
	 
	#2000
 	select = 2'd3;
    input_a = 32'b01000100000000100010000101001000;//520.520
	input_b = 32'b01000001010100100011110101110001;//13.14
end

always #10 begin//50M系统时钟
    clk <= ~clk;
end

endmodule
