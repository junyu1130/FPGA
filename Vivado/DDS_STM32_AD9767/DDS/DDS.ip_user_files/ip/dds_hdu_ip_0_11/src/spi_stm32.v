//------------------------------------------------
//���յ�����λ��Ҫ���͵�����λ�������ڲ������������޸�
//��⵽flag_done�����ص�ʱ��,��������,���з������ݵĸ���
//------------------------------------------------
module spi_stm32
(
	rst_n,
	clk,
	spi_sdi,
	spi_cs_n,
	spi_sck,
	txd_data,

	rxd_data,
	spi_sdo,
	flag_done
);
//------------------------
parameter	DATA_WIDTH = 16;	//���ջ������ݵ�����λ��
//------------------------
input							rst_n;			//ϵͳ��λ	
input							clk;			//ϵͳʱ��
input							spi_sdi;		//FPGA���գ�MCU��������
input							spi_cs_n;		//����Ƭѡ��(�͵�ƽ��Ч)
input							spi_sck;		//spiʱ����
input		[DATA_WIDTH-1:0]	txd_data;		//FPGAҪ���͸�MCU������,�����ⲿҪ��0

output reg						spi_sdo;		//FPGA���ͣ�MCU��������
output reg	[DATA_WIDTH-1:0]	rxd_data;		//FPGA���յ�MCU������,Ĭ��0
output reg						flag_done;		//FPGA���ջ����������
//------------------------
reg						cs_r1, cs_r2;			//����Ƭѡ(�͵�ƽ��Ч) cs_r2��һ��
wire 					sck_up_flag;			//�����ر�־����������
wire 					sck_down_flag;			//�½��ر�־����������
//------------------------
//�������Ƭѡ(�͵�ƽ��Ч)
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		cs_r1 <= 1'b0;
		cs_r2 <= 1'b0;
	end 
	else begin
		cs_r1 <= spi_cs_n;
		cs_r2 <= cs_r1;
	end
end
//------------------------
//���ʱ����
reg	sck_r1, sck_r2;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		sck_r1 <= 1'b0;
		sck_r2 <= 1'b0;
	end 
	else begin
		sck_r1 <= spi_sck;
		sck_r2 <= sck_r1;
	end
end

assign sck_up_flag 	 = sck_r1  & !sck_r2;	//������
assign sck_down_flag = !sck_r1 & sck_r2;	//�½���
//------------------------
//��������
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		rxd_data <= 0;						
	else if (cs_r1 == 1'b0 && cs_r2 == 1'b0)//csΪ�͵�ƽ
		if (sck_up_flag)
			rxd_data[DATA_WIDTH-1:0] <= {rxd_data[DATA_WIDTH-2:0], spi_sdi};
		else 
			rxd_data[DATA_WIDTH-1:0] <= rxd_data[DATA_WIDTH-1:0];
	else if (cs_r1 == 1'b0 && cs_r2 == 1'b1)//�½���
		rxd_data <= 0;
	else
		rxd_data <= rxd_data;
end
//------------------------
//��������
reg	[DATA_WIDTH-1:0]	txd_data_r;	//�������ݵĻ�����
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		spi_sdo <= 1'b0;	//sdoĬ��Ϊ�͵�ƽ
		txd_data_r <= 1'b0;
		end	
	else
		if (cs_r1 == 1'b0 && cs_r2 == 1'b0)	//csΪ�͵�ƽ
			if (sck_down_flag) begin//ʱ�����½���
				spi_sdo <= txd_data_r[DATA_WIDTH-1];	//�ȷ������λ
				txd_data_r[DATA_WIDTH-1:0] <= {txd_data_r[DATA_WIDTH-2:0],1'b0};//��������
				end	
			else begin//����
				spi_sdo <= spi_sdo;
				txd_data_r[DATA_WIDTH-1:0] <= txd_data_r[DATA_WIDTH-1:0];
				end
		else if (cs_r1 == 1'b0 && cs_r2 == 1'b1) begin//��cs�½��ص�ʱ��,��ȡҪ���������
			spi_sdo <= spi_sdo;
			txd_data_r[DATA_WIDTH-1:0] <= txd_data[DATA_WIDTH-1:0];
			end
		else begin//����
			spi_sdo <= spi_sdo;
			txd_data_r[DATA_WIDTH-1:0] <= txd_data_r[DATA_WIDTH-1:0];
			end
end
//------------------------
//��cs�����ص�ʱ��,������־flag_done��1
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		flag_done <= 1'b0;
	else if (cs_r1 == 1'b1 && cs_r2 == 1'b0)//cs������
		flag_done <= 1'b1;
	else 
		flag_done <= 1'b0;
end

endmodule