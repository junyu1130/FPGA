module top
(
	input                           sys_clk,                //system clock 50Mhz on board
	input                        	rst_n,                  //reset input??low active

	inout                           cmos_scl, 	            //cmos i2c clock
	inout                           cmos_sda, 	            //cmos i2c data
	input                           cmos_vsync,             //cmos vsync
	input                           cmos_href,	            //cmos hsync refrence,data valid
	input                           cmos_pclk,	            //cmos pxiel clock
	input   [7:0]                   cmos_db,  	            //cmos data
	output                          cmos_rst_n,             //cmos reset
	output                          cmos_xclk,	
	output                          cmos_pwdn,	
	//ddr3
	inout [15:0]                    ddr3_dq,                //ddr3 data
	inout [1:0]                     ddr3_dqs_n,             //ddr3 dqs negative
	inout [1:0]                     ddr3_dqs_p,             //ddr3 dqs positive
	// Outputs
	output [13:0]                   ddr3_addr,              //ddr3 address
	output [2:0]                    ddr3_ba,                //ddr3 bank
	output                          ddr3_ras_n,             //ddr3 ras_n
	output                          ddr3_cas_n,             //ddr3 cas_n
	output                          ddr3_we_n,              //ddr3 write enable
	output                          ddr3_reset_n,           //ddr3 reset,
	output [0:0]                    ddr3_ck_p,              //ddr3 clock negative
	output [0:0]                    ddr3_ck_n,              //ddr3 clock positive
	output [0:0]                    ddr3_cke,               //ddr3_cke,
	output [0:0]                    ddr3_cs_n,              //ddr3 chip select,
	output [1:0]                    ddr3_dm,                //ddr3_dm
	output [0:0]                    ddr3_odt,               //ddr3_odt
	//vga output        
	output              			VGA_hsync,  			//��ͬ���ź�
	output              			VGA_vsync,  			//֡ͬ���ź�
	output              			VGA_de,     			//����ʹ��
	output              			VGA_idck,   			//����ʱ��
	output [23:0]   				VGA_out     			//R��G��B�ź�
);

parameter MEM_DATA_BITS          = 64;                 //external memory user interface data width
parameter ADDR_BITS              = 25;                 //external memory user interface address width
parameter BUSRT_BITS             = 10;                 //external memory user interface burst width

wire                            wr_burst_data_req;      // write burst data request       
wire                            wr_burst_finish;        // write burst finish flag
wire                            rd_burst_finish;        //read burst finish flag
wire                            rd_burst_req;           //read burst request
wire                            wr_burst_req;           //write burst request
wire[BUSRT_BITS - 1:0]          rd_burst_len;           //read burst length
wire[BUSRT_BITS - 1:0]          wr_burst_len;           //write burst length
wire[ADDR_BITS - 1:0]           rd_burst_addr;          //read burst address
wire[ADDR_BITS - 1:0]           wr_burst_addr;          //write burst address
wire                            rd_burst_data_valid;    //read burst data valid
wire[MEM_DATA_BITS - 1 : 0]     rd_burst_data;          //read burst data
wire[MEM_DATA_BITS - 1 : 0]     wr_burst_data;          //write burst data

wire                            read_req;           	//read request
wire                            read_req_ack;       	//read request response  
wire                            read_en;            	//read enable
wire[15:0]                      read_data;          	//read data
wire                            write_en;           	//write enable
wire[15:0]                      write_data;         	//write data
wire                            write_req;          	//write request
wire                            write_req_ack;      	//write request response

wire                            video_clk;
wire                            hs;                     //horizontal synchronization
wire                            vs;                     //vertical synchronization
wire                            de;                     //video valid
wire[15:0]                      vout_data;              //video data

wire[15:0]                      cmos_16bit_data;        //camera coms data
wire                            cmos_16bit_wr;          //camera coms write enable
wire[1:0]                       write_addr_index;   	//write address index
wire[1:0]                       read_addr_index;    	//read address index
wire[9:0]                       cmos_lut_index;         //camera coms look up table address
wire[31:0]                      cmos_lut_data;          //camera coms Device address,register address, register data
wire                            clk_camera;

