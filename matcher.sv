module matcher1(	input		logic				MAX10_CLK1_50,
						input		logic	[9:0]		BallX, 	BallY,
														stopX1,	stopX2,	stopX3,	stopX4,	stopX5,
						output	logic	[9:0]		stopX);


	parameter [9:0]	row1	=	110;
	parameter [9:0]	row2	=	180;
	parameter [9:0]	row3	=	250;
	parameter [9:0]	row4	=	320;
	parameter [9:0]	row5	=	390;

	always_ff@(posedge MAX10_CLK1_50)
	begin
		if(BallY == row1)
			stopX	<=	stopX1;
		if(BallY == row2)
			stopX	<=	stopX2;
		if(BallY == row3)
			stopX	<=	stopX3;
		if(BallY == row4)
			stopX	<=	stopX4;
		if(BallY == row5)
			stopX	<=	stopX5;
	end








endmodule 