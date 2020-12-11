//Module for testing Coordinate.sv
module testGame();

timeunit 10ns;

timeprecision 1ns;

logic frame_clk = 0;
logic Reset;
logic [7:0] keycode;
logic				Generate;
logic				PlantLive;
logic	[9:0]		Pea1X, Pea1Y;
logic	[2:0]		PlantHP, ZomHP;
logic				ZomLive;
logic	[9:0]		ZomCentralX, ZomCentralY;


testtop game0(.*);

always begin : CLOCK_GENERATION

#1 frame_clk = ~frame_clk;
end

initial begin : CLOCK_INITIALIZATION

   frame_clk = 0;
	
	end
initial begin : TEST_VECTORS

    Reset = 1;
#4	 Reset = 0;
	 
#20	 	keycode = 8'h04;//A
#20  		keycode = 8'h00;

#20	 	keycode = 8'h07;//D
#20  		keycode = 8'h00;

#20		keycode = 8'h16;//S
#20  		keycode = 8'h00;

#20	 	keycode = 8'h08;//E
#20  		keycode = 8'h00;
	 
#2			Generate = 1'b1;
#2			Generate	= 1'b0;
 

 end
 
endmodule 