wire                            ui_clk;                  //MIG master clock
wire                            ui_clk_sync_rst;         //MIG master reset
wire                            init_calib_complete;     //MIG initialization omplete
// Master Write Address
wire [3:0]                      s00_axi_awid;
wire [63:0]                     s00_axi_awaddr;
wire [7:0]                      s00_axi_awlen;           // burst length: 0-255
wire [2:0]                      s00_axi_awsize;          // burst size: fixed 2'b011
wire [1:0]                      s00_axi_awburst;         // burst type: fixed 2'b01(incremental burst)
wire                            s00_axi_awlock;          // lock: fixed 2'b00
wire [3:0]                      s00_axi_awcache;         // cache: fiex 2'b0011
wire [2:0]                      s00_axi_awprot;          // protect: fixed 2'b000
wire [3:0]                      s00_axi_awqos;           // qos: fixed 2'b0000
wire [0:0]                      s00_axi_awuser;          // user: fixed 32'd0
wire                            s00_axi_awvalid;
wire                            s00_axi_awready;
// master write data
wire [63:0]                     s00_axi_wdata;
wire [7:0]                      s00_axi_wstrb;
wire                            s00_axi_wlast;
wire [0:0]                      s00_axi_wuser;
wire                            s00_axi_wvalid;
wire                            s00_axi_wready;
// master write response
wire [3:0]                      s00_axi_bid;
wire [1:0]                      s00_axi_bresp;
wire [0:0]                      s00_axi_buser;
wire                            s00_axi_bvalid;
wire                            s00_axi_bready;
// master read address
wire [3:0]                      s00_axi_arid;
wire [63:0]                     s00_axi_araddr;
wire [7:0]                      s00_axi_arlen;
wire [2:0]                      s00_axi_arsize;
wire [1:0]                      s00_axi_arburst;
wire [1:0]                      s00_axi_arlock;
wire [3:0]                      s00_axi_arcache;
wire [2:0]                      s00_axi_arprot;
wire [3:0]                      s00_axi_arqos;
wire [0:0]                      s00_axi_aruser;
wire                            s00_axi_arvalid;
wire                            s00_axi_arready;
// master read data
wire [3:0]                      s00_axi_rid;
wire [63:0]                     s00_axi_rdata;
wire [1:0]                      s00_axi_rresp;
wire                            s00_axi_rlast;
wire [0:0]                      s00_axi_ruser;
wire                            s00_axi_rvalid;
wire                            s00_axi_rready;
wire                            clk_200MHz;

wire[7:0]                       vga_r;                 	//vgad red data
wire[7:0]                       vga_g;                 	//vga green data
wire[7:0]                       vga_b;                 	//vga blue data

wire[7:0]                       ycbcr_y;                 //ycbcr y data
wire                            ycbcr_hs;                //ycbcr horizontal synchronization
wire                            ycbcr_vs;                //ycbcr vertical synchronization
wire                            ycbcr_de;                //ycbcr valid
wire                            sobel_hs;                //sobel horizontal synchronization
wire                            sobel_vs;                //sobel vertical synchronization
wire                            sobel_de;                //sobel valid
wire[7:0]                       sobel_out;               //sobel data

assign VGA_hsync = ycbcr_hs;
assign VGA_vsync = ycbcr_vs;
assign VGA_de = ycbcr_de;
// assign vga_r      = {vout_data[15:11],3'd0};
// assign vga_g      = {vout_data[10:5],2'd0};
// assign vga_b      = {vout_data[4:0],3'd0};
assign vga_r  = sobel_out[7:0];
assign vga_g  = sobel_out[7:0];
assign vga_b  = sobel_out[7:0];
assign VGA_out    = {vga_r,vga_g,vga_b};     //R��G��B�ź�

