module top(
    input               clk,            //系统时钟
    input               rst_n,          //复位信号
    input               start_sig,      //接收到MCU发送的开始命令(高电平有效)
    input               fx,             //待测信号
    input               fxB,            //与待测信号同频的方波信号
    input               spi_sck,        //spi时钟线  
    input               spi_cs_n,       //数据片选端(低电平有效)  

    output              spi_miso,       //FPGA发送，MCU接收数据
    output              led             //led显示闸门开启
);
//————————————————————————
wire        clk_200M;

wire        done_sig;   //测量结束信号(高电平有效)
wire [31:0] fx_cnt;     //待测信号频率计数值
wire [31:0] fbase_cnt;  //标准信号频率计数值 
wire [31:0] time_cnt;   //双通道同频率信号的时间间隔计数值
wire [31:0] duty_cnt;   //待测信号占空比计数值

reg fx_r1;
reg fx_r;
reg fxB_r1;
reg fxB_r;
//————————————————————————
//对输入信号进行同步
always @(posedge clk) begin
    fx_r1 = fx;
end
always @(posedge clk) begin
    fx_r = fx_r1;
end

always @(posedge clk) begin
    fxB_r1 = fxB;
end
always @(posedge clk) begin
    fxB_r = fxB_r1;
end
//————————————————————————
//产生时钟
clk_pll    U_clk_pll (
    .inclk0 (clk),
    .c0     (clk_200M)
);
//————————————————————————
//检测信号频率，输出待测信号计数值与标准信号计数值
freq_measure U_freq_measure(
    .clk        (clk),          //系统时钟
    .clk_pll    (clk_200M),     //倍频时钟
    .rst_n      (rst_n),	
    .start_sig  (start_sig),    //接收到MCU发送的开始命令(高电平有效)
    .fx         (fx_r),        //待测信号
    .fxB        (fxB_r),        //与待测信号同频的方波信号

    .led        (led),          //led显示闸门开启
    .done_sig   (done_sig),     //结束信号，高电平有效
    .fx_cnt     (fx_cnt),       //待测信号频率计数值
    .fbase_cnt  (fbase_cnt),    //标准信号频率计数值
    .time_cnt   (time_cnt),     //双通道同频率信号的时间间隔计数值
    .duty_cnt   (duty_cnt)      //待测信号占空比计数值 
);

//————————————————————————
//向MCU发送数据
send_data U_send_data(
   .clk            (clk_200M),                 
   .rst_n          (rst_n),    
   .done_sig       (done_sig),      //测量结束信号，高电平有效
   .fx_cnt         (fx_cnt),        //待测信号频率计数值
   .fbase_cnt      (fbase_cnt),     //标准信号频率计数值
   .time_cnt       (time_cnt),      //双通道同频率信号的时间间隔计数值
   .duty_cnt       (duty_cnt),      //待测信号占空比计数值
   .spi_sck        (spi_sck),       //spi时钟线   
   .spi_cs_n       (spi_cs_n),      //数据片选端(低电平有效)  

   .spi_miso       (spi_miso)       //FPGA发送，MCU接收数据
);  

endmodule
