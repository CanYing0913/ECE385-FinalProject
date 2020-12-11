module CM_calculator(	input							frame_clk,
								input		logic	[9:0]		DrawX, DrawY,
								output	logic	[18:0]	read_address_bg);

	parameter sizeX 	= 320;
	parameter sizeY 	= 240;
	logic	[9:0] left, up;
	logic	bg_on;
	logic	[9:0]	tempX, tempY;


	
//	always_ff @(posedge frame_clk)
//	begin
//		if(DrawX <= sizeX)
//			tempX	<=	DrawX;
//		else
//			tempX	<=	DrawX - sizeX;
//		
//		if(DrawY <= sizeY)
//			tempY	<=	DrawY;
//		else
//			tempY	<=	DrawY - sizeY;
//	end

	always_ff @ (posedge frame_clk)
	begin
		tempX <= DrawX /2;
		tempY <= DrawY /2;
	end

//	
//	always_comb
//   begin
//		if (tempX >= 0 && tempX < 70 && tempY >= 0 && tempY < 70) 
//			bg_on = 1'b1;
//		else 
//			bg_on = 1'b0;
//    end 
								
	always_comb
	begin
//		if(coordinate_on == 1'b1)
			read_address_bg	=	tempY * sizeX + tempX;
//		else
//			read_address	=	19'd0296;
	end
		
endmodule 


