module testROM();

timeunit 10ns;

timeprecision 1ns;

logic frame_clk = 0;
//logic	Reset;
//logic	[9:0]	DrawX, DrawY, tempX, tempY;
//logic	[23:0]	RGB;
//logic	[7:0]		Red, Green, Blue;
logic	[18:0]	read_address;
logic	[4:0]		curZomIndex;


ZombieROM zm0(.*);

always begin : CLOCK_GENERATION

#1 frame_clk = ~frame_clk;
end

initial begin : CLOCK_INITIALIZATION

   frame_clk = 0;
	
	end

initial begin : TEST_VECTORS

#2		read_address = 19'd1;
#10	read_address = 19'd376;
#10	read_address = 19'd378;
 

 end
 
endmodule 