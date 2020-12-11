module Zom_calculator(	input							MAX10_CLK1_50, ZomLive,
								input		logic	[9:0]		DrawX, DrawY, ZomX, ZomY,
								output	logic	[18:0]	address,
								output	logic				zom_on);

	parameter sizeX 	= 50;
	parameter sizeY 	= 70;
	logic	[9:0] left, up;
	logic	[9:0] tempX, tempY;
	logic	[18:0]	address_in;
	

	
	always_ff @(posedge MAX10_CLK1_50)
	begin
		
		address	<=	address_in;
	end

	always_comb
	begin
		left	= ZomX - 35;
		up		= ZomY - 35;
		tempX	=	DrawX - left;
		tempY	=	DrawY - up;
		if (tempX >= 0 && tempX < 50 && tempY >= 0 && tempY < 70 && ZomLive == 1'b1)
		begin
			zom_on = 1'b1;
			address_in	=	tempY * sizeX + tempX;
		end
		
		else 
		begin
			zom_on = 1'b0;
			address_in	=	19'd0296;
		end
    end
endmodule 


