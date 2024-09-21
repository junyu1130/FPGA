//~ `New testbench
`timescale  1ns / 1ps

module vtf_AD9767_SIN;

// AD9767_SIN Parameters
parameter PERIOD  = 10;


// AD9767_SIN Inputs
reg   sys_clk                              = 0 ;
reg   rst_n                                = 0 ;

// AD9767_SIN Outputs
wire  da1_clk                              ;
wire  da1_wrt                              ;
wire  [13:0]  da1_data                     ;
wire  da2_clk                              ;
wire  da2_wrt                              ;
wire  [13:0]  da2_data                     ;


initial
begin
    forever #(PERIOD/2)  sys_clk=~sys_clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

AD9767_SIN  u_AD9767_SIN (
    .sys_clk                 ( sys_clk          ),
    .rst_n                   ( rst_n            ),

    .da1_clk                 ( da1_clk          ),
    .da1_wrt                 ( da1_wrt          ),
    .da1_data                ( da1_data  [13:0] ),
    .da2_clk                 ( da2_clk          ),
    .da2_wrt                 ( da2_wrt          ),
    .da2_data                ( da2_data  [13:0] )
);

initial
begin

    $finish;
end

endmodule
