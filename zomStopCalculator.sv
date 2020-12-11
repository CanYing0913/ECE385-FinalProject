module zomStopCalculator(	input		logic				MAX10_CLK1_50,
									input		logic	[9:0]		plant1X, 		plant1Y,			plant2X, 		plant2Y,
																	plant3X, 		plant3Y,			plant4X, 		plant4Y,
																	plant5X, 		plant5Y,			plant6X, 		plant6Y,
																	plant7X, 		plant7Y,			plant8X, 		plant8Y,
																	plant9X, 		plant9Y,			plant10X, 		plant10Y,
																	plant11X, 		plant11Y,		plant12X, 		plant12Y,
																	plant13X, 		plant13Y,		plant14X, 		plant14Y,
																	plant15X, 		plant15Y,		plant16X, 		plant16Y,
																	plant17X, 		plant17Y,		plant18X, 		plant18Y,
																	plant19X, 		plant19Y,		plant20X, 		plant20Y,
									input		logic				PlantLive1,		PlantLive2,		PlantLive3,		PlantLive4,
																	PlantLive5,		PlantLive6,		PlantLive7,		PlantLive8,
																	PlantLive9,		PlantLive10,	PlantLive11,	PlantLive12,
																	PlantLive13,	PlantLive14,	PlantLive15,	PlantLive16,
																	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20,
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
		
		if(PlantLive1)
		begin
			if			(plant1Y	==	row1)
				temp1	=	plant1X;
			else if	(plant1Y	==	row2)
				temp2	=	plant1X;
			else if	(plant1Y	==	row3)
				temp3	=	plant1X;
			else if	(plant1Y	==	row4)
				temp4	=	plant1X;
			else if	(plant1Y	==	row5)
				temp5	=	plant1X;
		end
			
		if(PlantLive2)
		begin
			if			(plant2Y	==	row1 && temp1 > plant2X)
				temp1	=	plant2X;
			else if	(plant2Y	==	row2 && temp2 > plant2X)
				temp2	=	plant2X;
			else if	(plant2Y	==	row3 && temp3 > plant2X)
				temp3	=	plant2X;
			else if	(plant2Y	==	row4 && temp4 > plant2X)
				temp4	=	plant2X;
			else if	(plant2Y	==	row5 && temp5 > plant2X)
				temp5	=	plant2X;
		end
			
		if(PlantLive3)
		begin	
			if			(plant3Y	==	row1 && temp1 > plant3X)
				temp1	=	plant3X;
			else if	(plant3Y	==	row2 && temp2 > plant3X)
				temp2	=	plant3X;
			else if	(plant3Y	==	row3 && temp3 > plant3X)
				temp3	=	plant3X;
			else if	(plant3Y	==	row4 && temp4 > plant3X)
				temp4	=	plant3X;
			else if	(plant3Y	==	row5 && temp5 > plant3X)
				temp5	=	plant3X;
		end
			
		if(PlantLive4)
		begin	
			if			(plant4Y	==	row1 && temp1 > plant4X)
				temp1	=	plant4X;
			else if	(plant4Y	==	row2 && temp2 > plant4X)
				temp2	=	plant4X;
			else if	(plant4Y	==	row3 && temp3 > plant4X)
				temp3	=	plant4X;
			else if	(plant4Y	==	row4 && temp4 > plant4X)
				temp4	=	plant4X;
			else if	(plant4Y	==	row5 && temp5 > plant4X)
				temp5	=	plant4X;
		end
			
		if(PlantLive5)
		begin	
			if			(plant5Y	==	row1 && temp1 > plant5X)
				temp1	=	plant5X;
			else if	(plant5Y	==	row2 && temp2 > plant5X)
				temp2	=	plant5X;
			else if	(plant5Y	==	row3 && temp3 > plant5X)
				temp3	=	plant5X;
			else if	(plant5Y	==	row4 && temp4 > plant5X)
				temp4	=	plant5X;
			else if	(plant5Y	==	row5 && temp5 > plant5X)
				temp5	=	plant5X;
		end
			
		if(PlantLive6)
		begin	
			if			(plant6Y	==	row1 && temp1 > plant6X)
				temp1	=	plant6X;
			else if	(plant6Y	==	row2 && temp2 > plant6X)
				temp2	=	plant6X;
			else if	(plant6Y	==	row3 && temp3 > plant6X)
				temp3	=	plant6X;
			else if	(plant6Y	==	row4 && temp4 > plant6X)
				temp4	=	plant6X;
			else if	(plant6Y	==	row5 && temp5 > plant6X)
				temp5	=	plant6X;
		end
			
		if(PlantLive7)
		begin	
			if			(plant7Y	==	row1 && temp1 > plant7X)
				temp1	=	plant7X;
			else if	(plant7Y	==	row2 && temp2 > plant7X)
				temp2	=	plant7X;
			else if	(plant7Y	==	row3 && temp3 > plant7X)
				temp3	=	plant7X;
			else if	(plant7Y	==	row4 && temp4 > plant7X)
				temp4	=	plant7X;
			else if	(plant7Y	==	row5 && temp5 > plant7X)
				temp5	=	plant7X;
		end
			
		if(PlantLive8)
		begin	
			if			(plant8Y	==	row1 && temp1 > plant8X)
				temp1	=	plant8X;
			else if	(plant8Y	==	row2 && temp2 > plant8X)
				temp2	=	plant8X;
			else if	(plant8Y	==	row3 && temp3 > plant8X)
				temp3	=	plant8X;
			else if	(plant8Y	==	row4 && temp4 > plant8X)
				temp4	=	plant8X;
			else if	(plant8Y	==	row5 && temp5 > plant8X)
				temp5	=	plant8X;
		end
			
		if(PlantLive9)
		begin	
			if			(plant9Y	==	row1 && temp1 > plant9X)
				temp1	=	plant9X;
			else if	(plant9Y	==	row2 && temp2 > plant9X)
				temp2	=	plant9X;
			else if	(plant9Y	==	row3 && temp3 > plant9X)
				temp3	=	plant9X;
			else if	(plant9Y	==	row4 && temp4 > plant9X)
				temp4	=	plant9X;
			else if	(plant9Y	==	row5 && temp5 > plant9X)
				temp5	=	plant9X;
		end
			
		if(PlantLive10)
		begin	
			if			(plant10Y	==	row1 && temp1 > plant10X)
				temp1	=	plant10X;
			else if	(plant10Y	==	row2 && temp2 > plant10X)
				temp2	=	plant10X;
			else if	(plant10Y	==	row3 && temp3 > plant10X)
				temp3	=	plant10X;
			else if	(plant10Y	==	row4 && temp4 > plant10X)
				temp4	=	plant10X;
			else if	(plant10Y	==	row5 && temp5 > plant10X)
				temp5	=	plant10X;
		end
			
		if(PlantLive11)
		begin	
			if			(plant11Y	==	row1 && temp1 > plant11X)
				temp1	=	plant11X;
			else if	(plant11Y	==	row2 && temp2 > plant11X)
				temp2	=	plant11X;
			else if	(plant11Y	==	row3 && temp3 > plant11X)
				temp3	=	plant11X;
			else if	(plant11Y	==	row4 && temp4 > plant11X)
				temp4	=	plant11X;
			else if	(plant11Y	==	row5 && temp5 > plant11X)
				temp5	=	plant11X;
		end
			
		if(PlantLive12)
		begin	
			if			(plant12Y	==	row1 && temp1 > plant12X)
				temp1	=	plant12X;
			else if	(plant12Y	==	row2 && temp2 > plant12X)
				temp2	=	plant12X;
			else if	(plant12Y	==	row3 && temp3 > plant12X)
				temp3	=	plant12X;
			else if	(plant12Y	==	row4 && temp4 > plant12X)
				temp4	=	plant12X;
			else if	(plant12Y	==	row5 && temp5 > plant12X)
				temp5	=	plant12X;
		end
			
		if(PlantLive13)
		begin	
			if			(plant13Y	==	row1 && temp1 > plant13X)
				temp1	=	plant13X;
			else if	(plant13Y	==	row2 && temp2 > plant13X)
				temp2	=	plant13X;
			else if	(plant13Y	==	row3 && temp3 > plant13X)
				temp3	=	plant13X;
			else if	(plant13Y	==	row4 && temp4 > plant13X)
				temp4	=	plant13X;
			else if	(plant13Y	==	row5 && temp5 > plant13X)
				temp5	=	plant13X;
		end
			
		if(PlantLive14)
		begin	
			if			(plant14Y	==	row1 && temp1 > plant14X)
				temp1	=	plant14X;
			else if	(plant14Y	==	row2 && temp2 > plant14X)
				temp2	=	plant14X;
			else if	(plant14Y	==	row3 && temp3 > plant14X)
				temp3	=	plant14X;
			else if	(plant14Y	==	row4 && temp4 > plant14X)
				temp4	=	plant14X;
			else if	(plant14Y	==	row5 && temp5 > plant14X)
				temp5	=	plant14X;
		end
			
		if(PlantLive15)
		begin	
			if			(plant15Y	==	row1 && temp1 > plant15X)
				temp1	=	plant15X;
			else if	(plant15Y	==	row2 && temp2 > plant15X)
				temp2	=	plant15X;
			else if	(plant15Y	==	row3 && temp3 > plant15X)
				temp3	=	plant15X;
			else if	(plant15Y	==	row4 && temp4 > plant15X)
				temp4	=	plant15X;
			else if	(plant15Y	==	row5 && temp5 > plant15X)
				temp5	=	plant15X;
		end
			
		if(PlantLive16)
		begin	
			if			(plant16Y	==	row1 && temp1 > plant16X)
				temp1	=	plant16X;
			else if	(plant16Y	==	row2 && temp2 > plant16X)
				temp2	=	plant16X;
			else if	(plant16Y	==	row3 && temp3 > plant16X)
				temp3	=	plant16X;
			else if	(plant16Y	==	row4 && temp4 > plant16X)
				temp4	=	plant16X;
			else if	(plant16Y	==	row5 && temp5 > plant16X)
				temp5	=	plant16X;
		end
			
		if(PlantLive17)
		begin	
			if			(plant17Y	==	row1 && temp1 > plant17X)
				temp1	=	plant17X;
			else if	(plant17Y	==	row2 && temp2 > plant17X)
				temp2	=	plant2X;
			else if	(plant17Y	==	row3 && temp3 > plant17X)
				temp3	=	plant17X;
			else if	(plant17Y	==	row4 && temp4 > plant17X)
				temp4	=	plant17X;
			else if	(plant17Y	==	row5 && temp5 > plant17X)
				temp5	=	plant17X;
		end
			
		if(PlantLive18)
		begin	
			if			(plant18Y	==	row1 && temp1 > plant18X)
				temp1	=	plant18X;
			else if	(plant18Y	==	row2 && temp2 > plant18X)
				temp2	=	plant18X;
			else if	(plant18Y	==	row3 && temp3 > plant18X)
				temp3	=	plant18X;
			else if	(plant18Y	==	row4 && temp4 > plant18X)
				temp4	=	plant18X;
			else if	(plant18Y	==	row5 && temp5 > plant18X)
				temp5	=	plant18X;
		end
			
		if(PlantLive19)
		begin	
			if			(plant19Y	==	row1 && temp1 > plant19X)
				temp1	=	plant19X;
			else if	(plant19Y	==	row2 && temp2 > plant19X)
				temp2	=	plant19X;
			else if	(plant19Y	==	row3 && temp3 > plant19X)
				temp3	=	plant19X;
			else if	(plant19Y	==	row4 && temp4 > plant19X)
				temp4	=	plant19X;
			else if	(plant19Y	==	row5 && temp5 > plant19X)
				temp5	=	plant19X;
		end
			
		if(PlantLive20)
		begin	
			if			(plant20Y	==	row1 && temp1 > plant20X)
				temp1	=	plant20X;
			else if	(plant20Y	==	row2 && temp2 > plant20X)
				temp2	=	plant20X;
			else if	(plant20Y	==	row3 && temp3 > plant20X)
				temp3	=	plant20X;
			else if	(plant20Y	==	row4 && temp4 > plant20X)
				temp4	=	plant20X;
			else if	(plant20Y	==	row5 && temp5 > plant20X)
				temp5	=	plant20X;
		end	
		
		
		stopX1_in	=	temp1;
		stopX2_in	=	temp2;
		stopX3_in	=	temp3;
		stopX4_in	=	temp4;
		stopX5_in	=	temp5;
		
	end






endmodule 