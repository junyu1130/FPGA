module spdif_top (
    input           clk_i,
    input           rst_i,
    input           audio_clk_i,
    input  [ 31:0]  inport_tdata_i,
    output          outport_tready_o,
    output          spdif_o,
    output [23:0]   oDataL,
    output [23:0]   oDataR,
    output          oDatavalidL,
    output          oDatavalidR
);

wire bit_clock_w = audio_clk_i;

spdif_tx spdif_tx_inst (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .bit_out_en_i(bit_clock_w),
    .spdif_o(spdif_o),
    .sample_i(inport_tdata_i),
    .sample_req_o(outport_tready_o)
);

spdif_rx spdif_rx_inst (
    .iClk(clk_i),
    .rst_i(rst_i),
    .iSPDIFin(spdif_o),
    .oDataL(oDataL),
    .oDataR(oDataR),
    .oDatavalidL(oDatavalidL),
    .oDatavalidR(oDatavalidR)
);

endmodule
