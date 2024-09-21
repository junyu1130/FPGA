module sin_wave(
	input clk,
	input rst_n,
	input [31:0]ftw,al,
	output [7:0]sin_out
);

wire [7:0]sin_mid;
wire [15:0]sin_mid1;
wire [7:0]addr;
reg [7:0]depth_con;
//-------载波信号--------//
DDS u_DDS(
	.clk  	(clk),
	.rst_n	(rst_n),
	.fword	(ftw),
	.addr		(addr)
);


//-------正弦信号--------//
ROM_sin rom_sin(
	.address	(addr),
	.clock	(clk),
	.q			(sin_mid)
	);
    always@(*)         //设置幅度调制
    begin
       case (al)
            //0:  depth_con = 0 ;       //幅度调制为0，8位系数对应值
            1:  depth_con = 26;       //幅度调制为0.1，8位系数对应值
            2:  depth_con = 51;       //幅度调制为0.2，8位系数对应值
            3:  depth_con = 77;       //幅度调制为0.3，8位系数对应值
            4:  depth_con = 102;       //幅度调制为0.4，8位系数对应值
            5:  depth_con = 128;       //幅度调制为0.5，8位系数对应值
            6:  depth_con = 154;       //幅度调制为0.6，8位系数对应值
            7:  depth_con = 179;       //幅度调制为0.7，8位系数对应值  
            8:  depth_con = 204;       //幅度调制为0.8，8位系数对应值               
            9:  depth_con = 230;       //幅度调制为0.9.，8位系数对应值
            10:  depth_con = 255;       //幅度调制为1，8位系数对应值
				default :depth_con = 255;
       endcase
    end
	 
	 assign sin_mid1=sin_mid*depth_con;
	assign sin_out=sin_mid1>>8;
	endmodule
	