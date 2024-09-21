//I2S rx
module i2s_rx(
    input rst_n,
    input audio_bclk,
    input audio_lrclk,
    input audio_sdata,
        
    output reg [15:0] audio_ldata,
    output reg [15:0] audio_rdata
);

reg [31:0]	left;
reg [31:0]	right;
reg			lrclk_r;
wire		lrclk_nedge;

assign lrclk_nedge = !audio_lrclk & lrclk_r;

always @(posedge audio_bclk) begin
    lrclk_r <= audio_lrclk;
end

// audio_sdata msb is valid one clock cycle after audio_lrclk switches
always @(posedge audio_bclk) begin
	if (lrclk_r)
		right <= {right[30:0], audio_sdata};
	else
		left <= {left[30:0], audio_sdata};
end

//lrclk下降沿输出结果
always @(posedge audio_bclk) begin
	if (lrclk_nedge) begin
		audio_ldata <= (left >> 16);
		audio_rdata <= ({right[30:0], audio_sdata} >> 16);
	end
end

endmodule
