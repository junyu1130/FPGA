`timescale 10ns/100ps

module vga_disp_tb();

reg clk;
reg reset_n;
wire VGA_HSYNC;
wire VGA_VSYNC;
wire [11:0] VGA_D;

VGA_Display u_VGA_Display
(
	.clk(clk),
	.reset_n(reset_n),
	.VGA_HSYNC(VGA_HSYNC),
	.VGA_VSYNC(VGA_VSYNC),
	.VGA_D(VGA_D)
);

initial
begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial
begin
	reset_n = 0;
	#15 reset_n = 1'b1;
	#4200000 $stop; //显示一帧图像
end

endmodule
