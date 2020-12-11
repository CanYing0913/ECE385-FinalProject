//Module for testing plant.sv
module testPea();

timeunit 10ns;

timeprecision 1ns;

logic MAX10_CLK1_50 = 0;		// Basic clk signal
logic	VGA_VS	=	0;
logic	Reset_h;
logic	[7:0]	keycode;
logic			Plant;
logic	[9:0]		plant1X, 		plant1Y,			plant2X, 		plant2Y,
					plant3X, 		plant3Y,			plant4X, 		plant4Y,
					plant5X, 		plant5Y,			plant6X, 		plant6Y,
					plant7X, 		plant7Y,			plant8X, 		plant8Y,
					plant9X, 		plant9Y,			plant10X, 		plant10Y,
					plant11X, 		plant11Y,		plant12X, 		plant12Y,
					plant13X, 		plant13Y,		plant14X, 		plant14Y,
					plant15X, 		plant15Y,		plant16X, 		plant16Y,
					plant17X, 		plant17Y,		plant18X, 		plant18Y,
					plant19X, 		plant19Y,		plant20X, 		plant20Y, DrawX, DrawY, curX, curY;
logic				attack1,			attack2,			attack3,			attack4,			attack5,
					attack6,			attack7,			attack8,			attack9,			attack10,
					PlantLive1, 	PlantLive2, 	PlantLive3, 	PlantLive4, 	PlantLive5,
														PlantLive6, 	PlantLive7, 	PlantLive8, 	PlantLive9, 	PlantLive10,
														PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
														PlantLive16,	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20;
logic	[9:0]		ZomCentralX1,	ZomCentralX2,	ZomCentralX3,	ZomCentralX4,	ZomCentralX5,
					ZomCentralX6,	ZomCentralX7,	ZomCentralX8,	ZomCentralX9,	ZomCentralX10,
					ZomCentralY1,	ZomCentralY2,	ZomCentralY3,	ZomCentralY4,	ZomCentralY5,
					ZomCentralY6,	ZomCentralY7,	ZomCentralY8,	ZomCentralY9,	ZomCentralY10, stopX1, stopX2,Ball1X, Ball1Y;
logic				beingEating1, 	beingEating2, 	beingEating3, 	beingEating4, 	beingEating5,
					beingEating6, 	beingEating7, 	beingEating8, 	beingEating9, 	beingEating10,
					beingEating11, beingEating12, beingEating13, beingEating14, beingEating15,
					beingEating16,	beingEating17,	beingEating18,	beingEating19,	beingEating20;
						
logic	[23:0]	RGB_plant, 		RGB_pea, RGB_end, RGB_zom;
logic				plant_on,		pea_on,hit1,plant_on1, END_on, zom_on;
logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
					ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10;
	

	plant_top	p0(.*);
	zom_top		z0(.*);
always begin : CLOCK_GENERATION

#1 VGA_VS = ~VGA_VS;
	MAX10_CLK1_50 = ~MAX10_CLK1_50;
#1	MAX10_CLK1_50 = ~MAX10_CLK1_50;;
	
end

initial begin : CLOCK_INITIALIZATION

   MAX10_CLK1_50 = 0;
	VGA_VS = 0;
	
	end

initial begin : TEST_VECTORS
		ZomLive1 = 0;
		ZomLive2 = 0;
		ZomLive3 = 0;
		ZomLive4 = 0;
		ZomLive5 = 0;
		ZomLive6 = 0;
		ZomLive7 = 0;
		ZomLive8 = 0;
		ZomLive9 = 0;
		ZomLive10= 0;
		curX = 300;
		curY = 110;
		DrawX = 300;
		DrawY= 110;

#21	Plant = 1;
		ZomCentralX1 = 320;
		ZomLive1	=	1;
#2		Plant	=	0;
		ZomCentralY1 =	110;
		#4		ZomCentralX1 = 324;
		#4		ZomCentralX1 = 323;
		#4		ZomCentralX1 = 322;
		#4		ZomCentralX1 = 321;
#4		ZomCentralX1 = 320;
#4		ZomCentralX1 = 319;
#4		ZomCentralX1 = 318;
#4		ZomCentralX1 = 317;
#4		ZomCentralX1 = 316;
#4		ZomCentralX1 = 315;
#4		ZomCentralX1 = 314;
#4		ZomCentralX1 = 313;
#4		ZomCentralX1 = 312;
#4		ZomCentralX1 = 311;
#4		ZomCentralX1 = 310;
#4		ZomCentralX1 = 309;
#4		ZomCentralX1 = 308;
#4		ZomCentralX1 = 307;
#4		ZomCentralX1 = 306;

 end
 
endmodule 