`timescale 1ns / 1ps

module color_bar_640//VGA显示器，彩条发生器 640*480@60Hz
(
    input               clk_25M,    //800*525*60
    input               rst_n,      //复位信号
    output              VGA_hsync,  //行同步信号
    output              VGA_vsync,  //帧同步信号
    output              VGA_de,     //数据使能
    output              VGA_idck,   //数据时钟
    output reg [23:0]   VGA_out     //R、G、B信号
);
//------------------------------------------------------//
reg [9:0]   hcnt;       //水平计数值
reg [9:0]   vcnt;       //垂直计数值
reg         hs;         //行同步信号
reg         vs;         //帧同步信号

wire [2:0]  rgb;        //选择RGB输出通道
wire [9:0]  x;          //x->水平计数值
wire [9:0]  y;          //y->垂直计数值
wire        dis_en;     //显示选择区域
//------------------------------------------------------//
assign x = hcnt;                        //当前水平坐标
assign y = vcnt;                        //当前垂直坐标
assign VGA_hsync = hs;                  //行同步信号
assign VGA_vsync = vs;                  //帧同步信号
assign VGA_de = dis_en;                 //数据使能信号
assign VGA_idck = clk_25M;              //数据时钟
assign dis_en = {x<10'd640 & y<10'd480};//选择显示区域
assign rgb = x[8:6];                    //竖屏
//------------------------------------------------------//
 //水平扫描计数器
always @(posedge clk_25M or negedge rst_n) begin
    if(!rst_n)
        hcnt <= 10'b0;
    else begin
        if(hcnt < 10'd800)
            hcnt <= hcnt + 1'b1;
        else 
            hcnt <= 10'b0;
    end
end
//垂直扫描计数器
always @(posedge clk_25M or negedge rst_n) begin
    if(!rst_n)
        vcnt <= 10'b0;
    else begin
        if(hcnt == 10'd640 + 10'd8) begin
            if(vcnt < 10'd525)
                vcnt <= vcnt + 1'b1;
            else
                vcnt <= 10'b0;
        end
    end
end
//行同步信号发生
always @(posedge clk_25M or negedge rst_n) begin
    if(!rst_n)
        hs <= 1'b0;
    else begin
        if((hcnt>=640+8+8) & (hcnt<640+8+8+96))
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
        if((vcnt>=480+8+2) & (vcnt<480+8+2+2))
            vs <= 1'b1;
        else
            vs <= 1'b0;
    end
end
//显示输出
always @(posedge clk_25M or negedge rst_n) begin
    if(!rst_n)
        VGA_out <= 24'b0;
    else begin
        if(hcnt<10'd640 && vcnt<10'd480 && dis_en) begin
            VGA_out[23:16] <= rgb[0]?8'hff:0;
            VGA_out[15: 8] <= rgb[1]?8'hff:0;
            VGA_out[ 7: 0] <= rgb[2]?8'hff:0;
        end
        else begin
            VGA_out <= 24'b0;
        end
    end
end

endmodule
