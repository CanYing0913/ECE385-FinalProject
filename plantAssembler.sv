module plantAssembler	(	input							MAX10_CLK1_50,
									input		logic	[18:0]	address1, 	address2, address3, 	address4, 	address5,
																	address6, 	address7, address8, 	address9, 	address10,
																	address11, address12, address13, address14, 	address15,
																	address16, address17, address18, address19, 	address20,
									input		logic				plant_on1,	plant_on2,	plant_on3, 	plant_on4, 	plant_on5,
																	plant_on6,	plant_on7, 	plant_on8, 	plant_on9, 	plant_on10,
																	plant_on11,	plant_on12, plant_on13, plant_on14, plant_on15,
																	plant_on16,	plant_on17, plant_on18, plant_on19, plant_on20,
									output	logic				plant_on,
									output	logic	[18:0]	read_address_plant);
	always_comb
	begin
		plant_on			=		1'b0;
		read_address_plant = 19'b0;
		if(plant_on1)
		begin
			read_address_plant		=		address1;
			plant_on						=		1'b1;
		end
		
		if(plant_on2)
		begin
			read_address_plant		=		address2;
			plant_on						=		1'b1;
		end
		
		if(plant_on3)
		begin
			read_address_plant		=		address3;
			plant_on						=		1'b1;
		end
		
		if(plant_on4)
		begin
			read_address_plant		=		address4;
			plant_on						=		1'b1;
		end
		
		if(plant_on5)
		begin
			read_address_plant		=		address5;
			plant_on						=		1'b1;
		end
		
		if(plant_on6)
		begin
			read_address_plant		=		address6;
			plant_on						=		1'b1;
		end
		
		if(plant_on7)
		begin
			read_address_plant		=		address7;
			plant_on						=		1'b1;
		end
		
		if(plant_on8)
		begin
			read_address_plant		=		address8;
			plant_on						=		1'b1;
		end
		
		if(plant_on9)
		begin
			read_address_plant		=		address9;
			plant_on						=		1'b1;
		end
		
		if(plant_on10)
		begin
			read_address_plant		=		address10;
			plant_on						=		1'b1;
		end
		
		if(plant_on11)
		begin
			read_address_plant		=		address11;
			plant_on						=		1'b1;
		end
		
		if(plant_on12)
		begin
			read_address_plant		=		address12;
			plant_on						=		1'b1;
		end
		
		if(plant_on13)
		begin
			read_address_plant		=		address13;
			plant_on						=		1'b1;
		end
		
		if(plant_on14)
		begin
			read_address_plant		=		address14;
			plant_on						=		1'b1;
		end
		
		if(plant_on15)
		begin
			read_address_plant		=		address15;
			plant_on						=		1'b1;
		end
		
		if(plant_on16)
		begin
			read_address_plant		=		address16;
			plant_on						=		1'b1;
		end
		
		if(plant_on17)
		begin
			read_address_plant		=		address17;
			plant_on						=		1'b1;
		end
		
		if(plant_on18)
		begin
			read_address_plant		=		address18;
			plant_on						=		1'b1;
		end
		
		if(plant_on19)
		begin
			read_address_plant		=		address19;
			plant_on						=		1'b1;
		end
		
		if(plant_on20)
		begin
			read_address_plant		=		address20;
			plant_on						=		1'b1;
		end
	end


endmodule 