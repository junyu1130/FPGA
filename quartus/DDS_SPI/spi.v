/*==============================================
*	描    述:spi
*	说	  明:高位在前,低位在后.想要知道接收到的数据是否是刚发的,可以通过spi_cs_wr上升沿判断.
*	备	  注:只有在data_done(cmd_done)为高电平的时候,读到的数据(命令)才是正确的
//==============================================*/
module	spi
(
	rst,
	clk,
	spi_sdi,
	spi_sdo,
	spi_cs_data,
	spi_cs_cmd,
	spi_sck,
	txd_data,
	rxd_data,
	dcmd,
	data_done,
	cmd_done
);
parameter	data_width=32;	//接收或发送数据的数据位宽
parameter	cmd_width=8;	//接收到命令的数据位宽	

input	rst;	//系统复位	
input	clk;	//系统时钟

input	spi_sdi;	//微处理器发送数据,FPGA接收
output	reg	spi_sdo;//微处理器接收数据,FPGA发送
input	spi_cs_data;	//数据片选端
input	spi_cs_cmd;	//命令片选端
input	spi_sck;	//spi时钟线
input	[data_width-1:0]	txd_data;	//FPGA要发送给微处理器的数据
output	reg	[data_width-1:0]	rxd_data;	//FPGA接收到微处理器的数据
output	reg	[cmd_width-1:0]	dcmd;		//FPGA接收到微处理器的命令

output	reg	data_done;		//FPGA接收或发送数据完毕
output	reg	cmd_done;		//FPGA接收命令完毕

reg	spi_cs_data_reg,spi_cs_data_reg1;
reg	spi_cs_cmd_reg,spi_cs_cmd_reg1;	
reg	spi_sck_reg,spi_sck_reg1;	
reg	scl_up_flag;	
reg	scl_down_flag;


//数据片选
always@(posedge clk)
begin
	if(!rst)
		begin
			spi_cs_data_reg1<=0;
		end
	else
		begin
			spi_cs_data_reg1<=spi_cs_data;
		end
end

always@(posedge clk)
begin
	if(!rst)
	begin
		spi_cs_data_reg<=0;
	end
	
	else
	begin
		spi_cs_data_reg<=spi_cs_data_reg1;
	end
end

//命令片选
always@(posedge clk)
begin
	if(!rst)
		begin
			spi_cs_cmd_reg1 <= 0;
		end
	else
		begin
			spi_cs_cmd_reg1 <= spi_cs_cmd;
		end
end

always@(posedge clk)
begin
	if(!rst)
		begin
			spi_cs_cmd_reg <= 0;
		end
	else
		begin
			spi_cs_cmd_reg <= spi_cs_cmd_reg1;
		end
end

//3
always@(posedge clk)
begin
	if(!rst)
		begin
			spi_sck_reg1 <= 0;
		end
	else
		begin
			spi_sck_reg1 <= spi_sck;
		end
end

always@(posedge clk)
begin
	if(!rst)
	begin
		spi_sck_reg<=0;
	end
	
	else
	begin
		spi_sck_reg<=spi_sck_reg1;
	end
end

//时钟线上升沿判断
always@(posedge clk)
begin
	if(!rst)
	begin
		scl_up_flag<=0;
	end
	
	else
	begin
		if(spi_sck_reg1==1&&spi_sck_reg==0)
		begin
			scl_up_flag<=1;
		end
		
		else
		begin
			scl_up_flag<=0;
		end
	end
end


//spi时钟线下降沿判断
always@(posedge clk)
begin
	if(!rst)
	begin
		scl_down_flag<=0;
	end
	
	else
	begin
		if(spi_sck_reg1==0&&spi_sck_reg==1)
		begin
			scl_down_flag<=1;
		end
		
		else
		begin
			scl_down_flag<=0;
		end
	end
end

//==========================================
//				接收命令
//==========================================
always@(posedge clk)
begin
	if(!rst)
	begin	
		dcmd<=0;	//接收到的命令默认情况下是0
	end
	
	else
	begin
		if(spi_cs_cmd_reg1==0 && spi_cs_cmd_reg==0)	//命令选中端为低电平
			begin
				if(scl_up_flag)	//时钟上升沿
				begin
					dcmd[cmd_width-1:0]<={dcmd[cmd_width-2:0],spi_sdi};
				end
				
				else
				begin
					dcmd[cmd_width-1:0]<=dcmd[cmd_width-1:0];
				end
			end
		else
		begin
			dcmd<=dcmd;
		end
	end
end

//在cs_cmd上升沿的时候,输出接收到的数据
always@(posedge clk)
begin
	if(!rst)
	begin
		cmd_done<=0;
	end
	
	else
	begin
		if(spi_cs_cmd_reg1==1&&spi_cs_cmd_reg==0)	//cs_cmd上升沿
		begin
			cmd_done<=1;
		end
		
		else
		begin
			cmd_done<=0;
		end
	end
end

//==========================================
//				接收数据
//==========================================
always@(posedge clk)
begin
	if(!rst)
		begin	
			rxd_data<=0;	//接收到的命令默认情况下是0
		end
	else
	begin
		if(spi_cs_data_reg1==0&&spi_cs_data_reg==0)	
			begin
				if(scl_up_flag)	
					begin
						rxd_data[data_width-1:0]<={rxd_data[data_width-2:0],spi_sdi};
					end
				else
					begin
						rxd_data[data_width-1:0]<=rxd_data[data_width-1:0];
					end
			end
		else
			begin
				rxd_data<=rxd_data;
			end
	end
end

//接收数据或命令完成标记
always@(posedge clk)
begin
	if(!rst)
		begin
			data_done<=0;
		end
	else
		begin
			if(spi_cs_data_reg1==1&&spi_cs_data_reg==0)	
				begin
					data_done<=1;
				end
			else
				begin
					data_done<=0;
				end
		end
end


//==========================================
//				发送数据
//==========================================
reg	[data_width-1:0]	txd_data_reg;	//发送数据的缓存器
always@(posedge clk)
begin
	if(!rst)
	begin
		spi_sdo<=0;		//sdo默认为低电平
		txd_data_reg<=0;
	end
	
	else
	begin
		if(spi_cs_data_reg1==0&&spi_cs_data_reg==0)
		begin
			if(scl_down_flag)
			begin
				spi_sdo<=txd_data_reg[data_width-1];	//先发送最高位
				txd_data_reg[data_width-1:0]<={txd_data_reg[data_width-2:0],1'b0};//进行左移
			end
			
			else
			begin
				spi_sdo<=spi_sdo;
				txd_data_reg[data_width-1:0]<=txd_data_reg[data_width-1:0];
			end
		end
		
		else if(spi_cs_data_reg1==0&&spi_cs_data_reg==1)
		begin
			spi_sdo<=spi_sdo;
			txd_data_reg[data_width-1:0]<=txd_data[data_width-1:0];	//在高电平的时候,获取要输出的数据
		end
		
		else
		begin
			spi_sdo<=spi_sdo;
			txd_data_reg[data_width-1:0]<=txd_data_reg[data_width-1:0];
		end
	end
end

endmodule
