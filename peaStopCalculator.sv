module peaStopCalculator(	input		logic				MAX10_CLK1_50,
									input		logic	[9:0]		ZomCentralX1,	ZomCentralY1,	ZomCentralX2,	ZomCentralY2,
																	ZomCentralX3,	ZomCentralY3,	ZomCentralX4,	ZomCentralY4,
																	ZomCentralX5,	ZomCentralY5,	ZomCentralX6,	ZomCentralY6,
																	ZomCentralX7,	ZomCentralY7,	ZomCentralX8,	ZomCentralY8,
																	ZomCentralX9,	ZomCentralY9,	ZomCentralX10,	ZomCentralY10,
									input		logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
																	ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10,
									output	logic	[9:0]		stopX1,			stopX2,			stopX3,			stopX4,			stopX5
																	);
	logic	[9:0]	stopX1_in,	stopX2_in,	stopX3_in,	stopX4_in,	stopX5_in,	temp1,	temp2,	temp3,	temp4,	temp5;
	parameter [9:0]	row1	=	110;
	parameter [9:0]	row2	=	180;
	parameter [9:0]	row3	=	250;
	parameter [9:0]	row4	=	320;
	parameter [9:0]	row5	=	390;
	
	always_ff@(posedge MAX10_CLK1_50)
	begin
		stopX1	=	stopX1_in;
		stopX2	=	stopX2_in;
		stopX3	=	stopX3_in;
		stopX4	=	stopX4_in;
		stopX5	=	stopX5_in;
	end
	
	always_comb
	begin
		temp1			=	0;
		temp2			=	0;
		temp3			=	0;
		temp4			=	0;
		temp5			=	0;
		
		if(ZomLive1)
		begin
			if			(ZomCentralY1	==	row1)
				temp1	=	ZomCentralX1;
			else if	(ZomCentralY1	==	row2)
				temp2	=	ZomCentralX1;
			else if	(ZomCentralY1	==	row3)
				temp3	=	ZomCentralX1;
			else if	(ZomCentralY1	==	row4)
				temp4	=	ZomCentralX1;
			else if	(ZomCentralY1	==	row5)
				temp5	=	ZomCentralX1;
		end
			
		if(ZomLive2)
		begin
			if			(ZomCentralY2	==	row1 && temp1 > ZomCentralX2)
				temp1	=	ZomCentralX2;
			else if	(ZomCentralY2	==	row2 && temp2 > ZomCentralX2)
				temp2	=	ZomCentralX2;
			else if	(ZomCentralY2	==	row3 && temp3 > ZomCentralX2)
				temp3	=	ZomCentralX2;
			else if	(ZomCentralY2	==	row4 && temp4 > ZomCentralX2)
				temp4	=	ZomCentralX2;
			else if	(ZomCentralY2	==	row5 && temp5 > ZomCentralX2)
				temp5	=	ZomCentralX2;
		end
			
		if(ZomLive3)
		begin
			if			(ZomCentralY3	==	row1 && temp1 > ZomCentralX3)
				temp1	=	ZomCentralX3;
			else if	(ZomCentralY3	==	row2 && temp2 > ZomCentralX3)
				temp2	=	ZomCentralX3;
			else if	(ZomCentralY3	==	row3 && temp3 > ZomCentralX3)
				temp3	=	ZomCentralX3;
			else if	(ZomCentralY3	==	row4 && temp4 > ZomCentralX3)
				temp4	=	ZomCentralX3;
			else if	(ZomCentralY3	==	row5 && temp5 > ZomCentralX3)
				temp5	=	ZomCentralX3;
		end
			
		if(ZomLive4)
		begin
			if			(ZomCentralY4	==	row1 && temp1 > ZomCentralX4)
				temp1	=	ZomCentralX4;
			else if	(ZomCentralY4	==	row2 && temp2 > ZomCentralX4)
				temp2	=	ZomCentralX4;
			else if	(ZomCentralY4	==	row3 && temp3 > ZomCentralX4)
				temp3	=	ZomCentralX4;
			else if	(ZomCentralY4	==	row4 && temp4 > ZomCentralX4)
				temp4	=	ZomCentralX4;
			else if	(ZomCentralY4	==	row5 && temp5 > ZomCentralX4)
				temp5	=	ZomCentralX4;
		end
			
		if(ZomLive5)
		begin
			if			(ZomCentralY5	==	row1 && temp1 > ZomCentralX5)
				temp1	=	ZomCentralX5;
			else if	(ZomCentralY5	==	row2 && temp2 > ZomCentralX5)
				temp2	=	ZomCentralX5;
			else if	(ZomCentralY5	==	row3 && temp3 > ZomCentralX5)
				temp3	=	ZomCentralX5;
			else if	(ZomCentralY5	==	row4 && temp4 > ZomCentralX5)
				temp4	=	ZomCentralX5;
			else if	(ZomCentralY5	==	row5 && temp5 > ZomCentralX5)
				temp5	=	ZomCentralX5;
		end
			
		if(ZomLive6)
		begin
			if			(ZomCentralY6	==	row1 && temp1 > ZomCentralX6)
				temp1	=	ZomCentralX6;
			else if	(ZomCentralY6	==	row2 && temp2 > ZomCentralX6)
				temp2	=	ZomCentralX6;
			else if	(ZomCentralY6	==	row3 && temp3 > ZomCentralX6)
				temp3	=	ZomCentralX6;
			else if	(ZomCentralY6	==	row4 && temp4 > ZomCentralX6)
				temp4	=	ZomCentralX6;
			else if	(ZomCentralY6	==	row5 && temp5 > ZomCentralX6)
				temp5	=	ZomCentralX6;
		end
			
		if(ZomLive7)
		begin
			if			(ZomCentralY7	==	row1 && temp1 > ZomCentralX7)
				temp1	=	ZomCentralX7;
			else if	(ZomCentralY7	==	row2 && temp2 > ZomCentralX7)
				temp2	=	ZomCentralX7;
			else if	(ZomCentralY7	==	row3 && temp3 > ZomCentralX7)
				temp3	=	ZomCentralX7;
			else if	(ZomCentralY7	==	row4 && temp4 > ZomCentralX7)
				temp4	=	ZomCentralX7;
			else if	(ZomCentralY7	==	row5 && temp5 > ZomCentralX7)
				temp5	=	ZomCentralX7;
		end
			
		if(ZomLive8)
		begin
			if			(ZomCentralY8	==	row1 && temp1 > ZomCentralX8)
				temp1	=	ZomCentralX8;
			else if	(ZomCentralY8	==	row2 && temp2 > ZomCentralX8)
				temp2	=	ZomCentralX8;
			else if	(ZomCentralY8	==	row3 && temp3 > ZomCentralX8)
				temp3	=	ZomCentralX8;
			else if	(ZomCentralY8	==	row4 && temp4 > ZomCentralX8)
				temp4	=	ZomCentralX8;
			else if	(ZomCentralY8	==	row5 && temp5 > ZomCentralX8)
				temp5	=	ZomCentralX8;
		end
			
		if(ZomLive9)
		begin
			if			(ZomCentralY9	==	row1 && temp1 > ZomCentralX9)
				temp1	=	ZomCentralX9;
			else if	(ZomCentralY9	==	row2 && temp2 > ZomCentralX9)
				temp2	=	ZomCentralX9;
			else if	(ZomCentralY9	==	row3 && temp3 > ZomCentralX9)
				temp3	=	ZomCentralX9;
			else if	(ZomCentralY9	==	row4 && temp4 > ZomCentralX9)
				temp4	=	ZomCentralX9;
			else if	(ZomCentralY9	==	row5 && temp5 > ZomCentralX9)
				temp5	=	ZomCentralX9;
		end
			
		if(ZomLive10)
		begin
			if			(ZomCentralY10	==	row1 && temp1 > ZomCentralX10)
				temp1	=	ZomCentralX10;
			else if	(ZomCentralY10	==	row2 && temp2 > ZomCentralX10)
				temp2	=	ZomCentralX10;
			else if	(ZomCentralY10	==	row3 && temp3 > ZomCentralX10)
				temp3	=	ZomCentralX10;
			else if	(ZomCentralY10	==	row4 && temp4 > ZomCentralX10)
				temp4	=	ZomCentralX10;
			else if	(ZomCentralY10	==	row5 && temp5 > ZomCentralX10)
				temp5	=	ZomCentralX10;
		end
		
		stopX1_in	=	temp1;
		stopX2_in	=	temp2;
		stopX3_in	=	temp3;
		stopX4_in	=	temp4;
		stopX5_in	=	temp5;
		
	end



endmodule 