// module SREG//状态译码器
// (
//     input      [5:0]    c_state,
//     output reg [5:0]    n_state
// );

// always @(c_state)
// begin
//     if(c_state==6'd47)
//         n_state = 1'b0;
//     else
//         n_state = c_state + 1'b1;
// end

// endmodule

module SREG//状态译码器
(
    input      [5:0]    c_state,
    output reg [5:0]    n_state
);

always @(c_state)
begin
    case (c_state)
        6'd 0   :   n_state = 6'd 1;
        6'd 1   :   n_state = 6'd 2;
        6'd 2   :   n_state = 6'd 3;
        6'd 3   :   n_state = 6'd 4;
        6'd 4   :   n_state = 6'd 5;
        6'd 5   :   n_state = 6'd 6;
        6'd 6   :   n_state = 6'd 7;
        6'd 7   :   n_state = 6'd 8;
        6'd 8   :   n_state = 6'd 9;
        6'd 9   :   n_state = 6'd10;
        6'd10   :   n_state = 6'd11;
        6'd11   :   n_state = 6'd12;
        6'd12   :   n_state = 6'd13;
        6'd13   :   n_state = 6'd14;
        6'd14   :   n_state = 6'd15;
        6'd15   :   n_state = 6'd16; 
        6'd16   :   n_state = 6'd17;
        6'd17   :   n_state = 6'd18;
        6'd18   :   n_state = 6'd19;
        6'd19   :   n_state = 6'd20;
        6'd20   :   n_state = 6'd21;
        6'd21   :   n_state = 6'd22;
        6'd22   :   n_state = 6'd23;
        6'd23   :   n_state = 6'd24;
        6'd24   :   n_state = 6'd25;
        6'd25   :   n_state = 6'd26;
        6'd26   :   n_state = 6'd27;
        6'd27   :   n_state = 6'd28;
        6'd28   :   n_state = 6'd29;
        6'd29   :   n_state = 6'd30;
        6'd30   :   n_state = 6'd31;
        6'd31   :   n_state = 6'd32;
        6'd32   :   n_state = 6'd33;
        6'd33   :   n_state = 6'd34;
        6'd34   :   n_state = 6'd35;
        6'd35   :   n_state = 6'd36;
        6'd36   :   n_state = 6'd37;
        6'd37   :   n_state = 6'd38;
        6'd38   :   n_state = 6'd39;
        6'd39   :   n_state = 6'd40;
        6'd40   :   n_state = 6'd41;
        6'd41   :   n_state = 6'd42;
        6'd42   :   n_state = 6'd43;
        6'd43   :   n_state = 6'd44;
        6'd44   :   n_state = 6'd45;
        6'd45   :   n_state = 6'd46;
        6'd46   :   n_state = 6'd47;
        6'd47   :   n_state = 6'd 0;
        default :   n_state = 6'd 0;
    endcase
end

endmodule