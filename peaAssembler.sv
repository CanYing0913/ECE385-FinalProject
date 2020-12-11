module peaAssembler		(	input							MAX10_CLK1_50,
//									input		logic	[23:0]	RGB1, RGB2, RGB3,RGB4, 	RGB5,
//																	RGB6, RGB7, RGB8, RGB, 	RGB10,
//																	RGB11,RGB12,RGB13,RGB, 	RGB15,
//																	RGB16,RGB17,RGB18,RGB, 	RGB20,
									input		logic				pea_on1,	pea_on2,	pea_on3, 	pea_on4, 	pea_on5,
																	pea_on6,	pea_on7, 	pea_on8, 	pea_on9, 	pea_on10,
																	pea_on11,	pea_on12, pea_on13, pea_on14, pea_on15,
																	pea_on16,	pea_on17, pea_on18, pea_on19, pea_on20,
									output	logic				pea_on,
									output	logic	[23:0]	RGB_pea);
									
	parameter	[23:0]	pea = 24'hF0BC3C;
	
	always_comb
	begin
		pea_on			=		1'b0;
		RGB_pea			=		24'h800080;
		if(pea_on1)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on2)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on3)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on4)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on5)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on6)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on7)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on8)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on9)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on10)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on11)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on12)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on13)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on14)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on15)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on16)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on17)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on18)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on19)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
		
		if(pea_on20)
		begin
			RGB_pea						=		pea;
			pea_on						=		1'b1;
		end
	end


endmodule 