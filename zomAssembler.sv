module	zomAssembler	(	input							MAX10_CLK1_50,
									input		logic	[18:0]	address1, 	address2, 	address3, 	address4, 	address5,
																	address6, 	address7, 	address8, 	address9, 	address10,
									input		logic				zom_on1,		zom_on2,		zom_on3, 	zom_on4, 	zom_on5,
																	zom_on6,		zom_on7, 	zom_on8, 	zom_on9, 	zom_on10,
									output	logic				zom_on,
									output	logic	[18:0]	read_address_zom);
	always_comb
	begin
		zom_on			=		1'b0;
		read_address_zom = 19'b0;
		if(zom_on1)
		begin
			read_address_zom		=		address1;
			zom_on						=		1'b1;
		end
		
		if(zom_on2)
		begin
			read_address_zom		=		address2;
			zom_on						=		1'b1;
		end
		
		if(zom_on3)
		begin
			read_address_zom		=		address3;
			zom_on						=		1'b1;
		end
		
		if(zom_on4)
		begin
			read_address_zom		=		address4;
			zom_on						=		1'b1;
		end
		
		if(zom_on5)
		begin
			read_address_zom		=		address5;
			zom_on						=		1'b1;
		end
		
		if(zom_on6)
		begin
			read_address_zom		=		address6;
			zom_on						=		1'b1;
		end
		
		if(zom_on7)
		begin
			read_address_zom		=		address7;
			zom_on						=		1'b1;
		end
		
		if(zom_on8)
		begin
			read_address_zom		=		address8;
			zom_on						=		1'b1;
		end
		
		if(zom_on9)
		begin
			read_address_zom		=		address9;
			zom_on						=		1'b1;
		end
		
		if(zom_on10)
		begin
			read_address_zom		=		address10;
			zom_on						=		1'b1;
		end
	end	
		


endmodule 