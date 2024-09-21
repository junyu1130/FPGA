module CNT10
(
	input CLK,EN,RST,LOAD,
	input [3:0]DATA,
	output reg [3:0]DOUT,
	output COUT
);

always @(posedge CLK, negedge RST)
begin
	if(!RST)
		DOUT <= 0;
	else if(EN)
	begin 
		if(!LOAD)
			DOUT <= DATA;
		else if(DOUT < 9)
			DOUT <= DOUT + 1'b1;
		else 
			DOUT <= 0;
	end
end

assign COUT = (DOUT == 9);

endmodule

