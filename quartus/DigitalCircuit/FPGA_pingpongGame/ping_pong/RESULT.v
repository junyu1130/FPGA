module RESULT(RESULTE,SCOREA,SCOREB,RESULT);
	input RESULTE;
	input [3:0]SCOREA,SCOREB;
	output [3:0]RESULT;
	reg [3:0]RESULT;
	always @(RESULTE,SCOREA,SCOREB)
		case(RESULTE)
			1'B1   :if(SCOREA==4'B1001) 
						RESULT<=4'B1010;
			        else 
						RESULT<=4'B1011;
			1'B0   :RESULT<=4'B0000;
			default:RESULT<=4'B0000;
		endcase
endmodule 