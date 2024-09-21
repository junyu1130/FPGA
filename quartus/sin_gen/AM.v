module AM_Sine
(
input clk,
input [15:0]Usine_1k,
input [15:0]Sine_Range,
input [15:0] M,                              //调制度0.1~1,设为0~65536，最后除以65536 用位移来操作2^16次方
output [15:0]AM_OUT,
output [15:0]AM_Tiaozhi,
output reg [15:0]Reg_Zaibo
);
wire [15:0]Sine_sign=Sine_Range+16'h8000;//有符号数

wire [15:0]Zaibo;

assign Zaibo=Sine_Range>>1;

reg [15:0]Reg_Zaibo=0;
always @(clk)
begin
        if(Sine_Range[15])begin
        Reg_Zaibo=Zaibo;   
        end
        else begin
        Reg_Zaibo=32768-Zaibo; //最高位为0时是正数
        end
end

wire [15:0]Sine_1k;
assign Sine_1k=Usine_1k>>1;
wire [31:0]Ma_Tiaozhi;
wire [15:0]TiaoZhi;
wire [15:0]M_1=65535-M;
wire [15:0]constant=32768;
wire [31:0]result1;
wire [31:0]result2;
wire [31:0]RMa_Tiaozhi;
assign Ma_Tiaozhi=result1+result2;
assign RMa_Tiaozhi=Ma_Tiaozhi>>16;
//assign TiaoZhi[15:0]=RMa_Tiaozhi[15:0];
assign TiaoZhi[15:0]=Ma_Tiaozhi[31:16];//加一个偏移



assign AM_Tiaozhi=TiaoZhi;


wire [31:0]AM_OUT32;
wire [31:0]AM_OUT16;
assign AM_OUT16=AM_OUT32>>16;
wire [15:0]UAM_OUT;
assign {UAM_OUT[15:0]}=Sine_Range[15]+AM_OUT16[14:0];
//assign {UAM_OUT[15:0]}=AM_OUT32[31:16];
//assign AM_OUT=UAM_OUT+16'h8000;
//assign AM_OUT=UAM_OUT;



//always @(clk)begin
//RMa_Tiaozhi=Ma_Tiaozhi>>16;
//end
Mult16_16_clk        Mult1 (
        .clock ( clk),
        .dataa ( Usine_1k),       //Usine_1k--->Sine_1k
        .datab ( M),
        .result ( result1 )
        );
Mult16_16_clk        Mult2 (
        .clock ( clk ),
        .dataa ( constant),
        .datab ( M_1 ),
        .result ( result12)
        );
Mult16_16_clk        Mult3 (
        .clock ( clk ),
        .dataa ( Reg_Zaibo),  //Zaibo->Reg_Zaibo
        .datab ( TiaoZhi),//Tiaozhi->Usine_1k
        .result ( AM_OUT32)
        );
Mult_Sign        Mult4 (
        .clock ( clk ),
        .dataa ( test ),
        .datab ( Sine_sign ),   
        .result ( result_sig )
        );
wire [16:0]Tiaozhi_17=RMa_Tiaozhi[16:0];  
//assign Tiaozhi_17=RMa_Tiaozhi[;        
wire [32:0]result_sig;
wire [32:0]result_sign;
assign result_sign=result_sig-33'h100000000;
assign {AM_OUT[15:0]}=result_sign[32:17];

wire [31:0]tiao=((Usine_1k*M)+(16'h8000*M_1))>>16;
wire [16:0]test=tiao[16:0];

endmodule