//Module for testing plant.sv
module testZombie();

timeunit 10ns;

timeprecision 1ns;

logic MAX10_CLK1_50 = 0;
logic Reset_h;
logic	Generate;
logic beingAttack;
logic 			ZomLive;
logic	[2:0]		State;
logic	[2:0]		HP;


zombie z0(.*);

always begin : CLOCK_GENERATION

#1 MAX10_CLK1_50 = ~MAX10_CLK1_50;
end

initial begin : CLOCK_INITIALIZATION

   MAX10_CLK1_50 = 0;
	
	end

initial begin : TEST_VECTORS

#20		Generate = 1'b1;
#2			Generate = 1'b0;
			
#20    	beingAttack	= 1'b1;
#4			beingAttack = 1'b0;

#4    	beingAttack	= 1'b1;
#4			beingAttack = 1'b0;

#4    	beingAttack	= 1'b1;
#4			beingAttack = 1'b0;

#4    	beingAttack	= 1'b1;
#4			beingAttack = 1'b0;
 

 end
 
endmodule 