
module Data_buff(

//system setting
    input rst_n, // 时钟和复位
    input clk,

//ads parameters
    input Busy, 
    input [15:0] Data_in,
    output adc_rc,

//  MCU IOs
	input cs,
	output LED_light,
	output reg [15:0] Data_out
	
);

wire	sys_clk;

pll_64 u_pll_64(
	.areset		(~rst_n),
	.inclk0		(clk),
	.c0			(sys_clk),
	.locked		()
	);

//assign sys_clk=clk;
ads8505  U_ads8505(
	.clk				(sys_clk),
   .rst_n         (rst_n),  
	.adc_rc			(adc_rc)
);

//------some para_get ------//

reg						busy_r1, busy_r2;			//检测busy的下降沿

always @(posedge sys_clk or negedge rst_n) begin

	if (!rst_n) begin
		busy_r1 <= 1'b0;
		busy_r2 <= 1'b0;
	end 
	else begin
		busy_r1 <= Busy;
		busy_r2 <= busy_r1;
	end
end

assign done_sig= !busy_r1 & busy_r2;	 // 检测下降沿

reg						cs_r1, cs_r2;			//检测busy的下降沿

always @(posedge sys_clk or negedge rst_n) begin

	if (!rst_n) begin
		cs_r1 <= 1'b0;
		cs_r2 <= 1'b0;
	end 
	else begin
		cs_r1 <= cs;
		cs_r2 <= cs_r1;
	end
end

assign cs_done= !cs_r1 & cs_r2;	//下降沿
assign cs_up= cs_r1 & !cs_r2;	//上升沿



reg [8191:0] buff_512;
reg [9:0] buff_cnt;
reg full_buff_flag;
assign LED_light=~full_buff_flag;
reg [15:0]txd_data_r;  //temp data
always@(posedge sys_clk or negedge rst_n) begin
	if (!rst_n) 
		begin
			buff_512 <= 8192'b0;
			buff_cnt<=0;
			full_buff_flag<=1'b0;
			txd_data_r<=15'b0;
			Data_out<=15'b0;
		end 
		
		
	else if (full_buff_flag) 
		if (buff_cnt==512)
			begin
				Data_out<=txd_data_r;
				full_buff_flag<=1'b0;
				buff_cnt<=0;
			end 
		
		else if (buff_cnt<512)
			if (cs_r1 == 1'b0 && cs_r2 == 1'b0)	//cs为低电平
				Data_out<=txd_data_r;
			
			else if (cs_done) 
				begin//在cs下降沿的时候,获取要输出的数据
					txd_data_r[15:0] <= buff_512[8191:8191-15];
					buff_512<= buff_512<<16;
					buff_cnt<=buff_cnt+1;
				end
			else 
				begin//保持
					Data_out <= Data_out;
					buff_512<=buff_512;
					buff_cnt<=buff_cnt;
				end
		else 
		begin//保持
			Data_out <= Data_out;
			buff_512<=buff_512;
			buff_cnt<=buff_cnt;
		end

		
	else if (!full_buff_flag)
	
		if(buff_cnt==512) 
			begin
				buff_cnt<=0;
				full_buff_flag<=1'b1;
			end 
		
		else if (buff_cnt<512) 
				if (done_sig)
					begin 
						buff_512 <= {buff_512[8191-15:0],Data_in[15:0]};
						buff_cnt<=buff_cnt+1;
					end 
			
				else 
					begin
						buff_512<=buff_512;
						buff_cnt<=buff_cnt;
					end
		else 
			begin
				buff_512<=buff_512;
				buff_cnt<=buff_cnt;
				Data_out<=Data_out;
			end

end 



////向MCU发送数据
//send_data U_send_data(
//   .clk            (sys_clk),                 
//   .rst_n          (rst_n),   
//   .done_sig       (done_sig),      //测量结束信号，高电平有效	
//   .spi_sck        (spi_sck),       //spi时钟线   
//   .spi_cs_n       (spi_cs_n),      //数据片选端(低电平有效)  
//
//   .voltage        (Data_in),  
//	
//   .spi_miso       (spi_miso)       //FPGA发送，MCU接收数据
//);  


endmodule
