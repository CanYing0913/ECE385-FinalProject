module END_calculator(		input							frame_clk, END,
									input		logic	[9:0]		DrawX, DrawY,
									output	logic	[18:0]	read_address_end,
									output	logic				END_on);

	logic			[9:0]	tempX, tempY;
	parameter	[9:0]	left	= 270;
	parameter	[9:0]	up		= 190;
	parameter	[9:0]	sizeX	= 100;
	
	always_ff @(posedge frame_clk)
	begin
		tempX	=	DrawX - left;
		tempY	=	DrawY - up;
	end
	  
   always_comb
   begin:Ball_on_proc
		if (END == 1'b1 && tempX > 0 && tempX <= 100 && tempY > 0 && tempY <= 100) 
			END_on = 1'b1;
		else 
			END_on = 1'b0;
	end 
	
	always_comb
	begin
		if(END_on == 1'b1)
			read_address_end	=	tempY * sizeX + tempX;
		else
			read_address_end	=	19'd0;
	end
	
endmodule 


