`timescale 1 ns / 1 ns

module top_tb();

reg clk;            //系统时钟
reg rst_n;          //复位信号
reg start_sig;      //接收到MCU发送的开始命令(高电平有效)
reg fx;             //待测信号
reg fxB;            //与待测信号同频的方波信号
//reg spi_sck;        //spi时钟线  
//reg spi_cs_data_n;  //数据片选端(低电平有效)  

//wire spi_miso;      //FPGA发送，MCU接收数据
wire [31:0]        fx_cnt;       
wire [31:0]        fbase_cnt;     
wire [31:0]        time_cnt;      
wire [31:0]        duty_cnt; 
wire LED;           //LED显示闸门开启

top U_top(
    .clk            (clk),          //系统时钟
    .rst_n          (rst_n),        //复位信号
    .start_sig      (start_sig),    //接收到MCU发送的开始命令(高电平有效)
    .fx             (fx),           //待测信号
    .fxB            (fxB),          //与待测信号同频的方波信号
    //.spi_sck        (spi_sck),      //spi时钟线  
    //.spi_cs_data_n  (spi_cs_data_n),//数据片选端(低电平有效)  

    //.spi_miso       (spi_miso),     //FPGA发送，MCU接收数据
    .fx_cnt(fx_cnt),        
    .fbase_cnt(fbase_cnt),     
    .time_cnt(time_cnt),      
    .duty_cnt(duty_cnt), 
    .LED            (LED)           //LED显示闸门开启				
);
//————————————————————————
//初始化
initial begin
    clk             = 1'b0;
    rst_n           = 1'b0;
    fx              = 1'b0;
    fxB             = 1'b0;
    start_sig       = 1'b0;
    #20 rst_n       = 1'b1;
end
//————————————————————————
//模拟输入
initial begin 
    #25;
    forever #511 fx = ~fx;//1M
end

initial begin 
    #122;//延时97ns
    forever #511 fxB = ~fxB;//1M
end
//————————————————————————
//开启闸门
initial begin 
    #173;
    start_sig = 1'b1;
    #803;
    start_sig = 1'b0;
end

always #10 begin//50M系统时钟
	clk <= ~clk;
end

endmodule
