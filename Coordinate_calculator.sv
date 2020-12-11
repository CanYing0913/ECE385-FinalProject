module Coordinate_calculator(	input							frame_clk,
										input		logic	[9:0]		DrawX, DrawY, curX, curY,
										output	logic	[18:0]	read_address_coor,
										output	logic				coordinate_on);

	parameter sizeX 	= 70;
	parameter sizeY 	= 70;
	logic	[9:0] left, up;
	logic	[9:0] tempX, tempY;

	always_comb
	begin
		left	= curX - 35;
		up		= curY - 35;
	end
	
	always_ff @(posedge frame_clk)
	begin
		tempX	=	DrawX - left;
		tempY	=	DrawY - up;
	end
	
	always_comb
   begin
		if (tempX >= 0 && tempX < 70 && tempY >= 0 && tempY < 70) 
			coordinate_on = 1'b1;
		else 
			coordinate_on = 1'b0;
    end 
								
	always_comb
	begin
		if(coordinate_on == 1'b1)
			read_address_coor	=	tempY * sizeX + tempX;
		else
			read_address_coor	=	19'd0296;
	end
		
endmodule 
