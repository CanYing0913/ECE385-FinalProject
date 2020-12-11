module attackFinder(	input		logic			MAX10_CLK1_50,
							input		logic	[9:0]	BallX, BallY, stopX, ZomCentralX, ZomCentralY,
							input		logic			hit,
							input		logic			attack,
							output	logic			result);

	logic	attack_in;
	//enum	logic	{zero, check} state, next;
	
	always_ff@(posedge MAX10_CLK1_50)
	begin
		result	<=	attack_in;
		//state		<=	next;
	end
	
	always_comb
	begin
		attack_in	=	0;
		if(hit == 1 && BallY == ZomCentralY && stopX == ZomCentralX + 1)
			attack_in	=	1'b1;
	end


endmodule 