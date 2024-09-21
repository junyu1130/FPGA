`timescale 1ns / 1ps

module color_bar_640//VGA��ʾ�������������� 640*480@60Hz
(
    input               clk_25M,    //800*525*60
    input               rst_n,      //��λ�ź�
    output              VGA_hsync,  //��ͬ���ź�
    output              VGA_vsync,  //֡ͬ���ź�
    output              VGA_de,     //����ʹ��
    output              VGA_idck,   //����ʱ��
    output reg [23:0]   VGA_out     //R��G��B�ź�
);
//------------------------------------------------------//
reg [9:0]   hcnt;       //ˮƽ����ֵ
reg [9:0]   vcnt;       //��ֱ����ֵ
reg         hs;         //��ͬ���ź�
reg         vs;         //֡ͬ���ź�

wire [2:0]  rgb;        //ѡ��RGB���ͨ��
wire [9:0]  x;          //x->ˮƽ����ֵ
wire [9:0]  y;          //y->��ֱ����ֵ
wire        dis_en;     //��ʾѡ������
//------------------------------------------------------//
assign x = hcnt;                        //��ǰˮƽ����
assign y = vcnt;                        //��ǰ��ֱ����
assign VGA_hsync = hs;                  //��ͬ���ź�
assign VGA_vsync = vs;                  //֡ͬ���ź�
assign VGA_de = dis_en;                 //����ʹ���ź�
assign VGA_idck = clk_25M;              //����ʱ��
assign dis_en = {x<10'd640 & y<10'd480};//ѡ����ʾ����
assign rgb = x[8:6];                    //����
//------------------------------------------------------//
 //ˮƽɨ�������
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
//��ֱɨ�������
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
//��ͬ���źŷ���
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
//֡ͬ���źŷ���
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
//��ʾ���
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
