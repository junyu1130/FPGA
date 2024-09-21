//————————————————————————
//一次spi数据传输
//MSB8位:   开始标志0x11
//32位：    待测信号占空比计数值
//32位：    双通道同频率信号的时间间隔计数值
//32位：    待测信号频率计数值
//32位：   	标准信号频率计数值
//8位：     结束标志0xff
//8位：   	校验码0x0a
//8位：   	校验码0x0b
//————————————————————————
module send_data(
    input               clk,                     
    input               rst_n,  
    input               done_sig,       //测量结束信号(高电平有效)
    input [31:0]        fx_cnt,         //待测信号频率计数值
    input [31:0]        fbase_cnt,      //标准信号频率计数值
    input [31:0]        time_cnt,       //双通道同频率信号的时间间隔计数值
    input [31:0]        duty_cnt,       //待测信号占空比计数值
    input               spi_sck,        //spi时钟线   
    input               spi_cs_n,       //数据片选端(低电平有效)  

    output              spi_miso        //FPGA发送，MCU接收数据
);
//————————————————————————
reg [159:0]   txd_data;         //传输的数据(160位)
wire send_done;                 //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新
//————————————————————————
//与MCU进行spi通信
spi U_spi(
	.rst_n          (rst_n),            //系统复位	    
	.clk            (clk),              //系统时钟
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
        txd_data <= 160'd0; 
    else if (done_sig == 1'b1) begin
        txd_data[159:152] <= 8'h11;     //开始标志0x11
        txd_data[151:120] <= duty_cnt;  //待测信号占空比计数值
        txd_data[119: 88] <= time_cnt;  //双通道同频率信号的时间间隔计数值
        txd_data[ 87: 56] <= fx_cnt;    //待测信号频率计数值
        txd_data[ 55: 24] <= fbase_cnt; //标准信号频率计数值
        txd_data[ 23: 16] <= 8'hff;     //结束标志0xff
        txd_data[ 15:  8] <= 8'h0a;     //校验码0x0a
        txd_data[  7:  0] <= 8'h0b;     //检验码0x0b
        end 
    else if (send_done == 1'b1)
		txd_data <= 160'd0;
end

endmodule


