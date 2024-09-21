//~ `New testbench
`timescale  1ns / 1ps

module VGA_tb;

// VGA Parameters
parameter PERIOD  = 10;


// VGA Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;

// VGA Outputs
wire  VGA_hsync                            ;    
wire  VGA_vsync                            ;    
wire  VGA_de                               ;    
wire  VGA_idck                             ;    
wire  [23:0]  VGA_out                      ;    


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

VGA  u_VGA (
    .clk                     ( clk               ),
    .rst_n                   ( rst_n             ),

    .VGA_hsync               ( VGA_hsync         ),
    .VGA_vsync               ( VGA_vsync         ),
    .VGA_de                  ( VGA_de            ),
    .VGA_idck                ( VGA_idck          ),
    .VGA_out                 ( VGA_out    [23:0] )
);

initial
begin

    $finish;
end

endmodule
