module seriseg7(clk_in,clk_out,data_in,data);
	input clk_in;//�����20M��ʱ��
	output clk_out;//�����80Kʱ�ӣ��ܵ����ƣ�
	output reg data;//�����������
	reg clk_80K;
	input [27:0] data_in;//�����7λ��ʾ������
	reg[7:0] pre_data,dig;//��ʱ�����Ͷ���
	reg[15:0] state;//״̬��
	reg clk_en;//���ʱ�ӿ���
	
	assign clk_out =~( clk_en? clk_80K:clk_out);//���ʱ�ӿ��ƣ���clk_en=1��clk_out=clk_80K����80kƵ�ʱ仯�����򲻱�
	//��ر����ĳ�ʼ��
	initial state = 11'd0;//ͣ��2k-56��ʱ��
	
		reg [31:0] clk_cnt;
	//����ʱ�ӷ�Ƶ�ļ�����
	
	always@(posedge clk_in)
	begin
		if(clk_cnt==32'd124)//ÿ������ȡ��һ�Σ����80K��ʱ��
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
		if(state / 8 < 7)//��56��ʱ����
		begin
			clk_en = 1'b1;//�������ʱ��
			case(state / 8)//ȡ��ÿ������ܵ���������
					0:pre_data = data_in[3:0];
					1:pre_data = data_in[7:4];
					2:pre_data = data_in[11:8];
					3:pre_data = data_in[15:12];
					4:pre_data = data_in[19:15];
					5:pre_data = data_in[23:20];
					6:pre_data = data_in[27:24];
			endcase
		
			case(state % 8)//����ÿ������ܶ�Ӧ���ֶ�Ӧ�Ķ���
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
		else //ά��һ��ʱ����ʾ
		begin
			state = state + 16'd1;
			clk_en = 1'b0;//�ϵ������ʱ��
		end
		
	end
	
	always@(*)
	begin
		case(pre_data)//����Ϊ����0-9�Ķ���
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
			15:dig=8'b0000_0000;//�����������Ϊ1111������ʾ��
			default:dig=8'b0000_0000;
		endcase
	end
	
endmodule