module vga_top(	input							MAX10_CLK1_50, Reset,

						output	logic	[9:0]		DrawX, DrawY, tempX, tempY,
						output	logic	[23:0]	RGB,
						output	logic	[7:0]		Red, Green, Blue,
						output	logic	[18:0]	read_address,
						output	logic	[4:0]		curZomIndex
						);

	logic	VGA_HS, VGA_VS, vga_clk_clk, blank, sync;


	vga_controller		vgaControl(.*, .pixel_clk(vga_clk_clk), .Reset(Reset), .Clk(MAX10_CLK1_50), .hs(VGA_HS), .vs(VGA_VS));
	
	color_mapper		cm1(.*);
	CM_calculator		cmC1(.*, .frame_clk(MAX10_CLK1_50));
	ZombieROM			bgram1(.*, .frame_clk(MAX10_CLK1_50));
	ZomMapper			bgm1(.*);

endmodule 