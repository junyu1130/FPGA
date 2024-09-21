//------------------------
//Ϊȷ������λͬ�������ݽ�����ʹ�õ�ʱ��Ӧ����DDS����ʱ��
//����һ��spi���ݴ���
//MSB32λ:  ��ʼ��־0x0123_4567
//16λ��    ѡ��CH1����     1�����Ҳ� 2������ 3�����ǲ� 4����ݲ�
//16λ��    ѡ��CH2����
//32λ��    CH1����
//32λ��    CH1Ƶ��
//32λ��    CH1��λ
//32λ��    CH2����
//32λ��    CH2Ƶ��
//32λ��    CH2��λ
//LSB32λ�� ������־0x89AB_CDEF
//------------------------
module read_write_data
(
    input               clk,                     
    input               rst_n,  
    input               spi_sck,        //spiʱ����   
    input               spi_cs_n,       //����Ƭѡ��(�͵�ƽ��Ч)
    input               spi_mosi,       //FPGA���գ�MCU��������

    output              spi_miso,       //FPGA���ͣ�MCU��������
    output              change_flag,    //���ݽ��ս��������һ�θߵ�ƽ�����ڶ���λ�ۼ��������������
    output reg [15:0]   ch1_wave,       //ѡ��CH1ͨ������ 1�����Ҳ� 2������ 3�����ǲ� 4����ݲ�
    output reg [15:0]   ch2_wave,       //ѡ��CH2ͨ������
    output reg [31:0]   amp1,           
    output reg [31:0]   freq1,
    output reg [31:0]   phase1,
    output reg [31:0]   amp2,
    output reg [31:0]   freq2,
    output reg [31:0]   phase2

);
//------------------------
wire            spi_done;   //���������־,�����ص�ʱ��,��������,���з������ݵĸ���
wire [15:0]     spi_data;   //һ��SPI���յ�������

reg [32*7-1:0]  receive_data;//���յ�������
reg             read_done;   //����������ɱ�־(������)
//------------------------
//����������ɺ�Ҫ�͵�DDS�ڲ������λ�ۼ�������
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

assign change_flag = change_flag_r1  & !change_flag_r2;	//���������Ϊ��    
//------------------------
//��MCU����spiͨ��
spi_stm32 u_spi_stm32(
	.rst_n          (rst_n),            //ϵͳ��λ	    
	.clk            (clk),              //ϵͳʱ��
	.spi_sdi        (spi_mosi),         //FPGA���գ�MCU��������        
	.spi_cs_n       (spi_cs_n),         //����Ƭѡ��(�͵�ƽ��Ч)                             
	.spi_sck        (spi_sck),          //spiʱ����        
    .txd_data       (),                 //FPGAҪ���͸�MCU������,�����ⲿҪ��0            

    .spi_sdo	    (),                 //FPGA���ͣ�MCU��������
    .rxd_data       (spi_data),         //FPGA���յ�MCU������,Ĭ��0
    .flag_done      (spi_done)          //���������־,�����ص�ʱ��,��������,���з������ݵĸ���
);
//------------------------
//������Ч����(������ͬ������)
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
// ��ȡ����
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
            5'd2    :   begin receive_data[16*14-1:16*13] <= spi_data; i <= i + 1;end//������Ч����
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
