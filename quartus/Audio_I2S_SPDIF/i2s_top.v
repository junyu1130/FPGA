module i2s_top(
    input clk,
    input rst_n,

    output audio_lrclk,
    output audio_bclk,
    output audio_sdata,

    input [15:0] audio_ldata_in,
    input [15:0] audio_rdata_in,

    output [15:0] audio_ldata_out,
    output [15:0] audio_rdata_out
);

i2s_tx i2s_tx_inst
(
    .clk(clk),
    .rst_n(rst_n),
    .audio_ldata(audio_ldata_in),	
    .audio_rdata(audio_rdata_in),

    .audio_bclk(audio_bclk),
    .audio_lrclk(audio_lrclk),	
    .audio_sdata(audio_sdata)	
);

i2s_rx i2s_rx_inst
(
    .rst_n(rst_n),
    .audio_bclk(audio_bclk),
    .audio_lrclk(audio_lrclk),
    .audio_sdata(audio_sdata),

    .audio_ldata(audio_ldata_out),
    .audio_rdata(audio_rdata_out) 
);

endmodule
