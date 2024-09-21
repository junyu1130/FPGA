`timescale 1ns / 1ps

module image_1024//VGA显示图片 1024*768@60Hz
(
    input               clk_65M,    //1344*806*60
    input               rst_n,      //复位信号
    output              VGA_hsync,  //行同步信号
    output              VGA_vsync,  //帧同步信号
    output              VGA_de,     //数据使能
    output              VGA_idck,   //数据时钟
    output reg [23:0]   VGA_out     //R、G、B信号
);
//------------------------------------------------------//
reg [10:0]  hcnt;       //水平计数值
reg [9:0]   vcnt;       //垂直计数值
reg         hs;         //行同步信号
reg         vs;         //帧同步信号

wire [23:0] rgb;        //访问ROM表输出的值
wire [10:0] x;          //x->水平计数值
wire [9:0]  y;          //y->垂直计数值
wire        dis_en;     //显示选择区域
wire [15:0] addr;       //ROM地址
//------------------------------------------------------//
assign x = hcnt - (1024-256)/2;     //居中图像
assign y = vcnt - (768-192)/2;      
assign VGA_hsync = hs;              //行同步信号
assign VGA_vsync = vs;              //帧同步信号
assign VGA_de = dis_en;             //数据使能信号
assign VGA_idck = clk_65M;          //数据时钟
assign dis_en = {x<256 & y<192};    //选择显示区域
assign addr = {y[7:0], x[7:0]};     //ROM地址选择
//------------------------------------------------------//
//ROM
rom_ip rom_ip_inst
(
    .clka   (clk_65M),  // input wire clka
    .addra  (addr   ),  // input wire [15 : 0] addra
    .douta  (rgb    )   // output wire [23 : 0] douta
);
 //水平扫描计数器
always @(posedge clk_65M or negedge rst_n) begin
    if(!rst_n)
        hcnt <= 11'b0;
    else begin
        if(hcnt < 11'd1344)
            hcnt <= hcnt + 1'b1;
        else 
            hcnt <= 11'b0;
    end
end
//垂直扫描计数器
always @(posedge clk_65M or negedge rst_n) begin
    if(!rst_n)
        vcnt <= 10'b0;
    else begin
        if(hcnt == 11'd1024) begin
            if(vcnt < 10'd806)
                vcnt <= vcnt + 1'b1;
            else
                vcnt <= 10'b0;
        end
    end
end
//行同步信号发生
always @(posedge clk_65M or negedge rst_n) begin
    if(!rst_n)
        hs <= 1'b0;
    else begin
        if((hcnt>=1024+24) & (hcnt<1024+24+136))
            hs <= 1'b1;
        else
            hs <= 1'b0;
    end
end
//帧同步信号发生
always @(vcnt or rst_n) begin
    if(!rst_n)
        vs <= 1'b0;
    else begin
        if((vcnt>=768+3) & (vcnt<768+3+6))
            vs <= 1'b1;
        else
            vs <= 1'b0;
    end
end
//显示输出
always @(posedge clk_65M or negedge rst_n) begin
    if(!rst_n)
        VGA_out <= 24'b0;
    else begin
        if(hcnt<11'd1024 && vcnt<10'd768 && dis_en) begin
            VGA_out <= rgb;
        end
        else begin
            VGA_out <= 24'b0;
        end
    end
end

endmodule
