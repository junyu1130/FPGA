module am_wave(

	input clk,
	input rst_n,
	input [31:0]depth,
	input [7:0]carrier,
	output   [7:0]am_out
);

	wire  [7:0]modula;							//1Khz调制波
	wire signed [8:0]modula_out;				//有符号1Khz调制波
	assign modula_out={1'b0,modula}-9'h80;
	
	wire signed [8:0]carrier_out;
	assign carrier_out={1'b0,carrier}-9'h80;
	
	wire [7:0] addr;
	reg signed [8:0]depth_con;				//调制深度
	
	//-------中间结果-----//
	wire signed [8:0] result1_singed;    
	wire signed [17:0]result1,result2;
	
	
	
	CNT256 u_CNT(
	.clk_256	(clk),
	.reset_n	(rst_n),
	.q			(addr)
	);
	
	ROM_sin rom_sin(
		.address	(addr),
		.clock	(clk),
		.q			(modula)
	);
	
    always@(posedge clk)         //设置调制深度
    begin
//       case (depth)
//				0:  depth_con = 0 ;       //调制深度为0，直流分量对应值
//				1:  depth_con = 15'd1638;       //调制深度为0.1，直流分量对应值
//				2:  depth_con = 15'd3277;       //调制深度为0.2，直流分量对应值
//				3:  depth_con = 15'd4915;       //调制深度为0.3，直流分量对应值
//				4:  depth_con = 15'd6554;       //调制深度为0.4，直流分量对应值
//            5:  depth_con = 15'd8192;       //调制深度为0.5，直流分量对应值
//            6:  depth_con = 15'd9830;       //调制深度为0.6，直流分量对应值
//            7:  depth_con = 15'd11469;       //调制深度为0.7，直流分量对应值  
//            8:  depth_con = 15'd13107;       //调制深度为0.8，直流分量对应值               
//            9:  depth_con = 15'd14746;       //调制深度为0.9.，直流分量对应值
//            10:  depth_con = 15'd16383;       //调制深度为1，直流分量对应值   
       case (depth)
            0:  depth_con <= 0 ;       //调制深度为0，直流分量对应值
            1:  depth_con <= 13;       //调制深度为0.1，直8流分量对应值
            2:  depth_con <= 28;       //调制深度为0.2，直流分量对应值
            3:  depth_con <= 45;       //调制深度为0.3，直流分量对应值
            4:  depth_con <= 64;       //调制深度为0.4，直流分量对应值
            5:  depth_con <= 85;       //调制深度为0.5，直流分量对应值
            6:  depth_con <= 110;       //调制深度为0.6，直流分量对应值
            7:  depth_con <= 138;       //调制深度为0.7，直流分量对应值  
            8:  depth_con <= 171;       //调制深度为0.8，直流分量对应值               
            9:  depth_con <= 209;       //调制深度为0.9.，直流分量对应值
            10:  depth_con <= 255;       //调制深度为1，直流分量对应值     
       endcase
    end
	 //--------调制波×调制深度（17位有符号输出）-------//
		multi mult_1(
		.dataa(modula_out),
		.datab(depth_con),
		.result(result1)
		);
		
		
		
		//-------1Khz调制波×载波----------//
		multi mult_2(
		.dataa(result1_singed),
		.datab(carrier_out),
		.result(result2)
		);
		

		assign result1_singed =(result1>>8)+9'h7F;
		assign am_out=(result2>>8)+9'h80;


//		assign am_out=(result1>>8)+9'h80;
		
		
		
		
//assign am_out=result1>>8+15'h1FFF;  自己好好看看 >>的优先级很低的！！！
//assign am_out=result_4[13:0];
//	assign am_out= (carrier*modula_out)>>14;
endmodule 

