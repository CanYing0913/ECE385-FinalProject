//|=====================================zombie.sv===========================================|
//|-----------------------------------------------------------------------------------------|
//| This module controls lives/death of the Zombie, as well as the HP calculations&motions. |
//| Based on its output ZomLive, the master CM will take ZomCM to get RGB in correspond 	  |
//| coordinates specified by current position.                                              |
//|                                                                                         |
//|            ECE385 Final Project, FALL 2020. Copyright: Yian Wang                        |
//|-----------------------------------------------------------------------------------------|
//|-----------------------------------------------------------------------------------------|
//| Inputs:                                                                                 |
//|					Reset, frame_clk		: Basic reset and clk signal                         |
//|					Generate  				: It receives from somewhere.				      		  |
//|												  Used generate zombie										  |
//|												  Later I can use srand to have random generator	  |
//|					beingAttack				: Indicate if there's pea colision                   |
//|                                                                                         |
//| Outputs:                                                                                |
//|					ZomLive					: Indicate if zombie is live                         |
//|												  Used as select signal for a outer MUX to select CM.|
//|												  And for zomMotion.sv to give movements of zombie.  |
//|                                                                                         |
//|Temp Variables:                                                                          |
//|					HP							: It helps to determine if Plantlive should be 1     |
//|												  after Generate is 1.                               |
//|-----------------------------------------------------------------------------------------|
//|=========================================================================================|

module zombie(	input 						Reset_h, MAX10_CLK1_50,
					input							Generate,
					input							beingAttack,
					output	logic 			ZomLive
					//output	logic	[2:0]		State,
					//output	logic	[2:0]		HP
					);

	logic ZomLive_in;
	logic [2:0] HP, HP_in;
	
	parameter [2:0] damage = 3'b001;	
	
	enum logic [2:0]{Dead, Born, Live, GetAttack, EndAttack} state, next_state;

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
			ZomLive		<= ZomLive_in;
			HP 			<= HP_in;
		end
	end
	
	always_comb
	begin	 
		next_state 	= Dead;
		HP_in			= 3'b000;
		ZomLive_in	= 1'b0;
		
		unique case(state)
			Dead:
			begin
				if(Generate == 1'b1)
					next_state 	= Born;
				else
					next_state 	= Dead;
			end
			
			Born:
			begin
				next_state		= Live;
			end
			
			Live:
			begin
				if(beingAttack == 1'b1)
					next_state 	= GetAttack;
				else
					next_state 	= Live;
			end
			
			GetAttack:
			begin
				next_state	= EndAttack;
			end
					
			EndAttack:
			begin
				if(HP == 3'b000)
					next_state		= Dead;
				else if(beingAttack == 1'b0 && HP != 3'b000)
					next_state		= Live;
				else
					next_state		= EndAttack;
			end
		endcase
		
		case(state)
			Dead:
			begin
				ZomLive_in	= 1'b0;
				HP_in			= 3'b000;
			end
			
			Born:
			begin
				ZomLive_in	= 1'b1;
				HP_in			= 3'b011;
			end
			
			Live:
			begin
				ZomLive_in	= 1'b1;
				HP_in			= HP;
			end
			
			GetAttack:
			begin
				ZomLive_in	= 1'b1;
				HP_in			= HP + (~(damage) + 1'b1);
			end

			EndAttack:
			begin
				ZomLive_in	= 1'b1;
				HP_in			= HP;
			end
		endcase
	end

endmodule 