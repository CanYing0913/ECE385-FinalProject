//|======================================plant.sv===========================================|
//|-----------------------------------------------------------------------------------------|
//| This module controls lives/death of the plant, as well as the HP calculations.          |
//| Based on its output PlantLive, the master CM will take plantCM to get RGB in correspond |
//| coordinates specified by coordinate.sv. The coordinate.sv also gives outputs to pea.sv. |
//|                                                                                         |
//|            ECE385 Final Project, FALL 2020. Copyright: Yian Wang                        |
//|-----------------------------------------------------------------------------------------|
//|-----------------------------------------------------------------------------------------|
//| Inputs:                                                                                 |
//|					Reset, frame_clk		: Basic reset and clk signal                         |
//|					Plant  					: It receives from Coordinate.sv.						  |
//|												  Used for determine whether the plant is built      |
//|					beingEating				: Indicate if there's zombie contact                 |
//|                                                                                         |
//| Outputs:                                                                                |
//|					PlantLive				: Indicate if plant is live                          |
//|												  Used as select signal for a outer MUX to select CM.|
//|                                                                                         |
//|Temp Variables:                                                                          |
//|					HP							: It helps to determine if Plantlive should be 1     |
//|-----------------------------------------------------------------------------------------|
//|=========================================================================================|

module plant(	input 	logic				Reset_h, MAX10_CLK1_50,
					input		logic				Plant,
					input		logic				beingEating,
					input		logic	[9:0]		posX, posY,
					output	logic	[9:0]		plantX, plantY,
					output	logic 			PlantLive
					//output	logic	[2:0]		State,
					//output	logic	[2:0]		HP
					// waiting for more IOs
				);

	logic 		PlantLive_in;
	logic	[9:0]	plantX_in, plantY_in;
	logic [2:0] HP_in, HP;
	//logic	[23:0]	counter;
	
	
	enum logic [2:0]{Dead, Birth, Live, Bleed1, PAUSE1, Bleed2, PAUSE2, Bleed3} state, next_state;

	//assign State = state;
	
	always_ff @ (posedge Reset_h or posedge MAX10_CLK1_50)
	begin
		// Asynchronous Reset
		if (Reset_h)  
		begin 
			state			<= Dead;
		end
		else
		begin
			state			<= next_state;
			PlantLive	<= PlantLive_in;
			HP 			<= HP_in;
			plantX		<=	plantX_in;
			plantY		<=	plantY_in;
		end
	end
	
	always_comb
	begin	 
		next_state 		= Dead;
		HP_in				= 3'b000;
		PlantLive_in	= 1'b0;
		plantX_in		= 10'b0;
		plantY_in		= 10'b0;
		
		unique case(state)
			Dead:
			begin
				if(Plant == 1'b1)
					next_state 	= Birth;
				else
					next_state 	= Dead;
			end
			
			Birth:
			begin
				next_state	=	Live;
			end
			
			Live:
			begin
				if(beingEating == 1'b1)
					next_state 	= Bleed1;
				else
					next_state 	= Live;
			end
			
			Bleed1:
				next_state 		= PAUSE1;  
				
			PAUSE1:
				if(beingEating == 1'b1)
					next_state 	= Bleed2;
				else
					next_state	= PAUSE1;
					
			Bleed2:
				next_state		= PAUSE2;
				
			PAUSE2:
				if(beingEating == 1'b1)
					next_state 	= Bleed3;
				else
					next_state	= PAUSE2;
					
			Bleed3:
				next_state		= Dead;
		endcase
		
		case(state)
			Dead:
			begin
				PlantLive_in	= 1'b0;
				HP_in				= 3'b000;
			end
			
			Birth:
			begin
				PlantLive_in	= 1'b1;
				HP_in				= 3'b011;
				plantX_in		= posX;
				plantY_in		= posY;
			end
			
			Live:
			begin
				PlantLive_in	= 1'b1;
				HP_in				= HP;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
			
			Bleed1:
			begin
				PlantLive_in	= 1'b1;
				HP_in				= 3'b010;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
			
			PAUSE1:
			begin
				PlantLive_in	= PlantLive;
				HP_in				= HP;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
				
			Bleed2:
			begin
				PlantLive_in	= 1'b1;
				HP_in				= 3'b001;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
			
			PAUSE2:
			begin
				PlantLive_in	= PlantLive;
				HP_in 			= HP;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
			
			Bleed3:
			begin
				PlantLive_in	= 1'b0;
				HP_in				= 3'b000;
				plantX_in		= plantX;
				plantY_in		= plantY;
			end
			
		endcase
	end


endmodule 