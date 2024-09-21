module dds
(
    input               sys_clk,                    //system clock 50Mhz on board
    input               rst_n,
    input               spi_sck,                    //spi时钟线   
    input               spi_cs_n,                   //数据片选端(低电平有效)
    input               spi_mosi,                   //FPGA接收，MCU发送数据

    output              spi_miso,                   //FPGA发送，MCU接收数据
    output              da1_clk,                    //AD9767 CH1 clock
    output              da1_wrt,                    //AD9767 CH1 enable
    output reg [13:0]   da1_data,                   //AD9767 CH1 data output
    output              da2_clk,                    //AD9767 CH2 clock
    output              da2_wrt,	                //AD9767 CH2 enable
    output reg [13:0]   da2_data                    //AD9767 CH2 data output
);
//---------------------------------------------------//
wire            clk_100M;       //clock for DA data processing
wire            clk_200M;       //clock for data receiving
wire [15:0]     ch1_wave;       //CH1波形选择 1：正弦波 2：方波 3：三角波 4：锯齿波
wire [31:0]     amp1;           //CH1
wire [31:0]     freq1;
wire [31:0]     phase1;
wire [15:0]     ch2_wave;       //CH2波形选择
wire [31:0]     amp2;           //CH2
wire [31:0]     freq2;
wire [31:0]     phase2;
wire [13:0]     sin_out1;       //正弦波
wire [13:0]     sin_out2;
wire [13:0]     square_out1;    //方波
wire [13:0]     square_out2;
wire [13:0]     triangle_out1;  //三角波
wire [13:0]     triangle_out2;
wire [13:0]     sawtooth_out1;  //锯齿波
wire [13:0]     sawtooth_out2;
wire            change_flag;    //数据接收结束会产生一段高电平，用于对相位累加器进行清零操作
//---------------------------------------------------//
assign da1_clk = clk_100M;
assign da1_wrt = da1_clk;
assign da2_clk = clk_100M;
assign da2_wrt = da2_clk;
//---------------------------------------------------//
//选择CH1波形
always @(*) begin
    case(ch1_wave)
        32'd1   : da1_data = sin_out1;
        32'd2   : da1_data = square_out1;
        32'd3   : da1_data = triangle_out1;
        32'd4   : da1_data = sawtooth_out1;
        default : da1_data = 0;
    endcase
end

//选择CH2波形
always @(*) begin
    case(ch2_wave)
        32'd1   : da2_data = sin_out2;
        32'd2   : da2_data = square_out2;
        32'd3   : da2_data = triangle_out2;
        32'd4   : da2_data = sawtooth_out2;
        default : da2_data = 0;
    endcase
end
/*************************************************************************
Generate the clock  required for DA
****************************************************************************/
clk_wiz_0 clk_wiz_0_inst
(
    .clk_in1    (sys_clk ),     
    .clk_out1   (clk_100M),
    .clk_out2   (clk_200M)    
); 
//---------------------------------------------------//
//可控制频率，幅度，相位的波形发生器
//---------------------------------------------------//
//                      正弦波
//---------------------------------------------------//
//通道1
sin_wave  sin_wave_m0 
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .change_flag             ( change_flag      ),
    .freq                    ( freq1            ),
    .amp                     ( amp1             ),
    .phase                   ( phase1           ),

    .sin_out                 ( sin_out1         )
);
//通道2
sin_wave  sin_wave_m1 
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .change_flag             ( change_flag      ),
    .freq                    ( freq2            ),
    .amp                     ( amp2             ),
    .phase                   ( phase2           ),

    .sin_out                 ( sin_out2         )
);
//---------------------------------------------------//
//                      方波
//---------------------------------------------------//
//通道1
square_wave square_wave_m0
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq1            ),
    .amp                     ( amp1             ),
    .phase                   ( phase1           ),
    .square_out              ( square_out1      )
); 
//通道2
square_wave square_wave_m1
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq2            ),
    .amp                     ( amp2             ),
    .phase                   ( phase2           ),
    .square_out              ( square_out2      )
); 
//---------------------------------------------------//
//                      三角波
//---------------------------------------------------//
//通道1
triangle_wave triangle_wave_m0
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq1            ),
    .amp                     ( amp1             ),
    .phase                   ( phase1           ),
    .triangle_out            ( triangle_out1    )
); 
//通道2
triangle_wave triangle_wave_m1
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq2            ),
    .amp                     ( amp2             ),
    .phase                   ( phase2           ),
    .triangle_out            ( triangle_out2    )
); 
//---------------------------------------------------//
//                      锯齿波
//---------------------------------------------------//
//通道1
sawtooth_wave sawtooth_wave_m0
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq1            ),
    .amp                     ( amp1             ),
    .phase                   ( phase1           ),
    .sawtooth_out            ( sawtooth_out1    )
); 
//通道2
sawtooth_wave sawtooth_wave_m1
(
    .clk_100M                ( clk_100M         ),
    .rst_n                   ( rst_n            ),
    .freq                    ( freq2            ),
    .amp                     ( amp2             ),
    .phase                   ( phase2           ),
    .sawtooth_out            ( sawtooth_out2    )
); 
/*************************************************************************
Read data from stm32
****************************************************************************/
// read_write_data  u_read_write_data 
// (
//     .clk                     ( clk_200M         ),
//     .rst_n                   ( rst_n            ),
//     .spi_sck                 ( spi_sck          ),
//     .spi_cs_n                ( spi_cs_n         ),
//     .spi_mosi                ( spi_mosi         ),

//     .spi_miso                ( spi_miso         ),
//     .change_flag             ( change_flag      ),
//     .ch1_wave                ( ch1_wave         ),
//     .ch2_wave                ( ch2_wave         ),
//     .amp1                    ( amp1             ),
//     .freq1                   ( freq1            ),
//     .phase1                  ( phase1           ),
//     .amp2                    ( amp2             ),
//     .freq2                   ( freq2            ),
//     .phase2                  ( phase2           )
// );
dds_hdu_ip_0 dds_hdu_ip_m0 
(
    .clk        (clk_200M),         // input wire clk
    .rst_n      (rst_n),            // input wire rst_n
    .spi_sck    (spi_sck),          // input wire spi_sck
    .spi_cs_n   (spi_cs_n),         // input wire spi_cs_n
    .spi_mosi   (spi_mosi),         // input wire spi_mosi

    .spi_miso   (spi_miso),         // output wire spi_miso
    .change_flag(change_flag),      // output wire change_flag
    .ch1_wave   (ch1_wave),         // output wire [15 : 0] ch1_wave
    .ch2_wave   (ch2_wave),         // output wire [15 : 0] ch2_wave
    .amp1       (amp1),             // output wire [31 : 0] amp1
    .freq1      (freq1),            // output wire [31 : 0] freq1
    .phase1     (phase1),           // output wire [31 : 0] phase1
    .amp2       (amp2),             // output wire [31 : 0] amp2
    .freq2      (freq2),            // output wire [31 : 0] freq2
    .phase2     (phase2)            // output wire [31 : 0] phase2
);
// /*************************************************************************
// Analyze data from user defined ports for the xilinx ila module
// ****************************************************************************/ 
// ila_0 ila_0_inst 
// (
//     .clk(clk_100M), // input wire clk
// 	.probe0(freq1), // input wire [31:0]  probe0  
// 	.probe1(amp1), // input wire [31:0]  probe1 
// 	.probe2(phase1), // input wire [31:0]  probe2 
// 	.probe3(da1_data), // input wire [13:0]  probe3 
// 	.probe4(da2_data) // input wire [13:0]  probe4
// );

endmodule
