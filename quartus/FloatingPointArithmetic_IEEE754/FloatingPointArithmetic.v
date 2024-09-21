module FloatingPointArithmetic(
    input_a,
    input_b,
    select,
    clk,
    rst,
    output_z);

input               clk;
input               rst;
input       [31:0]  input_a;
input       [31:0]  input_b;
input       [1:0]   select;
output reg  [31:0]  output_z;

reg         input_a_stb_a;
reg         input_b_stb_a;
reg         input_a_stb_m;
reg         input_b_stb_m;
reg         input_a_stb_d;
reg         input_b_stb_d;
wire [31:0] output_z_a;
wire [31:0] output_z_m;
wire [31:0] output_z_d;
wire        output_z_ack = 1'b1;

parameter   ADDER       = 2'd1,
            MULTIPLIER  = 2'd2,
            DIVIDER     = 2'd3;

always @*
begin
    case(select)
        ADDER:
        begin
            input_a_stb_a = 1'b1;
            input_b_stb_a = 1'b1;
            input_a_stb_m = 1'b0;
            input_b_stb_m = 1'b0;
            input_a_stb_d = 1'b0;
            input_b_stb_d = 1'b0;
            output_z = output_z_a;
        end

        MULTIPLIER:
        begin
            input_a_stb_a = 1'b0;
            input_b_stb_a = 1'b0;
            input_a_stb_m = 1'b1;
            input_b_stb_m = 1'b1;
            input_a_stb_d = 1'b0;
            input_b_stb_d = 1'b0;
            output_z = output_z_m;
        end

        DIVIDER:
        begin
            input_a_stb_a = 1'b0;
            input_b_stb_a = 1'b0;
            input_a_stb_m = 1'b0;
            input_b_stb_m = 1'b0;
            input_a_stb_d = 1'b1;
            input_b_stb_d = 1'b1;
            output_z = output_z_d;
        end

        default:
        begin
            input_a_stb_a = 1'b1;
            input_b_stb_a = 1'b1;
            input_a_stb_m = 1'b0;
            input_b_stb_m = 1'b0;
            input_a_stb_d = 1'b0;
            input_b_stb_d = 1'b0;
            output_z = output_z_a;
        end
    endcase
end

adder u_adder (
    .input_a       (input_a),
    .input_b       (input_b),
    .input_a_stb   (input_a_stb_a),
    .input_b_stb   (input_b_stb_a),
    .output_z_ack  (output_z_ack),
    .clk           (clk),
    .rst           (rst),
    .output_z      (output_z_a)
);

multiplier u_multiplier (
    .input_a       (input_a),
    .input_b       (input_b),
    .input_a_stb   (input_a_stb_m),
    .input_b_stb   (input_b_stb_m),
    .output_z_ack  (output_z_ack),
    .clk           (clk),
    .rst           (rst),
    .output_z      (output_z_m)
);

divider u_divider (
    .input_a       (input_a),
    .input_b       (input_b),
    .input_a_stb   (input_a_stb_d),
    .input_b_stb   (input_b_stb_d),
    .output_z_ack  (output_z_ack),
    .clk           (clk),
    .rst           (rst),
    .output_z      (output_z_d)
);

endmodule
