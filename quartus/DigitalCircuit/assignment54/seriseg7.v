module seriseg7(clk_in,clk_out,data_in,data);
	input clk_in;//输入的20M的时钟
	output clk_out;//输出的80K时钟（受到控制）
	output reg data;//输出的数据线
	reg clk_80K;
	input [27:0] data_in;//输入的7位显示的数字
	reg[7:0] pre_data,dig;//临时变量和段码
	reg[15:0] state;//状态机
	reg clk_en;//输出时钟控制
	
	assign clk_out =~( clk_en? clk_80K:clk_out);//输出时钟控制，当clk_en=1，clk_out=clk_80K，按80k频率变化，否则不变
	//相关变量的初始化
	initial state = 11'd0;//停留2k-56个时钟
	
		reg [31:0] clk_cnt;
	//用于时钟分频的计数器
	
	always@(posedge clk_in)
	begin
		if(clk_cnt==32'd124)//每半周期取反一次，获得80K的时钟
		begin
			clk_cnt = 32'd0;
			clk_80K = ~clk_80K;
		end
		else
		begin
			clk_cnt = clk_cnt+32'd1;
			clk_80K = clk_80K;
		end
	end
	
	always@(posedge clk_80K)
	begin
		if(state / 8 < 7)//在56个时钟内
		begin
			clk_en = 1'b1;//打开输出的时钟
			case(state / 8)//取出每个数码管单独的数字
					0:pre_data = data_in[3:0];
					1:pre_data = data_in[7:4];
					2:pre_data = data_in[11:8];
					3:pre_data = data_in[15:12];
					4:pre_data = data_in[19:15];
					5:pre_data = data_in[23:20];
					6:pre_data = data_in[27:24];
			endcase
		
			case(state % 8)//发送每个数码管对应数字对应的段码
				16'd0:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd1:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd2:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd3:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd4:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd5:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd6:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end
				
				16'd7:
				begin
					data =dig[16'd7-state];
					state = state + 16'd1;
				end	
			endcase
			
		end
		else //维持一定时间显示
		begin
			state = state + 16'd1;
			clk_en = 1'b0;//断掉输出的时钟
		end
		
	end
	
	always@(*)
	begin
		case(pre_data)//以下为数字0-9的段码
			0:dig=8'b0011_1111;
			1:dig=8'b0000_0110;
			2:dig=8'b0101_1011;
			3:dig=8'b0100_1111;
			4:dig=8'b0110_0110;
			5:dig=8'b0110_1101;
			6:dig=8'b0111_1101;
			7:dig=8'b0000_0111;
			8:dig=8'b0111_1111;
			9:dig=8'b0110_1111;
			10:dig=8'b0111_0111;
			11:dig=8'b0111_1100;
			12:dig=8'b0011_1001;
			13:dig=8'b0101_1110;
			14:dig=8'b0111_1001;
			15:dig=8'b0000_0000;//如果输入数据为1111，则不显示。
			default:dig=8'b0000_0000;
		endcase
	end
	
endmodule