module speak
(
	input 			clk,
	input [10:0]	TN,
	output reg 		SPKS
);
	
reg [10:0] CNT11;

always @(posedge clk)
begin : CNT11B_LOAD//11位可预置计数器
	if(CNT11==11'h7FF) 
	begin
		CNT11 = TN;
		SPKS <= 1'b1;
	end
	else
	begin 
		CNT11 = CNT11 + 1;
		SPKS <= 1'b0;
	end
end

endmodule
		
				