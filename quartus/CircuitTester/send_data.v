//————————————————————————
//完整spi数据传输（22组16位数据）
//16位一次传输
//MSB16位:   开始标志0x1100
//16位数据*20
//16位：     结束标志0xff00
//————————————————————————
module send_data(
    input               clk,                     
    input               rst_n,  
    input               done_sig,       //检测结束信号(高电平有效)
    input               spi_sck,        //spi时钟线   
    input               spi_cs_n,       //数据片选端(低电平有效) 
    input [16*20-1:0]   data,           //20个16位数据

    output              spi_miso        //FPGA发送，MCU接收数据
);
//————————————————————————
reg [15:0]  txd_data;       //传输的数据(16位)
reg [5:0]   i;              //控制发送的数据
wire        send_done;      //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新
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
//发送相关数据给MCU(检测完触发，发送一次触发更新)
always @(posedge done_sig or posedge send_done or negedge rst_n) begin
    if (!rst_n)
        txd_data <= 16'd0; 
    else if (done_sig == 1'b1) begin//检测完毕，发送开始标志
        txd_data <= 16'h1100;     //开始标志0x1100
        i <= 1'b1;
        end 
    else if (send_done == 1'b1) begin//发送完毕，进行数据更新
        case (i)								
            6'd1   : begin txd_data <= data[16*1-1 :16*0 ]; i <= i + 1'b1; end//20个数据
            6'd2   : begin txd_data <= data[16*2-1 :16*1 ]; i <= i + 1'b1; end
            6'd3   : begin txd_data <= data[16*3-1 :16*2 ]; i <= i + 1'b1; end
            6'd4   : begin txd_data <= data[16*4-1 :16*3 ]; i <= i + 1'b1; end
            6'd5   : begin txd_data <= data[16*5-1 :16*4 ]; i <= i + 1'b1; end
            6'd6   : begin txd_data <= data[16*6-1 :16*5 ]; i <= i + 1'b1; end
            6'd7   : begin txd_data <= data[16*7-1 :16*6 ]; i <= i + 1'b1; end
            6'd8   : begin txd_data <= data[16*8-1 :16*7 ]; i <= i + 1'b1; end                                          
            6'd9   : begin txd_data <= data[16*9-1 :16*8 ]; i <= i + 1'b1; end
            6'd10  : begin txd_data <= data[16*10-1:16*9 ]; i <= i + 1'b1; end
            6'd11  : begin txd_data <= data[16*11-1:16*10]; i <= i + 1'b1; end
            6'd12  : begin txd_data <= data[16*12-1:16*11]; i <= i + 1'b1; end
            6'd13  : begin txd_data <= data[16*13-1:16*12]; i <= i + 1'b1; end
            6'd14  : begin txd_data <= data[16*14-1:16*13]; i <= i + 1'b1; end
            6'd15  : begin txd_data <= data[16*15-1:16*14]; i <= i + 1'b1; end
            6'd16  : begin txd_data <= data[16*16-1:16*15]; i <= i + 1'b1; end
            6'd17  : begin txd_data <= data[16*17-1:16*16]; i <= i + 1'b1; end
            6'd18  : begin txd_data <= data[16*18-1:16*17]; i <= i + 1'b1; end
            6'd19  : begin txd_data <= data[16*19-1:16*18]; i <= i + 1'b1; end
            6'd20  : begin txd_data <= data[16*20-1:16*19]; i <= i + 1'b1; end

            6'd21  : begin txd_data <= 16'hff00           ; i <= i + 1'b1; end//结束标志0xff00
            6'd22  : begin txd_data <= 16'h0000; i <= 1'b0; end//结束传输
            default: begin txd_data <= 16'h0000; i <= 1'b0; end
            endcase
        end
end

endmodule


