module Plant_calculator(	input							MAX10_CLK1_50, PlantLive,
									input		logic	[9:0]		DrawX, DrawY, plantX, plantY,
									output	logic	[18:0]	address,
									output	logic				plant_on);

	parameter sizeX 	= 60;
	parameter sizeY 	= 60;
	logic	[9:0] left, up;
	logic	[9:0] tempX, tempY;
	logic	[18:0]	address_in;
	

	
	always_ff @(posedge MAX10_CLK1_50)
	begin
		
		address	<=	address_in;
	end
	
	
	always_comb
	begin
		left	= plantX - 30;
		up		= plantY - 30;
		tempX	=	DrawX - left;
		tempY	=	DrawY - up;
		if (tempX >= 0 && tempX < 60 && tempY >= 0 && tempY < 60 && PlantLive == 1'b1) 
			plant_on = 1'b1;
		else 
			plant_on = 1'b0;
			
		if(plant_on == 1'b1)
			address_in	=	tempY * sizeX + tempX+1;
		else
			address_in	=	19'd0;
	end
		
endmodule 


