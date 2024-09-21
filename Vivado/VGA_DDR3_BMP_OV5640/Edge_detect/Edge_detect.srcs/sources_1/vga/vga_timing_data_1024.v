module vga_timing_data_1024
#(
	parameter DATA_WIDTH = 16                       // Video data one clock data width
)
(
	input                       clk_65M,            // Video pixel clock
	input                       rst_n,
	output reg                  read_req,           // Start reading a frame of data     
	input                       read_req_ack,       // Read request response
	output                      read_en,            // Read data enable
	input[DATA_WIDTH - 1:0]     read_data,          // Read data
	output                      hs,                 // horizontal synchronization
	output                      vs,                 // vertical synchronization
	output                      de,                 // video valid
	output                      VGA_idck,
	output[DATA_WIDTH - 1:0]    vout_data           // video data
);

wire                   video_hs;
wire                   video_vs;
wire                   video_de;
//delay video_hs video_vs  video_de 2 clock cycles
reg                    video_hs_d0;
reg                    video_vs_d0;
reg                    video_de_d0;
reg                    video_hs_d1;
reg                    video_vs_d1;
reg                    video_de_d1;

reg[DATA_WIDTH - 1:0]  vout_data_r;
assign read_en = video_de;
assign hs = video_hs_d1;
assign vs = video_vs_d1;
assign de = video_de_d1;
assign vout_data = vout_data_r;

always@(posedge clk_65M or negedge rst_n)
begin
	if(!rst_n)
	begin
		video_hs_d0 <= 1'b0;
		video_vs_d0 <= 1'b0;
		video_de_d0 <= 1'b0;
	end
	else
	begin
		//delay video_hs video_vs  video_de 2 clock cycles
		video_hs_d0 <= video_hs;
		video_vs_d0 <= video_vs;
		video_de_d0 <= video_de;
		video_hs_d1 <= video_hs_d0;
		video_vs_d1 <= video_vs_d0;
		video_de_d1 <= video_de_d0;	
	end
end

always@(posedge clk_65M or negedge rst_n)
begin
	if(!rst_n)
		vout_data_r <= {DATA_WIDTH{1'b0}};
	else if(video_de_d0)
		vout_data_r <= read_data;
	else
		vout_data_r <= {DATA_WIDTH{1'b0}};
end

always@(posedge clk_65M or negedge rst_n)
begin
	if(!rst_n)
		read_req <= 1'b0;
	else if(video_vs_d0 & ~video_vs) //vertical synchronization edge (the rising or falling edges are OK) falling
		read_req <= 1'b1;
	else if(read_req_ack)
		read_req <= 1'b0;
end

color_bar_1024 color_bar_1024_m0
(
	.clk_65M	(clk_65M),  
	.rst_n		(rst_n),    
	.VGA_hsync	(video_hs),
	.VGA_vsync	(video_vs),
	.VGA_de		(video_de),   
	.VGA_idck	(VGA_idck), 
	.VGA_out   	()
);

endmodule 