//Module for testing plant.sv
module testZomMotion();

timeunit 10ns;

timeprecision 1ns;

logic MAX10_CLK1_50 = 0;		// Basic clk signal
logic 			PlantLive1, PlantLive2, plant1,plant2, Plant, Reset_h;

//logic	[18:0]	addressplt1, addressplt2;
logic				coordinate_on, plant_on, zom_on, pea_on, END_on, blank;
logic	[18:0]	read_address_plant, read_address_coor;
logic	[7:0]		keycode, Red, Green, Blue;
logic	[9:0]		DrawX, DrawY;
logic	[4:0]		curPlantIndex, curCoordinateIndex;
logic	[23:0]	RGB_coor, RGB_plant, RGB_bg, RGB_zom, RGB_pea, RGB_end, RGB;
	Color_Mapper				cm1(.*, .CLK(MAX10_CLK1_50));
always begin : CLOCK_GENERATION

#1 MAX10_CLK1_50 = ~MAX10_CLK1_50;
end

initial begin : CLOCK_INITIALIZATION

   MAX10_CLK1_50 = 0;
	
	end

initial begin : TEST_VECTORS
		zom_on=0;
		pea_on=0;
		END_on=0;
		blank = 1;
		RGB_coor = 24'h0F;
		RGB_end	=	24'h0F;
		RGB_pea	=	24'h0F;
		RGB_bg = 24'hFF;
		
		DrawX = 200;
		DrawY = 110;
#20	plant_on = 1;
		RGB_plant = 24'h398802;
 

 end
 
endmodule 