module CircuitTester(
    input               clk,            //系统时钟
    input               rst_n,          //复位信号
    input               start_sig,      //MCU发送的开始命令，上升沿存储数据
    input               spi_sck,        //spi时钟线  
    input               spi_cs_n,       //数据片选端(低电平有效)  

    output              spi_miso,       //FPGA发送，MCU接收数据
    output              led             //led显示检测开启
);
//————————————————————————
wire done_sig;              //测量结束信号(高电平有效)
wire [20*16-1:0]  data;     //20个16位数据，第一个数据在低16位
//————————————————————————
assign led = start_sig;//led显示检测开启
//————————————————————————
//向MCU发送数据
send_data U_send_data(
   .clk            (clk),                 
   .rst_n          (rst_n),    
   .done_sig       (done_sig),      //测量结束信号，高电平有效
   .spi_sck        (spi_sck),       //spi时钟线   
   .spi_cs_n       (spi_cs_n),      //数据片选端(低电平有效) 
   .data           (data),          //20个16位数据 

   .spi_miso       (spi_miso)       //FPGA发送，MCU接收数据
);  

endmodule
