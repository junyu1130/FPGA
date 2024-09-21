module SREG(CS,NS,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,SCOREA,SCOREB,LED);
	input [2:0]CS;
	input KEY1,KEY2,KEY3,KEY4,KEY5,KEY6;
	input [3:0]SCOREA,SCOREB;
	input [5:0]LED;
	output [2:0]NS;
	reg [2:0]NS;
	always @(KEY1,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,SCOREA,SCOREB,LED,CS)
		case(CS)
			3'B000  :if(SCOREA==4'B1001||SCOREB==4'B1001) 
						NS<=3'B101; 
					else if(KEY1==1'B1) 
						NS<=3'B001;
					else if (KEY2==1'B1) 
						NS<=3'B010;
					else 
						NS<=3'B000;
			3'B001  :if(KEY6==1'B1&&(LED==6'B001000||LED==6'B010000))
						NS<=3'B111;
					else if(KEY6==1'B1&&(LED==6'B000100||LED==6'B000010))
						NS<=3'B011;
					else if(KEY4==1'B1&&(LED==6'B001000||LED==6'B010000)) 
						NS<=3'B010;
					else if(KEY4==1'B1&&(LED==6'B000100||LED==6'B000010)) 
						NS<=3'B011;
					else if(LED==6'B100000) 
						NS<=3'B011; 
					else 
						NS<=3'B001;
			3'B010  :if(KEY5==1'B1&&(LED==6'B000010||LED==6'B000100))
						NS<=3'B110;
					else if(KEY5==1'B1&&(LED==6'B001000||LED==6'B010000))
						NS<=3'B100;
					else if(KEY3==1'B1&&(LED==6'B000010||LED==6'B000100)) 
						NS<=3'B001;
					else if(KEY3==1'B1&&(LED==6'B001000||LED==6'B010000)) 
						NS<=3'B100;
					else if(LED==6'B000001) 
						NS<=3'B100;
					else 
						NS<=3'B010;
			3'B011  :NS<=3'B000;
			3'B100  :NS<=3'B000;
			3'B101  :NS<=3'B101;
			3'B110  :if(KEY6==1'B1&&(LED==6'B001000||LED==6'B010000))
						NS<=3'B111;
					else if(KEY6==1'B1&&(LED==6'B000100||LED==6'B000010))
						NS<=3'B011;
					else if(KEY4==1'B1&&(LED==6'B001000||LED==6'B010000)) 
						NS<=3'B010;
					else if(KEY4==1'B1&&(LED==6'B000100||LED==6'B000010)) 
						NS<=3'B011;
					else if(LED==6'B100000) 
						NS<=3'B011; 
					else 
						NS<=3'B110;
			3'B111  :if(KEY5==1'B1&&(LED==6'B000010||LED==6'B000100))
						NS<=3'B110;
					else if(KEY5==1'B1&&(LED==6'B001000||LED==6'B010000))
						NS<=3'B100;
					else if(KEY3==1'B1&&(LED==6'B000010||LED==6'B000100)) 
						NS<=3'B001;
					else if(KEY3==1'B1&&(LED==6'B001000||LED==6'B010000)) 
						NS<=3'B100;
					else if(LED==6'B000001) 
						NS<=3'B100;
					else 
						NS<=3'B111;  
			default :NS<=3'B000;
		endcase
endmodule
			