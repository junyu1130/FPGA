module AES_top
(
	input clk,
	input rst_n,
	input [127 : 0] iKey,//密钥
	input [127 : 0] iPlaintext,//明文
    
	output [127 : 0] oCiphertext,//密文
    output [127 : 0] oPlaintext//明文
);

wire [127 : 0] iCiphertext = oCiphertext;

AES_encryp AES_encryp_inst1
(
   .clk            (clk        ),
   .rst_n          (rst_n      ),
   .iKey           (iKey       ),
   .iPlaintext     (iPlaintext ),

   .oCiphertext    (oCiphertext)
);

 AES_decrypt  AES_decrypt_inst1 
 (
     .clk            (clk        ),
     .rst_n          (rst_n      ),
     .iKey           (iKey       ),
     .iCiphertext    (iCiphertext),

     .oPlaintext     (oPlaintext )
 );

endmodule
