//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// This module contains information to set colors for ball the backgroud.

module  Color_Mapper ( input						CLK,
							  input        [9:0] 	DrawX, DrawY,
							  input			[23:0]	RGB_bg, RGB_coor, RGB_zom, RGB_plant, RGB_pea, RGB_end,
							  input	logic				coordinate_on, zom_on, plant_on, pea_on, END_on,
							  input						blank,
                       output logic [7:0] 	Red, Green, Blue,
							  output	logic	[23:0]	RGB);
    
	parameter [23:0] transparency = 24'h800080;
	
	
	//logic	[23:0]	RGB;

	always_comb
	begin
		RGB = 24'b0;
		if			(END_on	==		1'b1	&&		RGB_end	!= transparency)
			RGB		=		RGB_end;
		else
		begin
			if			(pea_on	==		1'b1	&&		RGB_pea	!= transparency)
				RGB		=		RGB_pea;
			else
			begin
				if			(zom_on	==		1'b1	&&		RGB_zom	!=	transparency)
					RGB		=		RGB_zom;
				else
				begin
					if		(coordinate_on	==	1'b1	&&	RGB_coor != transparency)
						RGB	=		RGB_coor;
					else
					begin
						if	(plant_on		==	1'b1	&&	RGB_plant!= transparency)
							RGB	=		RGB_plant;
						else
							RGB	=		RGB_bg;
					end
				end
			end	
		end
		if(blank == 1'b1)
		begin
			Red	=	RGB[23:16];
			Green	=  RGB[15:8];
			Blue	=	RGB[7:0];
		end
		
		else
		begin
			Red	=	8'b0;
			Green	=  8'b0;
			Blue	=	8'b0;
		end
	end
	
//	//Assign R,G,B based on chosen RGB and avoid assigning during blanking
//	//Note: assigning RGB during blanking leading to lack of blue channel in display
//	always_comb
//	begin:RGB_Display
//		
//	end 
		 
endmodule
