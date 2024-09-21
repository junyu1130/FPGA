module CDEC(Q,AG,AY,AR,BG,BY,BR,DigitalA,DigitalB);//控制译码器
input [5:0] Q;
output reg AG, AY, AR, BG, BY, BR;
output reg [3:0] DigitalA, DigitalB;

always @(Q)
    case (Q)
        6'B000000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 2; DigitalB = 0;end   
        6'B000001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 9;end    
        6'B000010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 8;end    
        6'B000011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 7;end
        6'B000100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 6;end
        6'B000101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 5;end   
        6'B000110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 4;end    
        6'B000111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 3;end    
        6'B001000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 2;end   
        6'B001001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 1;end    
        6'B001010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 1; DigitalB = 0;end    
        6'B001011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 9;end
        6'B001100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 8;end
        6'B001101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 7;end  
        6'B001110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 6;end  
        6'B001111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 5;end
        6'B010000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 4;end  
        6'B010001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 3;end   
        6'B010010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 2;end   
        6'B010011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B100001; DigitalA = 0; DigitalB = 1;end
        6'B010100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B010001; DigitalA = 0; DigitalB = 4;end
        6'B010101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B010001; DigitalA = 0; DigitalB = 3;end   
        6'B010110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B010001; DigitalA = 0; DigitalB = 2;end    
        6'B010111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B010001; DigitalA = 0; DigitalB = 1;end    
        6'B011000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 2; DigitalB = 4;end   
        6'B011001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 2; DigitalB = 3;end    
        6'B011010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 2; DigitalB = 2;end    
        6'B011011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 2; DigitalB = 1;end
        6'B011100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 2; DigitalB = 0;end
        6'B011101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 9;end   
        6'B011110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 8;end    
        6'B011111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 7;end
        6'B100000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 6;end   
        6'B100001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 5;end    
        6'B100010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 4;end    
        6'B100011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 3;end
        6'B100100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 2;end
        6'B100101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 1;end   
        6'B100110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 1; DigitalB = 0;end    
        6'B100111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 0; DigitalB = 9;end    
        6'B101000   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 0; DigitalB = 8;end   
        6'B101001   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 0; DigitalB = 7;end    
        6'B101010   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 0; DigitalB = 6;end    
        6'B101011   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001100; DigitalA = 0; DigitalB = 5;end
        6'B101100   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001010; DigitalA = 0; DigitalB = 4;end
        6'B101101   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001010; DigitalA = 0; DigitalB = 3;end   
        6'B101110   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001010; DigitalA = 0; DigitalB = 2;end    
        6'B101111   :   begin {AG,AY,AR,BG,BY,BR} = 6'B001010; DigitalA = 0; DigitalB = 1;end 
        default     :   begin {AG,AY,AR,BG,BY,BR} = 6'B000000; DigitalA = 0; DigitalB = 0;end     
    endcase
endmodule
