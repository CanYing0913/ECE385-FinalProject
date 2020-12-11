//|=======================================pea.sv============================================|
//|-----------------------------------------------------------------------------------------|
//| This module controls postion/movement of the pea of given pea shooter, AKA the plant.   |
//| Based on output PlantLive from plant.sv, the master CM will take peaCM to get RGB in    |
//| coordinates specified by current position.                                              |
//|                                                                                         |
//|            ECE385 Final Project, FALL 2020. Copyright: Yian Wang                        |
//|-----------------------------------------------------------------------------------------|
//|-----------------------------------------------------------------------------------------|
//| Inputs:                                                                                 |
//|					frame_clk      		: Basic reset and clk signal                         |
//|												  Reset if non-nessesary since pea is controlled by  |
//|												  PlantLive already.											  |
//|					PlantLive  				: It receives from plant.sv.				      		  |
//|												  Used to know when to move to the right				  |
//|					startX, startY			: It receives from coordinate.sv to indicate the     |
//|                                      position of the plant, which is equavalent to the  |
//|                                      starting point of pea.                             |
//|               nearX, nearY			: It is generated from somewhere to find the nearest |
//|                                      collision(zombie) or the rightmost wall.           |
//|                                                                                         |
//| Outputs:                                                                                |
//|					BallX, BallY,			: Current position of the pea                        |
//|												  Used for peaCM selected by PlantLive.				  |
//|					State						: Used for testing correct FSM.							  |
//|                                                                                         |
//|Temp Variables:                                                                          |
//|					BallX_in, BallY_in	: They are temp signals updating both x&y coordinates|
//|					Ball_Size				: Haven't been used yet, should create output to CM  |
//|                                                                                         |
//|Parameters:                                                                              |
//|               Ball_X_Max   			: Rightmost wall. Not used becuase not decide if it  |
//|                                      it included in nearX.                              |
//|               Ball_X_Step				: step size of motion                                |
//|                                                                                         |
//|States:                                                                                  |
//|               Dead                 : If the plant is not alive                          |
//|               Start                : leftmost position of the pea                       |
//|               Middle               : During motion                                      |
//|               End                  : Hitting enermy or out of right wall                |
//|-----------------------------------------------------------------------------------------|
//|=========================================================================================|

module pea(	input 						frame_clk,
				input							PlantLive,
				input		logic	[9:0]		startX, startY,
				input		logic	[9:0]		stopX,
				output	logic	[9:0]		BallX, BallY,
				output	logic				hit
				//output	logic	[1:0]		State				// Used for testing
				);
	
	logic [9:0]	BallX_in, BallY_in, right;
	logic			hit_in;
	logic	[23:0]	counter, counter_in;
	 
	parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
	parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
	parameter	[23:0] unit	=	1;
		
	enum logic [2:0]{Dead, Start, Middle, End, cnt} state, next_state;

	//assign State = state;
	
	always_ff @ (posedge frame_clk)
	begin
		state			<= next_state;
		BallX			<= BallX_in;
		BallY 		<= BallY_in;
		hit			<=	hit_in;
		counter	<=	counter_in;
	end
	
	always_comb
	begin	 
		if(stopX < Ball_X_Max && stopX > 200)
			right	=	stopX;
		else
			right	=	Ball_X_Max;
		next_state 	= Dead;
		BallX_in		= startX;
		BallY_in		= startY;
		hit_in		= 0;
		counter_in	= 24'd50000;
		unique case(state)
			Dead:
			begin
				if(PlantLive == 1'b1)
					next_state	= Start;
				else
					next_state	= Dead;
			end
			
			Start:
			begin
				if(PlantLive == 1'b1)
					next_state 	= Middle;
				else
					next_state 	= Dead;
			end
			
			Middle:
			begin
				if(PlantLive == 1'b1)
				begin
					if(BallX <= right - 10'd5 && BallX >= startX + 10'd10)
						next_state	= Middle;
					else
						next_state	= End;
				end
				else
					next_state	= Dead;				
			end
			
			End:
			begin
				if(PlantLive == 1'b1)
					next_state 	= Start;
				else
					next_state 	= Dead;
			end
			
//			cnt:
//			begin
//				if(PlantLive)
//				begin
//					if(counter <= 0)
//						next_state	=	Start;
//					else
//						next_state	=	cnt;
//				end
//				else
//					next_state	=	Dead;
//			end
		endcase
		
		case(state)
			Dead:
			begin
				BallX_in		= startX;	// Not important since not selected
				BallY_in		= startY;
			end
			
			Start:
			begin
				BallX_in		= startX + 10'd10;
				BallY_in		= startY;// - 10'd5;
			end
			
			Middle:
			begin
				BallX_in		= BallX + Ball_X_Step;
				BallY_in		= startY;
			end
			
			End:
			begin
				BallX_in		= right-1;
				BallY_in		= startY;
				hit_in		= 1'b1;
			end
			
//			cnt:
//			begin
//				BallX_in		= 680;
//				BallY_in		= startY;
//				counter_in	=	counter +(~(unit)+1'b1);
//			end
		endcase
	end


endmodule 