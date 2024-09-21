module send_data(
    input               clk,                     
    input               rst_n,  
    input               done_sig,       //测量结束信号(高电平有效)
    input               spi_sck,        //spi时钟线   
    input               spi_cs_n,       //数据片选端(低电平有效) 
    input [15:0]        voltage,         //待测信号频率计数值
	 
    output              spi_miso        //FPGA发送，MCU接收数据
);

reg [15:0]   txd_data;         //传输的数据(16位)
wire send_done;                 //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新

//与MCU进行spi通信
spi U_spi(
	.rst_n          (rst_n),            //系统复位	    
	.clk            (sys_clk),              //系统时钟
	.spi_sdi        (),                 //FPGA接收，MCU发送数据        
	.spi_cs_n       (spi_cs_n),         //数据片选端(低电平有效)                             
	.spi_sck        (spi_sck),          //spi时钟线        
    .txd_data       (txd_data),         //FPGA要发送给MCU的数据,发完外部要置0            

    .spi_sdo	    (spi_miso),         //FPGA发送，MCU接收数据
    .rxd_data       (),                 //FPGA接收到MCU的数据,默认0
    .flag_done      (send_done)         //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新
);
//————————————————————————
//发送相关数据给MCU
always @(posedge done_sig or posedge send_done or negedge rst_n) begin
    if (!rst_n)
        txd_data <= 16'd0; 
    else if ( done_sig == 1'b1 ) begin
        txd_data <= voltage;
        end 
    else if (send_done == 1'b1)
		txd_data <= 16'd0;
end

endmodule
