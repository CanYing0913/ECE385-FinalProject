//Module for testing plant.sv
module testPlant();

timeunit 10ns;

timeprecision 1ns;

//logic Reset_h;
logic MAX10_CLK1_50=0;
//logic PlantLive;
//logic	[9:0]		DrawX, DrawY;
//logic	[9:0]		plantX, plantY;
//logic 			plant_on;
logic	[18:0]	read_address_plant;
logic	[4:0]	curPlantIndex;

PlantROM p0(.*);

always begin : CLOCK_GENERATION

#1 MAX10_CLK1_50 = ~MAX10_CLK1_50;
end

initial begin : CLOCK_INITIALIZATION

   MAX10_CLK1_50 = 0;
	
	end

initial begin : TEST_VECTORS

		 
#20	 read_address_plant		= 246;
#20	 read_address_plant		= 247;
#20	 read_address_plant		= 248;
#20	 read_address_plant		= 249;
#20	 read_address_plant		= 250;
	 

 

 end
 
endmodule 