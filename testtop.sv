module testtop	(	input							frame_clk, Reset,
						input		logic	[7:0]		keycode,
						input		logic				Generate,
						output	logic				PlantLive,
						//output	logic				PlantLive2,
						output	logic	[9:0]		Pea1X, Pea1Y,
						output	logic	[2:0]		PlantHP, ZomHP,
						output	logic				ZomLive,
						output	logic	[9:0]		ZomCentralX, ZomCentralY
					);
					
	parameter	ZomX = 4;
	parameter	ZomY = 1;
					
	logic				Plant;
	logic		[9:0]	PlantX, PlantY;
	logic				beingEating, beingAttack;
	

	always_ff @(posedge frame_clk)
	begin
		if(Pea1X == ZomCentralX && Pea1Y == ZomCentralY)
			beingAttack = 1'b1;
		else
			beingAttack = 1'b0;
		if(ZomCentralX == PlantX && ZomCentralY == PlantY)
			beingEating = 1'b1;
		else
			beingEating = 1'b0;
	end



	Coordinate	coordinate(.*);
	plant 		plant1(.*, .HP(PlantHP));
	pea			pea1(.*, .startX(PlantX), .startY(PlantY), .nearX(ZomCentralX), .nearY(ZomCentralY), .BallX(Pea1X), .BallY(Pea1Y));
	zombie 		zom1(.*, .HP(ZomHP));
	zomMotion	zomMove1(.*, .startX(ZomX), .startY(ZomY));
					
endmodule 