module LED_State(LEDR1,LEDL1,LEDR2,LEDL2,CS,NS);
	input LEDR1,LEDL1,LEDR2,LEDL2;
	input [5:0]CS;
	output [5:0]NS;
	reg [5:0]NS;
	always @(CS,LEDR1,LEDL1,LEDR2,LEDL2)
		case(CS)
			6'B000000  :if(LEDR1==1'B1) 
							NS<=6'B000001; 
						else if(LEDL1==1'B1) 
							NS<=6'B100000;
						else 
							NS<=6'B000000;
			6'B000001  :if(LEDR1==1'B1) 
							NS<=6'B000010; 
						else if(LEDL1==1'B1||LEDL2==1'B1) 
							NS<=6'B000000;
						else 
							NS<=6'B000000;
			6'B000010 	:if(LEDR2==1'B1) 
							NS<=6'B010000;
						 else if(LEDR1==1'B1) 
							NS<=6'B000100; 
						 else if(LEDL1==1'B1||LEDL2==1'B1) 
							NS<=6'B000001;
						 else 
							NS<=6'B000000;
			6'B000100  :if(LEDR2==1'B1)
							NS<=6'B010000;
						else if(LEDR1==1'B1) 
							NS<=6'B001000; 
						else if(LEDL1==1'B1) 
							NS<=6'B000010;
						else 
							NS<=6'B000000;
			6'B001000  :if(LEDR1==1'B1) 
							NS<=6'B010000; 
						else if (LEDL2==1'B1)
							NS<=6'B000010;
						else if(LEDL1==1'B1) 
							NS<=6'B000100;
						else 
							NS<=6'B000000;
			6'B010000  :if(LEDR1==1'B1||LEDR2==1'B1) 
							NS<=6'B100000;
						else if(LEDL2==1'B1)
							NS<=6'B000010;
						else if(LEDL1==1'B1) 
							NS<=6'B001000;
						else 
							NS<=6'B000000;
			6'B100000  :if(LEDR1==1'B1||LEDR2==1'B1) 
							NS<=6'B000000; 
						else if(LEDL1==1'B1) 
							NS<=6'B010000;
						else 
							NS<=6'B000000;		  			  
			default  :NS<=6'B000000;
		endcase
endmodule
	