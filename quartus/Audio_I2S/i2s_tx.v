//I2S master tx
module i2s_tx(
    input clk,
    input [15:0] audio_ldata,
    input [15:0] audio_rdata,

    output audio_bclk,
    output audio_lrclk,
    output reg audio_sdata
);

//16bit数据 BCLK=16*2*LRCLK(双声道)
//如果音频数据的采样率是48KHz，那么这里的clk一般等于48KHz*256=12.288MHz
//那么bclk=48k*16*2=clk/8 lrclk=48k=clk/256
reg [2:0] bclk_cnt = 0;
reg [7:0] lrclk_cnt = 0;
reg bclk = 0;
reg lrclk = 0;
assign audio_bclk = bclk;
assign audio_lrclk = lrclk;
//8分频，产生BCLK
always@(posedge clk) begin
    bclk_cnt <= bclk_cnt + 1;
    if (bclk_cnt == 3) bclk <= 1'b1;
    if (bclk_cnt == 7) bclk <= 1'b0;
end
//32分频，产生LRCLK
always@(posedge clk) begin
    lrclk_cnt <= lrclk_cnt + 1;
    if (lrclk_cnt == 127) lrclk <= 1'b1;
    if (lrclk_cnt == 255) lrclk <= 1'b0;
end

//BCLK下降沿并转串发送，MSB延迟于LRCLK边沿一个时钟
always @(negedge bclk) begin
    if (lrclk_cnt == 0) begin
        audio_sdata = audio_rdata[0];
    end else if (lrclk_cnt == 128) begin
        audio_sdata = audio_ldata[0];
    end else begin
        audio_sdata <= lrclk ? audio_rdata[32-(lrclk_cnt>>3)] : audio_ldata[16-(lrclk_cnt>>3)];
    end	
end

endmodule
