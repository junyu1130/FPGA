//------------------------
//为确保初相位同步，数据接受所使用的时钟应大于DDS工作时钟
//接收一次spi数据传输
//MSB32位:  开始标志0x0123_4567
//16位：    选择CH1波形     1：正弦波 2：方波 3：三角波 4：锯齿波
//16位：    选择CH2波形
//32位：    CH1幅度
//32位：    CH1频率
//32位：    CH1相位
//32位：    CH2幅度
//32位：    CH2频率
//32位：    CH2相位
//LSB32位： 结束标志0x89AB_CDEF
//------------------------
module read_write_data
(
    input               clk,                     
    input               rst_n,  
    input               spi_sck,        //spi时钟线   
    input               spi_cs_n,       //数据片选端(低电平有效)
    input               spi_mosi,       //FPGA接收，MCU发送数据

    output              spi_miso,       //FPGA发送，MCU接收数据
    output              change_flag,    //数据接收结束会产生一段高电平，用于对相位累加器进行清零操作
    output reg [15:0]   ch1_wave,       //选择CH1通道波形 1：正弦波 2：方波 3：三角波 4：锯齿波
    output reg [15:0]   ch2_wave,       //选择CH2通道波形
    output reg [31:0]   amp1,           
    output reg [31:0]   freq1,
    output reg [31:0]   phase1,
    output reg [31:0]   amp2,
    output reg [31:0]   freq2,
    output reg [31:0]   phase2

);
//------------------------
wire            spi_done;   //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新
wire [15:0]     spi_data;   //一次SPI接收到的数据

reg [32*7-1:0]  receive_data;//接收到的数据
reg             read_done;   //接收数据完成标志(上升沿)
//------------------------
//接收数据完成后要送到DDS内部清空相位累加器数据
reg	change_flag_r1, change_flag_r2;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		change_flag_r1 <= 1'b0;
		change_flag_r2 <= 1'b0;
	end 
	else begin
		change_flag_r1 <= read_done;
		change_flag_r2 <= change_flag_r1;
	end
end

assign change_flag = change_flag_r1  & !change_flag_r2;	//上升沿输出为高    
//------------------------
//与MCU进行spi通信
spi_stm32 u_spi_stm32(
	.rst_n          (rst_n),            //系统复位	    
	.clk            (clk),              //系统时钟
	.spi_sdi        (spi_mosi),         //FPGA接收，MCU发送数据        
	.spi_cs_n       (spi_cs_n),         //数据片选端(低电平有效)                             
	.spi_sck        (spi_sck),          //spi时钟线        
    .txd_data       (),                 //FPGA要发送给MCU的数据,发完外部要置0            

    .spi_sdo	    (),                 //FPGA发送，MCU接收数据
    .rxd_data       (spi_data),         //FPGA接收到MCU的数据,默认0
    .flag_done      (spi_done)          //传输结束标志,上升沿的时候,锁存数据,进行发送数据的更新
);
//------------------------
//锁存有效数据(非阻塞同步数据)
always @(posedge read_done or negedge rst_n) begin
    if(!rst_n) begin
        ch1_wave <= 0;
        ch2_wave <= 0;
        amp1     <= 0;
        freq1    <= 0;
        phase1   <= 0;
        amp2     <= 0;
        freq2    <= 0;
        phase2   <= 0;
    end
    else begin
        ch1_wave    <= receive_data[16*14-1:16*13];
        ch2_wave    <= receive_data[16*13-1:16*12];
        amp1        <= receive_data[32* 6-1:32* 5];
        freq1       <= receive_data[32* 5-1:32* 4];
        phase1      <= receive_data[32* 4-1:32* 3];
        amp2        <= receive_data[32* 3-1:32* 2];
        freq2       <= receive_data[32* 2-1:32* 1];
        phase2      <= receive_data[32* 1-1:32* 0];
    end
end

// ------------------------
// 读取数据
reg [4:0] i;
always @(posedge spi_done or negedge rst_n) begin
    if (!rst_n) begin
        receive_data <= 0;
        i <= 0; 
        read_done <= 0;
    end
    else begin
        case (i)	
            5'd0    :   if(spi_data==16'h0123) begin 
                            receive_data <= 0; 
                            i <= i + 1; 
                            read_done <= 0;
                        end
            5'd1    :   if(spi_data==16'h4567) begin 
                            i <= i + 1; 
                        end
                        else i <= 0;
            5'd2    :   begin receive_data[16*14-1:16*13] <= spi_data; i <= i + 1;end//接收有效数据
            5'd3    :   begin receive_data[16*13-1:16*12] <= spi_data; i <= i + 1;end
            5'd4    :   begin receive_data[16*12-1:16*11] <= spi_data; i <= i + 1;end
            5'd5    :   begin receive_data[16*11-1:16*10] <= spi_data; i <= i + 1;end
            5'd6    :   begin receive_data[16*10-1:16* 9] <= spi_data; i <= i + 1;end
            5'd7    :   begin receive_data[16* 9-1:16* 8] <= spi_data; i <= i + 1;end
            5'd8    :   begin receive_data[16* 8-1:16* 7] <= spi_data; i <= i + 1;end
            5'd9    :   begin receive_data[16* 7-1:16* 6] <= spi_data; i <= i + 1;end
            5'd10   :   begin receive_data[16* 6-1:16* 5] <= spi_data; i <= i + 1;end
            5'd11   :   begin receive_data[16* 5-1:16* 4] <= spi_data; i <= i + 1;end
            5'd12   :   begin receive_data[16* 4-1:16* 3] <= spi_data; i <= i + 1;end
            5'd13   :   begin receive_data[16* 3-1:16* 2] <= spi_data; i <= i + 1;end
            5'd14   :   begin receive_data[16* 2-1:16* 1] <= spi_data; i <= i + 1;end
            5'd15   :   begin receive_data[16* 1-1:16* 0] <= spi_data; i <= i + 1;end
            5'd16   :   if(spi_data==16'h89ab) begin 
                            i <= i + 1; 
                        end
                        else i <= 0;
            5'd17   :   if(spi_data==16'hcdef) begin 
                            i <= 0; 
                            read_done <= 1;
                        end
                        else i <= 0;
            default :   begin receive_data <= 0; i <= 0; read_done <= 0;end 
        endcase
    end 
end

endmodule
