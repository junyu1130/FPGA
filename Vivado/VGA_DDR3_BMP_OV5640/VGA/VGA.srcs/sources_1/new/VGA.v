`timescale 1ns / 1ps

module VGA
(
    input              clk,        //系统时钟信号
    input              rst_n,      //复位信号
    input              key,        //按键
    output     [1:0]   led,
    output reg         VGA_hsync,  //行同步信号
    output reg         VGA_vsync,  //帧同步信号
    output reg         VGA_de,     //数据使能
    output reg         VGA_idck,   //数据时钟
    output reg [23:0]  VGA_out     //R、G、B信号
);
//------------------------------------------------------//
wire clk_25M;//800*525*60
wire clk_65M;//1344*806*60

wire        VGA_hsync_640_colorbar;
wire        VGA_vsync_640_colorbar;
wire        VGA_de_640_colorbar;   
wire        VGA_idck_640_colorbar; 
wire [23:0] VGA_out_640_colorbar;

wire        VGA_hsync_1024_colorbar;
wire        VGA_vsync_1024_colorbar;
wire        VGA_de_1024_colorbar;   
wire        VGA_idck_1024_colorbar; 
wire [23:0] VGA_out_1024_colorbar;

wire        VGA_hsync_1024_bmp;
wire        VGA_vsync_1024_bmp;
wire        VGA_de_1024_bmp;   
wire        VGA_idck_1024_bmp;  
wire [23:0] VGA_out_1024_bmp;

wire        VGA_hsync_1024_word;
wire        VGA_vsync_1024_word;
wire        VGA_de_1024_word;   
wire        VGA_idck_1024_word;  
wire [23:0] VGA_out_1024_word; 

assign VGA_idck_1024_word = VGA_idck_1024_colorbar;
//------------------------------------------------------//
//按键控制显示 key0:640 colorbar key1:1024 colorbar key2:1024 bmp key3:1024 word
reg [1:0]  key_in;
assign led = ~key_in;
always@(posedge clk or negedge rst_n) 
begin
    if(!rst_n)
        key_in <= 0;
    else if(button_negedge)
        key_in <= key_in + 1;  
end

always @(*)begin
    case (key_in)
        0 : begin
            VGA_hsync   <= VGA_hsync_640_colorbar;
            VGA_vsync   <= VGA_vsync_640_colorbar;
            VGA_de      <= VGA_de_640_colorbar;   
            VGA_idck    <= VGA_idck_640_colorbar; 
            VGA_out     <= VGA_out_640_colorbar;
        end
        1 : begin
            VGA_hsync   <= VGA_hsync_1024_colorbar;
            VGA_vsync   <= VGA_vsync_1024_colorbar;
            VGA_de      <= VGA_de_1024_colorbar;   
            VGA_idck    <= VGA_idck_1024_colorbar; 
            VGA_out     <= VGA_out_1024_colorbar; 
        end
        2 : begin
            VGA_hsync   <= VGA_hsync_1024_bmp;
            VGA_vsync   <= VGA_vsync_1024_bmp;
            VGA_de      <= VGA_de_1024_bmp;   
            VGA_idck    <= VGA_idck_1024_bmp; 
            VGA_out     <= VGA_out_1024_bmp;
        end
        3 : begin
            VGA_hsync   <= VGA_hsync_1024_word;
            VGA_vsync   <= VGA_vsync_1024_word;
            VGA_de      <= VGA_de_1024_word;   
            VGA_idck    <= VGA_idck_1024_word; 
            VGA_out     <= VGA_out_1024_word;
        end 
        default: begin
            VGA_hsync   <= VGA_hsync_1024_colorbar;
            VGA_vsync   <= VGA_vsync_1024_colorbar;
            VGA_de      <= VGA_de_1024_colorbar;   
            VGA_idck    <= VGA_idck_1024_colorbar; 
            VGA_out     <= VGA_out_1024_colorbar; 
        end
    endcase
end
/*************************************************************************
Only one pulse is generated when a key is pressed to meet requirements
****************************************************************************/
wire        button_negedge; //Key falling edge
ax_debounce ax_debounce_m0
(
    .clk             (clk           ),
    .rst             (~rst_n        ),
    .button_in       (key           ),
    .button_posedge  (              ),
    .button_negedge  (button_negedge),
    .button_out      (              )
);
//PLL产生多路时钟
clk_wiz_0 clk_wiz_0_inst
(
    .clk_out1   (clk_25M),     
    .clk_out2   (clk_65M),           
    .clk_in1    (clk    )
);
//彩条发生器 640*480@60Hz
color_bar_640  color_bar_640_m0 
(
    .clk_25M    (clk_25M  ),
    .rst_n      (rst_n    ),

    .VGA_hsync  (VGA_hsync_640_colorbar ),
    .VGA_vsync  (VGA_vsync_640_colorbar ),
    .VGA_de     (VGA_de_640_colorbar    ),
    .VGA_idck   (VGA_idck_640_colorbar  ),
    .VGA_out    (VGA_out_640_colorbar   )
);
//彩条发生器 1024*768@60Hz
color_bar_1024  color_bar_1024_m0 
(
    .clk_65M    (clk_65M  ),
    .rst_n      (rst_n    ),

    .VGA_hsync  (VGA_hsync_1024_colorbar),
    .VGA_vsync  (VGA_vsync_1024_colorbar),
    .VGA_de     (VGA_de_1024_colorbar   ),
    .VGA_idck   (VGA_idck_1024_colorbar ),
    .VGA_out    (VGA_out_1024_colorbar  )
);
//图片显示 1024*768@60Hz
image_1024  image_1024_m0 
(
    .clk_65M    (clk_65M  ),
    .rst_n      (rst_n    ),

    .VGA_hsync  (VGA_hsync_1024_bmp),
    .VGA_vsync  (VGA_vsync_1024_bmp),
    .VGA_de     (VGA_de_1024_bmp   ),
    .VGA_idck   (VGA_idck_1024_bmp ),
    .VGA_out    (VGA_out_1024_bmp  )
);
//文字显示 1024*768@60Hz
osd_display  osd_display_m0
(
    .rst_n                          (rst_n                  ),
    .pclk                           (clk_65M                ),
    .i_hs                           (VGA_hsync_1024_colorbar),
    .i_vs                           (VGA_vsync_1024_colorbar),
    .i_de                           (VGA_de_1024_colorbar   ),
    .i_data                         (VGA_out_1024_colorbar  ),
    .o_hs                           (VGA_hsync_1024_word    ),
    .o_vs                           (VGA_vsync_1024_word    ),
    .o_de                           (VGA_de_1024_word       ),
    .o_data                         (VGA_out_1024_word      )
);

endmodule
