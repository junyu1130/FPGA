module SPI_count(
	output reg [15:0] dd,
	input	clk	//系统时钟
);

reg [31:0] d;

always @(posedge clk)
	begin
		if(d==500000)
			dd=dd+1;
		else
			dd<=dd;
	end
	
	
always @(posedge clk)
	begin
		if(d==500000)
			d<=0;
		else 
			d<=d+1;
	end
	
	
endmodule 