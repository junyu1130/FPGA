module smg_interface
(
	input CLK,
	input RSTn,
	input [23:0]Number_Sig,
	output [7:0]SMG_Data,//输出段选信号（ LEDA .. LEDH）
	output [5:0]Scan_Sig//输出列扫描信号（ SEL0_T~SEL5_T）
);
/******************************************/
wire [23:0]Number_Data;

smg_control U1
(
	.CLK( CLK ),
	.RSTn( RSTn ),
	.Number_Sig( Number_Sig ), // input - from top
	.Number_Data( Number_Data ) // output - to U2
);

/******************************************/

smg_encode U2
(
	.CLK( CLK ),
	.RSTn( RSTn ),
	.Number_Data( Number_Data ), // input - from U2
	.SMG_Data( SMG_Data ) // output - to top
);

/*******************************************/
smg_scan U3
(
	.CLK( CLK ),
	.RSTn( RSTn ),
	.Scan_Sig( Scan_Sig ) // output - to top
);

/*******************************************/
endmodule











