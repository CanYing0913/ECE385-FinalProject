module plantAssigner(	
						input		MAX10_CLK1_50,
						input		logic				Plant,
						input		logic				PlantLive1, 	PlantLive2,		PlantLive3, 	PlantLive4, 	PlantLive5,
														PlantLive6, 	PlantLive7,		PlantLive8, 	PlantLive9, 	PlantLive10,
														PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
														PlantLive16, 	PlantLive17, 	PlantLive18, 	PlantLive19, 	PlantLive20,
						
						output	logic 	plant1,	plant2, 	plant3, 	plant4, 	plant5,
												plant6, 	plant7, 	plant8, 	plant9, 	plant10,
												plant11, plant12, plant13, plant14, plant15,
												plant16, plant17, plant18, plant19, plant20
						);
	
	always_comb
	begin
		plant1	=	1'b0;
		plant2	=	1'b0;
		plant3	=	1'b0;
		plant4	=	1'b0;
		plant5	=	1'b0;
		plant6	=	1'b0;
		plant7	=	1'b0;
		plant8	=	1'b0;
		plant9	=	1'b0;
		plant10	=	1'b0;
		plant11	=	1'b0;
		plant12	=	1'b0;
		plant13	=	1'b0;
		plant14	=	1'b0;
		plant15	=	1'b0;
		plant16	=	1'b0;
		plant17	=	1'b0;
		plant18	=	1'b0;
		plant19	=	1'b0;
		plant20	=	1'b0;
		
		if(Plant == 1'b1)
		begin
					if(PlantLive1	==	1'b0)
				plant1	=	1'b1;
			else if(PlantLive2	==	1'b0)
				plant2	=	1'b1;
			else if(PlantLive3	==	1'b0)
				plant3		=	1'b1;
			else if(PlantLive4	==	1'b0)
				plant4		=	1'b1;
			else if(PlantLive5	==	1'b0)
				plant5		=	1'b1;
			else if(PlantLive6	==	1'b0)
				plant6		=	1'b1;
			else if(PlantLive7	==	1'b0)
				plant7		=	1'b1;
			else if(PlantLive8	==	1'b0)
				plant8		=	1'b1;
			else if(PlantLive9	==	1'b0)
				plant9		=	1'b1;
			else if(PlantLive10	==	1'b0)
				plant10		=	1'b1;
			else if(PlantLive11	==	1'b0)
				plant11		=	1'b1;
			else if(PlantLive12	==	1'b0)
				plant12		=	1'b1;
			else if(PlantLive13	==	1'b0)
				plant13		=	1'b1;
			else if(PlantLive14	==	1'b0)
				plant14		=	1'b1;
			else if(PlantLive15	==	1'b0)
				plant15		=	1'b1;
			else if(PlantLive16	==	1'b0)
				plant16		=	1'b1;
			else if(PlantLive17	==	1'b0)
				plant17		=	1'b1;
			else if(PlantLive18	==	1'b0)
				plant18		=	1'b1;
			else if(PlantLive19	==	1'b0)
				plant19		=	1'b1;
			else if(PlantLive20	==	1'b0)
				plant20		=	1'b1;
		end
	end

endmodule 