assign write_en = cmos_16bit_wr;
assign write_data = {cmos_16bit_data[4:0],cmos_16bit_data[10:5],cmos_16bit_data[15:11]};
/*************************************************************************
Generate the  clock required for the MIG and CMOS
****************************************************************************/
pll_ip pll_ip_m0
(
	.clk_in1                        (sys_clk   					), 	// input clk_in1
	.clk_out1                       (clk_200MHz					),	// output clk_out1
	.clk_out2                       (cmos_xclk					),	// output clk_out2 24MHz
	.reset                          (1'b0                     	),
	.locked                         (                         	)
); 
/*************************************************************************
Generate the pixel clock required for the video
****************************************************************************/
video_pll video_pll_m0
(
	.clk_in1						(sys_clk					),	// input clk_in1
	.clk_out1						(video_clk					), 	// output clk_out1
	.reset                          (1'b0                     	),
	.locked                         (                         	)
);    
/*************************************************************************
Configure the register of camera coms1
****************************************************************************/
i2c_config i2c_config_m0
(
	.rst                            (~rst_n                   ),
	.clk                            (sys_clk                  ),
	.clk_div_cnt                    (16'd99                   ),
	.i2c_addr_2byte                 (1'b1                     ),
	.lut_index                      (cmos_lut_index           ),
	.lut_dev_addr                   (cmos_lut_data[31:24]     ),
	.lut_reg_addr                   (cmos_lut_data[23:8]      ),
	.lut_reg_data                   (cmos_lut_data[7:0]       ),
	.error                          (                         ),
	.done                           (                         ),
	.i2c_scl                        (cmos_scl                 ),
	.i2c_sda                        (cmos_sda                 )
);
/*************************************************************************
look-up table of camera coms
****************************************************************************/
lut_ov5640_rgb565_1024_768 lut_ov5640_rgb565_1024_768_m0
(
	.lut_index                      (cmos_lut_index                ),
	.lut_data                       (cmos_lut_data                 )
);
/*************************************************************************
CMOS sensor 8bit data is converted to 16bit data
****************************************************************************/ 
cmos_8_16bit cmos_8_16bit_m0
(
	.rst                            (~rst_n                    ),
	.pclk                           (cmos_pclk                 ),
	.pdata_i                        (cmos_db                   ),
	.de_i                           (cmos_href                 ),
	.pdata_o                        (cmos_16bit_data           ),
	.hblank                         (                          ),
	.de_o                           (cmos_16bit_wr             )
);
/*************************************************************************
CMOS sensor writes the request and generates the read and write address index
****************************************************************************/ 
cmos_write_req_gen cmos_write_req_gen_m0
(
	.rst                            (~rst_n                    ),
	.pclk                           (cmos_pclk                 ),
	.cmos_vsync                     (cmos_vsync                ),
	.write_req                      (write_req                 ),
	.write_addr_index               (write_addr_index          ),
	.read_addr_index                (read_addr_index           ),
	.write_req_ack                  (write_req_ack             )
);

/*************************************************************************
VGA 1024*768@60Hz timing control and data generation module
****************************************************************************/
vga_timing_data_1024 vga_timing_data_1024_m0
(
    .clk_65M                        (video_clk                ),
    .rst_n                          (rst_n                    ),
    .read_req                       (read_req                 ),
    .read_req_ack                   (read_req_ack             ),
    .read_en                        (read_en                  ),
    .read_data                      (read_data                ),
    .hs                             (hs                       ),
    .vs                             (vs                	      ),
    .de                             (de                   	  ),
    .VGA_idck                       (VGA_idck                 ),
    .vout_data                      (vout_data                )
);
/*************************************************************************
Convert video data to YCBCR
****************************************************************************/ 
rgb_to_ycbcr rgb_to_ycbcr_m0
(
	.clk                            (video_clk                ),
	.rst                            (~rst_n                   ),
	.rgb_r                          ({vout_data[15:11],3'd0}  ),
	.rgb_g                          ({vout_data[10:5],2'd0}   ),
	.rgb_b                          ({vout_data[4:0],3'd0}    ),
	.rgb_hs                         (hs                       ),
	.rgb_vs                         (vs                       ),
	.rgb_de                         (de                       ),
	.ycbcr_y                        (ycbcr_y                  ),
	.ycbcr_cb                       (                         ),
	.ycbcr_cr                       (                         ),
	.ycbcr_hs                       (ycbcr_hs                 ),
	.ycbcr_vs                       (ycbcr_vs                 ),
	.ycbcr_de                       (ycbcr_de                 )
);
/*************************************************************************
YCBCR to sobel algorithm
****************************************************************************/ 
sobel sobel_m0
(
	.rst                            (~rst_n                   ),
	.pclk                           (video_clk                ),
	.threshold                      (8'd40                    ),
	.ycbcr_hs                       (ycbcr_hs                 ),
	.ycbcr_vs                       (ycbcr_vs                 ),
	.ycbcr_de                       (ycbcr_de                 ),
	.data_in                        (ycbcr_y                  ),
	.data_out                       (sobel_out                ),
	.sobel_hs                       (sobel_hs                 ),
	.sobel_vs                       (sobel_vs                 ),
	.sobel_de                       (sobel_de                 )
);
/*************************************************************************
video frame data read-write control
/****************************************************************************/
frame_read_write frame_read_write_m0
(
	.rst                            (~rst_n                    ),
	.mem_clk                        (ui_clk                    ),
	.rd_burst_req                   (rd_burst_req              ),
	.rd_burst_len                   (rd_burst_len              ),
	.rd_burst_addr                  (rd_burst_addr             ),
	.rd_burst_data_valid            (rd_burst_data_valid       ),
	.rd_burst_data                  (rd_burst_data             ),
	.rd_burst_finish                (rd_burst_finish           ),
	.read_clk                       (video_clk                 ),
	.read_req                       (read_req                  ),
	.read_req_ack                   (read_req_ack              ),
	.read_finish                    (                          ),
	.read_addr_0                    (24'd0                     ), //The first frame address is 0
	.read_addr_1                    (24'd2073600               ), //The second frame address is 24'd2073600 ,large enough address space for one frame of video
	.read_addr_2                    (24'd4147200               ),
	.read_addr_3                    (24'd6220800               ),
	.read_addr_index                (read_addr_index           ),
	.read_len                       (24'd196608                ),//frame size 1024*768*16/64
	.read_en                        (read_en                   ),
	.read_data                      (read_data                 ),

	.wr_burst_req                   (wr_burst_req              ),
	.wr_burst_len                   (wr_burst_len              ),
	.wr_burst_addr                  (wr_burst_addr             ),
	.wr_burst_data_req              (wr_burst_data_req         ),
	.wr_burst_data                  (wr_burst_data             ),
	.wr_burst_finish                (wr_burst_finish           ),
	.write_clk                      (cmos_pclk                 ),
	.write_req                      (write_req                 ),
	.write_req_ack                  (write_req_ack             ),
	.write_finish                   (                          ),
	.write_addr_0                   (24'd0                     ),
	.write_addr_1                   (24'd2073600               ),
	.write_addr_2                   (24'd4147200               ),
	.write_addr_3                   (24'd6220800               ),
	.write_addr_index               (write_addr_index          ),
	.write_len                      (24'd196608                ), //frame size  
	.write_en                       (write_en                  ),
	.write_data                     (write_data                )
);

/*************************************************************************
XILINX MIG IP with AXI bus
****************************************************************************/
ddr3 u_ddr3 
(
	// Memory interface ports
	.ddr3_addr                      (ddr3_addr                 ), 
	.ddr3_ba                        (ddr3_ba                   ), 
	.ddr3_cas_n                     (ddr3_cas_n                ), 
	.ddr3_ck_n                      (ddr3_ck_n                 ), 
	.ddr3_ck_p                      (ddr3_ck_p                 ),
	.ddr3_cke                       (ddr3_cke                  ),  
	.ddr3_ras_n                     (ddr3_ras_n                ), 
	.ddr3_reset_n                   (ddr3_reset_n              ), 
	.ddr3_we_n                      (ddr3_we_n                 ),  
	.ddr3_dq                        (ddr3_dq                   ),  
	.ddr3_dqs_n                     (ddr3_dqs_n                ),  
	.ddr3_dqs_p                     (ddr3_dqs_p                ),  
	.init_calib_complete            (init_calib_complete       ),  
	
	.ddr3_cs_n                      (ddr3_cs_n                 ),  
	.ddr3_dm                        (ddr3_dm                   ),  
	.ddr3_odt                       (ddr3_odt                  ),  
	// Application interface ports
	.ui_clk                         (ui_clk                    ), 
	.ui_clk_sync_rst                (ui_clk_sync_rst           ),  // output	   ui_clk_sync_rst
	.mmcm_locked                    (                          ),  // output	    mmcm_locked
	.aresetn                        (1'b1                      ),  // input			aresetn
	.app_sr_req                     (1'b0                      ),  // input			app_sr_req
	.app_ref_req                    (1'b0                      ),  // input			app_ref_req
	.app_zq_req                     (1'b0                      ),  // input			app_zq_req
	.app_sr_active                  (                          ),  // output	    app_sr_active
	.app_ref_ack                    (                          ),  // output		app_ref_ack
	.app_zq_ack                     (                          ),  // output		app_zq_ack
	// Slave Interface Write Address Ports
	.s_axi_awid                     (s00_axi_awid              ),  // input [0:0]	s_axi_awid
	.s_axi_awaddr                   (s00_axi_awaddr            ),  // input [29:0]	s_axi_awaddr
	.s_axi_awlen                    (s00_axi_awlen             ),  // input [7:0]	s_axi_awlen
	.s_axi_awsize                   (s00_axi_awsize            ),  // input [2:0]	s_axi_awsize
	.s_axi_awburst                  (s00_axi_awburst           ),  // input [1:0]	s_axi_awburst
	.s_axi_awlock                   (s00_axi_awlock            ),  // input [0:0]	s_axi_awlock
	.s_axi_awcache                  (s00_axi_awcache           ),  // input [3:0]	s_axi_awcache
	.s_axi_awprot                   (s00_axi_awprot            ),  // input [2:0]	s_axi_awprot
	.s_axi_awqos                    (s00_axi_awqos             ),  // input [3:0]	s_axi_awqos
	.s_axi_awvalid                  (s00_axi_awvalid           ),  // input			s_axi_awvalid
	.s_axi_awready                  (s00_axi_awready           ),  // output	    s_axi_awready
	// Slave Interface Write Data Ports
	.s_axi_wdata                    (s00_axi_wdata             ),  // input [63:0]	s_axi_wdata
	.s_axi_wstrb                    (s00_axi_wstrb             ),  // input [7:0]	s_axi_wstrb
	.s_axi_wlast                    (s00_axi_wlast             ),  // input			s_axi_wlast
	.s_axi_wvalid                   (s00_axi_wvalid            ),  // input			s_axi_wvalid
	.s_axi_wready                   (s00_axi_wready            ),  // output		s_axi_wready
	// Slave Interface Write Response Ports
	.s_axi_bid                      (s00_axi_bid               ),  // output [0:0]	s_axi_bid
	.s_axi_bresp                    (s00_axi_bresp             ),  // output [1:0]	s_axi_bresp
	.s_axi_bvalid                   (s00_axi_bvalid            ),  // output		s_axi_bvalid
	.s_axi_bready                   (s00_axi_bready            ),  // input			s_axi_bready
	// Slave Interface Read Address Ports
	.s_axi_arid                     (s00_axi_arid              ),  // input [0:0]	s_axi_arid
	.s_axi_araddr                   (s00_axi_araddr            ),  // input [29:0]	s_axi_araddr
	.s_axi_arlen                    (s00_axi_arlen             ),  // input [7:0]	s_axi_arlen
	.s_axi_arsize                   (s00_axi_arsize            ),  // input [2:0]	s_axi_arsize
	.s_axi_arburst                  (s00_axi_arburst           ),  // input [1:0]	s_axi_arburst
	.s_axi_arlock                   (s00_axi_arlock            ),  // input [0:0]	s_axi_arlock
	.s_axi_arcache                  (s00_axi_arcache           ),  // input [3:0]	s_axi_arcache
	.s_axi_arprot                   (s00_axi_arprot            ),  // input [2:0]	s_axi_arprot
	.s_axi_arqos                    (s00_axi_arqos             ),  // input [3:0]	s_axi_arqos
	.s_axi_arvalid                  (s00_axi_arvalid           ),  // input			s_axi_arvalid
	.s_axi_arready                  (s00_axi_arready           ),  // output		s_axi_arready
	// Slave Interface Read Data Ports
	.s_axi_rid                      (s00_axi_rid               ),  // output [0:0]	s_axi_rid
	.s_axi_rdata                    (s00_axi_rdata             ),  // output [63:0]	s_axi_rdata
	.s_axi_rresp                    (s00_axi_rresp             ),  // output [1:0]	s_axi_rresp
	.s_axi_rlast                    (s00_axi_rlast             ),  // output	    s_axi_rlast
	.s_axi_rvalid                   (s00_axi_rvalid            ),  // output		s_axi_rvalid
	.s_axi_rready                   (s00_axi_rready            ),  // input			s_axi_rready
	// System Clock Ports
	.sys_clk_i                      (clk_200MHz                ),  //               MIG clock
	.sys_rst                        (rst_n                     )   //              input sys_rst
);
/*************************************************************************
AXI User Interface Conversion 
****************************************************************************/
aq_axi_master u_aq_axi_master
(
	.ARESETN                        (~ui_clk_sync_rst         ),
	.ACLK                           (ui_clk                   ),
	.M_AXI_AWID                     (s00_axi_awid             ),
	.M_AXI_AWADDR                   (s00_axi_awaddr           ),
	.M_AXI_AWLEN                    (s00_axi_awlen            ),
	.M_AXI_AWSIZE                   (s00_axi_awsize           ),
	.M_AXI_AWBURST                  (s00_axi_awburst          ),
	.M_AXI_AWLOCK                   (s00_axi_awlock           ),
	.M_AXI_AWCACHE                  (s00_axi_awcache          ),
	.M_AXI_AWPROT                   (s00_axi_awprot           ),
	.M_AXI_AWQOS                    (s00_axi_awqos            ),
	.M_AXI_AWUSER                   (s00_axi_awuser           ),
	.M_AXI_AWVALID                  (s00_axi_awvalid          ),
	.M_AXI_AWREADY                  (s00_axi_awready          ),
	.M_AXI_WDATA                    (s00_axi_wdata            ),
	.M_AXI_WSTRB                    (s00_axi_wstrb            ),
	.M_AXI_WLAST                    (s00_axi_wlast            ),
	.M_AXI_WUSER                    (s00_axi_wuser            ),
	.M_AXI_WVALID                   (s00_axi_wvalid           ),
	.M_AXI_WREADY                   (s00_axi_wready           ),
	.M_AXI_BID                      (s00_axi_bid              ),
	.M_AXI_BRESP                    (s00_axi_bresp            ),
	.M_AXI_BUSER                    (s00_axi_buser            ),
	.M_AXI_BVALID                   (s00_axi_bvalid           ),
	.M_AXI_BREADY                   (s00_axi_bready           ),
	.M_AXI_ARID                     (s00_axi_arid             ),
	.M_AXI_ARADDR                   (s00_axi_araddr           ),
	.M_AXI_ARLEN                    (s00_axi_arlen            ),
	.M_AXI_ARSIZE                   (s00_axi_arsize           ),
	.M_AXI_ARBURST                  (s00_axi_arburst          ),
	.M_AXI_ARLOCK                   (s00_axi_arlock           ),
	.M_AXI_ARCACHE                  (s00_axi_arcache          ),
	.M_AXI_ARPROT                   (s00_axi_arprot           ),
	.M_AXI_ARQOS                    (s00_axi_arqos            ),
	.M_AXI_ARUSER                   (s00_axi_aruser           ),
	.M_AXI_ARVALID                  (s00_axi_arvalid          ),
	.M_AXI_ARREADY                  (s00_axi_arready          ),
	.M_AXI_RID                      (s00_axi_rid              ),
	.M_AXI_RDATA                    (s00_axi_rdata            ),
	.M_AXI_RRESP                    (s00_axi_rresp            ),
	.M_AXI_RLAST                    (s00_axi_rlast            ),
	.M_AXI_RUSER                    (s00_axi_ruser            ),
	.M_AXI_RVALID                   (s00_axi_rvalid           ),
	.M_AXI_RREADY                   (s00_axi_rready           ),
	.MASTER_RST                     (1'b0                     ),
	.WR_START                       (wr_burst_req             ),
	.WR_ADRS                        ({wr_burst_addr,3'd0}     ),
	.WR_LEN                         ({wr_burst_len,3'd0}      ),
	.WR_READY                       (                         ),
	.WR_FIFO_RE                     (wr_burst_data_req        ),
	.WR_FIFO_EMPTY                  (1'b0                     ),
	.WR_FIFO_AEMPTY                 (1'b0                     ),
	.WR_FIFO_DATA                   (wr_burst_data            ),
	.WR_DONE                        (wr_burst_finish          ),
	.RD_START                       (rd_burst_req             ),
	.RD_ADRS                        ({rd_burst_addr,3'd0}     ),
	.RD_LEN                         ({rd_burst_len,3'd0}      ),
	.RD_READY                       (                         ),
	.RD_FIFO_WE                     (rd_burst_data_valid      ),
	.RD_FIFO_FULL                   (1'b0                     ),
	.RD_FIFO_AFULL                  (1'b0                     ),
	.RD_FIFO_DATA                   (rd_burst_data            ),
	.RD_DONE                        (rd_burst_finish          ),
	.DEBUG                          (                         )
);

endmodule