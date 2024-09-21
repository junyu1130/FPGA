//I2S master tx
module i2s_tx(
    input clk,
    input rst_n,
    input [15:0] audio_ldata,
    input [15:0] audio_rdata,

    output reg audio_bclk,
    output reg audio_lrclk,
    output reg audio_sdata
);

//产生BCLK
//16bit数据 BCLK=16*2*LRCLK(双声道)
//如果音频数据的采样率是48KHz，那么这里的clk一般等于48KHz*256=12.288MHz
//那么bclk=48k*16*2=clk/8 lrclk=bclk/32=48k
reg [2:0] bclk_cnt = 0;
//8分频
always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bclk_cnt <= 3'b0;
        audio_bclk <= 1'b0;
    end
    else begin
        bclk_cnt <= bclk_cnt + 1;
        if (bclk_cnt == 3)    audio_bclk <= 1'b1;
        if (bclk_cnt == 7)    audio_bclk <= 1'b0;
    end
end

//BCLK触发I2S发送时序
wire sclk = audio_bclk;

reg [31:0]    bit_cnt;
reg [31:0]    left;
reg [31:0]    right;
//模32计数器
always @(negedge sclk or negedge rst_n) begin
	if (!rst_n)
		bit_cnt <= 0;
	else if (bit_cnt >= 31)
		bit_cnt <= 0;
	else
		bit_cnt <= bit_cnt + 1;
end

//16位扩展为32位，后补0
always @(negedge sclk) begin
	if (bit_cnt == 31 && audio_lrclk) begin
		left <= {audio_ldata, 16'b0};
		right <= {audio_rdata,16'b0};
	end
end

// left/right "clock" generation - 0 = left, 1 = right
always @(negedge sclk or negedge rst_n) begin
	if (!rst_n)
		audio_lrclk <= 1;
	else if (bit_cnt == 31)
		audio_lrclk <= ~audio_lrclk;
end

//串转并发送
always @(negedge sclk) begin
	audio_sdata <= audio_lrclk ? right[31 - bit_cnt] : left[31 - bit_cnt];
end

endmodule
