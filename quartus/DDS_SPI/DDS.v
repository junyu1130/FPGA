module DDS 
(
	input clk,
	input rst_n,
	input [31:0]fword,
	output [7:0]addr  //有效地址
);

reg [31:0] addr_num;//地址计数器
assign addr = addr_num[31:24];//地址计数器

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)//复位时，addr清零
	begin
		addr_num[31:0] <= 32'd0;
	end  
	else
		addr_num <= addr_num + fword;
end	

endmodule 
