module FinalProject(
	///////// Clocks /////////
	input  MAX10_CLK1_50,

	///////// KEY /////////
	input    [ 1: 0]   KEY,

	///////// SW /////////
	input    [ 9: 0]   SW,

	///////// LEDR /////////
	output   [ 9: 0]   LEDR,

	///////// HEX /////////
	output   [ 7: 0]   HEX0,
	output   [ 7: 0]   HEX1,
	output   [ 7: 0]   HEX2,
	output   [ 7: 0]   HEX3,
	output   [ 7: 0]   HEX4,
	output   [ 7: 0]   HEX5,

	///////// SDRAM /////////
	output             DRAM_CLK,
	output             DRAM_CKE,
	output   [12: 0]   DRAM_ADDR,
	output   [ 1: 0]   DRAM_BA,
	inout    [15: 0]   DRAM_DQ,
	output             DRAM_LDQM,
	output             DRAM_UDQM,
	output             DRAM_CS_N,
	output             DRAM_WE_N,
	output             DRAM_CAS_N,
	output             DRAM_RAS_N,

	///////// VGA /////////
	output             VGA_HS,
	output             VGA_VS,
	output   [ 3: 0]   VGA_R,
	output   [ 3: 0]   VGA_G,
	output   [ 3: 0]   VGA_B,


	///////// ARDUINO /////////
	inout    [15: 0]   ARDUINO_IO,
	inout              ARDUINO_RESET_N 
								);

	logic Reset_h, vssig, sync, VGA_Clk;
	logic [9:0] DrawX, DrawY;
	logic vga_clk_clk;

	//=======================================================
	//  REG/WIRE declarations
	//=======================================================
	logic 			SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] 	hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] 	signs;
	logic [1:0] 	hundreds;
	logic [9:0] 	drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] 	Red, Blue, Green;
	logic	[23:0]	RGB;
	logic [7:0] 	keycode;

	//=======================================================
	//  Structural coding
	//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];


	//soc instantiation
	FinalProject_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export
		.vga_clk_clk(vga_clk_clk),
		//.vga_clk_clk(),
		
		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi_0_SS_n(SPI0_CS_N),
		.spi_0_MOSI(SPI0_MOSI),
		.spi_0_MISO(SPI0_MISO),
		.spi_0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		//.keycode_export()
		.keycode_export(keycode)
		
	 );
	logic	[23:0]	RGB_bg, RGB_coor;
	logic	[4:0]		curBGIndex, curZomIndex, curCoordinateIndex, curENDIndex;
	logic	[18:0]	read_address_bg, read_address_coor, read_address_zom, read_address_plant, read_address_end;
	logic				Plant, blank;
	//Variables for Coordinate.sv
	logic	[9:0]		curX, curY;
	logic	Generate;
	logic	coordinate_on, zom_on, END_on;
//	assign keycode = 8'h08;
	
//|========================================================================================|
//|								Plant releated variables declaration					 			    |
//|========================================================================================|
//						
//	logic				plant_on1, 		plant_on2, 		plant_on3, 		plant_on4, 		plant_on5,
//						plant_on6, 		plant_on7, 		plant_on8, 		plant_on9, 		plant_on10,
//						plant_on11, 	plant_on12, 	plant_on13, 	plant_on14, 	plant_on15,
//						plant_on16,		plant_on17,		plant_on18,		plant_on19,		plant_on20;
						
	logic				beingEating1, 	beingEating2, 	beingEating3, 	beingEating4, 	beingEating5,
						beingEating6, 	beingEating7, 	beingEating8, 	beingEating9, 	beingEating10,
						beingEating11, beingEating12, beingEating13, beingEating14, beingEating15,
						beingEating16,	beingEating17,	beingEating18,	beingEating19,	beingEating20;
	
	logic				PlantLive1, 	PlantLive2, 	PlantLive3, 	PlantLive4, 	PlantLive5,
						PlantLive6, 	PlantLive7, 	PlantLive8, 	PlantLive9, 	PlantLive10,
						PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
						PlantLive16,	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20;
						
