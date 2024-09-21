module color_bar_1920//VGA显示器，彩条发生器 1920*1080@60Hz
(
    input               clk_148_5M, //2200*1125*60=148.5M
    input               rst_n,      //复位信号
    output              VGA_hsync,  //行同步信号
    output              VGA_vsync,  //帧同步信号
    output              VGA_de,     //数据使能
    output              VGA_idck,   //数据时钟
    output reg [23:0]   VGA_out     //R、G、B信号
);
//------------------------------------------------------//
reg [11:0]  hcnt;       //水平计数值
reg [10:0]  vcnt;       //垂直计数值
reg         hs;         //行同步信号
reg         vs;         //帧同步信号

wire [2:0]  rgb;        //选择RGB输出通道
wire [11:0] x;          //x->水平计数值
wire [10:0] y;          //y->垂直计数值
wire        dis_en;     //显示选择区域
//------------------------------------------------------//
assign x = hcnt;                            //当前水平坐标
assign y = vcnt;                            //当前垂直坐标
assign VGA_hsync = hs;                      //行同步信号
assign VGA_vsync = vs;                      //帧同步信号
assign VGA_de = dis_en;                     //数据使能信号
assign VGA_idck = clk_148_5M;               //数据时钟
assign dis_en = {x<12'd1920 & y<11'd1080};  //选择显示区域
assign rgb = x[9:7] ^ y[8:6];               //方格
//------------------------------------------------------//
//水平扫描计数器
always @(posedge clk_148_5M or negedge rst_n) begin
    if(!rst_n)
        hcnt <= 12'b0;
    else begin
        if(hcnt < 12'd2200)
            hcnt <= hcnt + 1'b1;
        else 
            hcnt <= 12'b0;
    end
end
//垂直扫描计数器
always @(posedge clk_148_5M or negedge rst_n) begin
    if(!rst_n)
        vcnt <= 11'b0;
    else begin
        if(hcnt == 12'd1920) begin
            if(vcnt < 11'd1125)
                vcnt <= vcnt + 1'b1;
            else
                vcnt <= 11'b0;
        end
    end
end
//行同步信号发生
always @(posedge clk_148_5M or negedge rst_n) begin
    if(!rst_n)
        hs <= 1'b0;
    else begin
        if((hcnt>=1920+88) & (hcnt<1920+88+44))
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
        if((vcnt>=1080+4) & (vcnt<1080+4+5))
            vs <= 1'b1;
        else
            vs <= 1'b0;
    end
end
//显示输出
always @(posedge clk_148_5M or negedge rst_n) begin
    if(!rst_n)
        VGA_out <= 24'b0;
    else begin
        if(hcnt<12'd1920 && vcnt<11'd1080 && dis_en) begin
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
