//————————————————————————————————————————————————
//接收到数据位宽，要发送的数据位宽，可以在参数声明进行修改
//检测到flag_done上升沿的时候,锁存数据,进行发送数据的更新
//————————————————————————————————————————————————
module	spi(
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

//————————————————————————
parameter	DATA_WIDTH = 160;	//接收或发送数据的数据位宽

//————————————————————————
input							rst_n;			//系统复位	
input							clk;			//系统时钟
input							spi_sdi;		//FPGA接收，MCU发送数据
input							spi_cs_n;		//数据片选端(低电平有效)
input							spi_sck;		//spi时钟线
input		[DATA_WIDTH-1:0]	txd_data;		//FPGA要发送给MCU的数据,发完外部要置0

output reg						spi_sdo;		//FPGA发送，MCU接收数据
output reg	[DATA_WIDTH-1:0]	rxd_data;		//FPGA接收到MCU的数据,默认0
output reg						flag_done;		//FPGA接收或发送数据完毕

//————————————————————————
reg						cs_r1, cs_r2;			//数据片选(低电平有效) cs_r2打一拍
wire 					sck_up_flag;			//上升沿标志，接收数据
wire 					sck_down_flag;			//下降沿标志，发送数据
reg [DATA_WIDTH-1:0]	rxd_data_r;				//缓存接收到的数据

//————————————————————————
//检测数据片选(低电平有效)
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
//————————————————————————
//检测时钟线
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

assign sck_up_flag 	 = sck_r1  & !sck_r2;	//上升沿
assign sck_down_flag = !sck_r1 & sck_r2;	//下降沿

//————————————————————————
//接收数据
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		rxd_data_r <= 0;						
	else if (cs_r1 == 1'b0 && cs_r2 == 1'b0)//cs为低电平
		if (sck_up_flag)
			rxd_data_r[DATA_WIDTH-1:0] <= {rxd_data_r[DATA_WIDTH-2:0], spi_sdi};
		else 
			rxd_data_r[DATA_WIDTH-1:0] <= rxd_data_r[DATA_WIDTH-1:0];
	else if (cs_r1 == 1'b0 && cs_r2 == 1'b1)//下降沿
		rxd_data_r <= 0;
	else
		rxd_data_r <= rxd_data_r;
end

//————————————————————————
//发送数据
reg	[DATA_WIDTH-1:0]	txd_data_r;	//发送数据的缓存器
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		spi_sdo <= 1'b0;	//sdo默认为低电平
		txd_data_r <= 1'b0;
		end	
	else
		if (cs_r1 == 1'b0 && cs_r2 == 1'b0)	//cs为低电平
			if (sck_down_flag) begin//时钟线下降沿
				spi_sdo <= txd_data_r[DATA_WIDTH-1];	//先发送最高位
				txd_data_r[DATA_WIDTH-1:0] <= {txd_data_r[DATA_WIDTH-2:0],1'b0};//依次左移
				end	
			else begin//保持
				spi_sdo <= spi_sdo;
				txd_data_r[DATA_WIDTH-1:0] <= txd_data_r[DATA_WIDTH-1:0];
				end
		else if (cs_r1 == 1'b0 && cs_r2 == 1'b1) begin//在cs下降沿的时候,获取要输出的数据
			spi_sdo <= spi_sdo;
			txd_data_r[DATA_WIDTH-1:0] <= txd_data[DATA_WIDTH-1:0];
			end
		else begin//保持
			spi_sdo <= spi_sdo;
			txd_data_r[DATA_WIDTH-1:0] <= txd_data_r[DATA_WIDTH-1:0];
			end
end

//————————————————————————
//在cs上升沿的时候,将接收到的数据锁存
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		rxd_data <= 1'b0;//接收到的数据默认情况下是0
	else if (cs_r1 == 1'b1 && cs_r2 == 1'b0)//cs上升沿
		rxd_data <= rxd_data_r;
	else 
		rxd_data <= 0;
end
//————————————————————————
//在cs上升沿的时候,结束标志flag_done置1
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
		flag_done <= 1'b0;
	else if (cs_r1 == 1'b1 && cs_r2 == 1'b0)//cs上升沿
		flag_done <= 1'b1;
	else 
		flag_done <= 1'b0;
end

endmodule