//	logic				plant1,			plant2, 			plant3, 			plant4, 			plant5,
//						plant6, 			plant7, 			plant8, 			plant9, 			plant10,
//						plant11, 		plant12, 		plant13, 		plant14, 		plant15,
//						plant16, 		plant17, 		plant18, 		plant19, 		plant20;
//						
	logic	[9:0] 	plant1X, 		plant1Y,			plant2X, 		plant2Y,
						plant3X, 		plant3Y,			plant4X, 		plant4Y,
						plant5X, 		plant5Y,			plant6X, 		plant6Y,
						plant7X, 		plant7Y,			plant8X, 		plant8Y,
						plant9X, 		plant9Y,			plant10X, 		plant10Y,
						plant11X, 		plant11Y,		plant12X, 		plant12Y,
						plant13X, 		plant13Y,		plant14X, 		plant14Y,
						plant15X, 		plant15Y,		plant16X, 		plant16Y,
						plant17X, 		plant17Y,		plant18X, 		plant18Y,
						plant19X, 		plant19Y,		plant20X, 		plant20Y;
//
//	logic	[9:0]		Ball1X,			Ball1Y,			Ball2X,			Ball2Y,
//						Ball3X,			Ball3Y,			Ball4X,			Ball4Y,
//						Ball5X,			Ball5Y,			Ball6X,			Ball6Y,
//						Ball7X,			Ball7Y,			Ball8X,			Ball8Y,
//						Ball9X,			Ball9Y,			Ball10X,			Ball10Y,
//						Ball11X,			Ball11Y,			Ball12X,			Ball12Y,
//						Ball13X,			Ball13Y,			Ball14X,			Ball14Y,
//						Ball15X,			Ball15Y,			Ball16X,			Ball16Y,
//						Ball17X,			Ball17Y,			Ball18X,			Ball18Y,
//						Ball19X,			Ball19Y,			Ball20X,			Ball20Y;
//	logic				pea_on1, 		pea_on2, 		pea_on3, 		pea_on4, 		pea_on5,
//						pea_on6, 		pea_on7, 		pea_on8, 		pea_on9, 		pea_on10,
//						pea_on11, 		pea_on12, 		pea_on13, 		pea_on14, 		pea_on15,
//						pea_on16,		pea_on17,		pea_on18,		pea_on19,		pea_on20;
//						
//	
//	logic	[18:0]	addressplt1,	addressplt2,	addressplt3,	addressplt4,	addressplt5,
//						addressplt6,	addressplt7,	addressplt8,	addressplt9,	addressplt10,
//						addressplt11,	addressplt12,	addressplt13,	addressplt14,	addressplt15,
//						addressplt16,	addressplt17,	addressplt18,	addressplt19,	addressplt20;
						
	logic	[23:0]	RGB_plant, 		RGB_pea;
	logic	[4:0]		curPlantIndex;
	logic				plant_on, 		pea_on;
//|========================================================================================|
//|								Zombie releated variables declaration					 			    |
//|========================================================================================|
	logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
						ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10;
			
	logic				attack1,			attack2,			attack3,			attack4,			attack5,
						attack6,			attack7,			attack8,			attack9,			attack10;
						
	logic	[9:0]		ZomCentralX1,	ZomCentralX2,	ZomCentralX3,	ZomCentralX4,	ZomCentralX5,
						ZomCentralX6,	ZomCentralX7,	ZomCentralX8,	ZomCentralX9,	ZomCentralX10,
						ZomCentralY1,	ZomCentralY2,	ZomCentralY3,	ZomCentralY4,	ZomCentralY5,
						ZomCentralY6,	ZomCentralY7,	ZomCentralY8,	ZomCentralY9,	ZomCentralY10;
						

	logic	[23:0]	RGB_zom, 		RGB_end;

	
	vga_controller				vgaControl(.*, .pixel_clk(vga_clk_clk), .Reset(Reset_h), .Clk(MAX10_CLK1_50), .hs(VGA_HS), .vs(VGA_VS));
	
	Color_Mapper				cm1(.*, .CLK(MAX10_CLK1_50));
	CM_calculator				cmC1(.*, .frame_clk(MAX10_CLK1_50));
	BackGroundROM				bgrom(.*, .frame_clk(MAX10_CLK1_50));
	BackGroundMapper			bgm(.*);

	
	Coordinate					curPosition(.*, .keycode(keycode));
	CoordinateROM				curPositionROM(.*, .frame_clk(MAX10_CLK1_50));
	Coordinate_calculator	cc(.*, .frame_clk(MAX10_CLK1_50));
	CoordinateMapper			cordntm(.*);
	
	plant_top					plttop	(.*);
	
	zom_top						zomtop	(.*);

	
	
endmodule 