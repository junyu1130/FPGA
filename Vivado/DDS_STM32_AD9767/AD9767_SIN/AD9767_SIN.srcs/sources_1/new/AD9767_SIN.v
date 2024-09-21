`timescale 1ns / 1ps

module AD9767_SIN
(
    input                            sys_clk,                 //system clock 50Mhz on board
    input                            rst_n,
    output                           da1_clk,                 //AD9767 CH1 clock
    output                           da1_wrt,                 //AD9767 CH1 enable
    output [13:0]                    da1_data,                //AD9767 CH1 data output
    output                           da2_clk,                 //AD9767 CH2 clock
    output                           da2_wrt,	              //AD9767 CH2 enable
    output [13:0]                    da2_data                 //AD9767 CH2 data output
);

reg [9:0]                        rom_addr;               //Store the ROM address of the DA data
wire [13:0]                      rom_data;               //ROM data of DA 
wire                             clk_100M;               //clock for DA data processing

assign da1_clk=clk_100M;
assign da1_wrt=da1_clk;
assign da1_data=rom_data;

assign da2_clk=clk_100M;
assign da2_wrt=da2_clk;
assign da2_data=rom_data;

/*************************************************************************
Generate the frequency of DA
****************************************************************************/
always @(posedge clk_100M or negedge rst_n)
begin
    if(!rst_n)
        rom_addr <= 10'b0;
    else
        rom_addr <= rom_addr + 1'b1 ;                             //The output sine wave frequency is 122Khz
        // rom_addr <= rom_addr + 4 ;                             //The output sine wave frequency is 488Khz
        // rom_addr <= rom_addr + 128 ;                           //The output sine wave frequency is 15.6Mhz								
end 
/*************************************************************************
Read sine wave data in ROM
****************************************************************************/
rom_ip rom_ip_inst
(
    .clka                           (clk_100M                ), 
    .addra                          (rom_addr                ), 
    .douta                          (rom_data                ) 
);
/*************************************************************************
Generate the clock  required for DA
****************************************************************************/
clk_wiz_0 clk_wiz_0_inst
(
    .clk_in1                        (sys_clk                 ),     
    .clk_out1                       (clk_100M                ),         
    .reset                          (1'b0                    ),   
    .locked                         (                        )
);      

/*************************************************************************
Analyze data from user defined ports for the xilinx ila module
****************************************************************************/ 
ila_0 ila_m0 
(
    .clk(sys_clk), // input wire clk
    .probe0(da1_data) // input wire [13:0] probe0
);

endmodule
