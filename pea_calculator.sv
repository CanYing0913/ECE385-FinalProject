module pea_calculator(		input							PlantLive,
									input		logic	[9:0]		DrawX, DrawY, BallX, BallY,
									//output	logic	[23:0]	RGB_pea,
									output	logic				pea_on);


	int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
   assign DistY = DrawY - BallY;
   assign Size = 5;
	  
   always_comb
   begin:Ball_on_proc
		if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) && PlantLive == 1'b1) 
			pea_on = 1'b1;
			//RGB_pea	=	24'hF0BC3C;
		else 
			pea_on = 1'b0;
			//RGB_pea	=	24'h800080;
	end 

endmodule 


