//可控制频率，幅度，相位的三角波发生器
module triangle_wave
(
    input               clk_100M,
	input               rst_n,
	input   [31:0]      freq,
    input   [31:0]      amp,            //3位 8级控制 0-8
    input   [31:0]      phase,          //0-360°

	output  [13:0]      triangle_out
);
//---------------------------------------------------//
wire [9:0]   rom_addr;  //Store the ROM address of the DA data
wire [13:0]  rom_data;  //ROM data of DA 
wire [31:0]  fword;     //频率控制字
wire [9:0]   pword;     //相位控制字

reg [31:0] addr_num;    //相位累加器
//---------------------------------------------------//
assign fword = freq*43;                     //计算频率控制字
assign pword = 1024*phase/360;              //计算相位控制字

assign rom_addr = addr_num[31:22] + pword;  //取相位累加器的高位，叠加上相位控制字
assign triangle_out = (amp*rom_data)>>3;    //幅度控制，8级幅度控制
//---------------------------------------------------//
//三角波ROM表 位宽：14位    深度：1024
rom_triangle_ip rom_triangle_ip_inst
(
    .clka                           (clk_100M                ), 
    .addra                          (rom_addr                ), 
    .douta                          (rom_data                ) 
);
//频率控制字控制访问ROM的地址
always @ (posedge clk_100M or negedge rst_n)
begin
    if(!rst_n)
        addr_num <= 32'd0; 
    else
        addr_num <= addr_num + fword;
end	



endmodule