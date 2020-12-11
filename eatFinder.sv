module eatFinder(		input		logic			MAX10_CLK1_50,
							input		logic	[9:0]	plantX, plantY, stopX, ZomCentralX, ZomCentralY,
							input		logic			eat,
							input		logic			beingEating,
							output	logic			result);


	logic	eat_in;
	
	always_ff@(posedge MAX10_CLK1_50)
	begin
		result	<=	eat_in;
	end
	
	always_comb
	begin
		eat_in	=	0;
		if(eat == 1 && plantY == ZomCentralY && stopX == ZomCentralX)
			eat_in	=	1'b1;
	end









endmodule 