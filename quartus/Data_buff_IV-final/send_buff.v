module send_buff(
	clk,
	rst_n,
	cs,
	buff,
	buff_full,
	Data_out
);
input clk;
input rst_n;
input cs;
input buff;
input buff_full;
output reg Data_out;


always@(posedge clk or negedge rst_n) 
begin
	if (!rst_n) begin
		Data_out <= 16'b0;	//sdo默认为低电平
		txd_data_r <= 16'b0;
		send_cnt<=0;
		end	
//	else if (buff_full)
//	else if (send_cnt==1023)
	else if (send_cnt<1023)
	
		if (cs_r1 == 1'b0 && cs_r2 == 1'b0)	//cs为低电平
			Data_out<=;
		
		else if (cs_done) begin//在cs下降沿的时候,获取要输出的数据
			txd_data_r[48:0] <= buff[16383:16383-15];
			buff<= buff<<16;
			send_cnt<=send_cnt+1;
			end
		else begin//保持
			Data_out <= Data_out;
			buff<=buff;
			end
end

endmodule
