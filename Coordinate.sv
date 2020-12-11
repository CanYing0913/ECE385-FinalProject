//|===================================Coordinate.sv=========================================|
//|-----------------------------------------------------------------------------------------|
//| This module is used for selecting where to plant the pea shooter.                       |
//| At current position, it will give a special RGB signal indicating yellow on VGA display.|
//| It basically generates the centralX and CentralY for each plant module,                 |
//| And it is also a part of color mapper.                                                  |
//|                                                                                         |
//|               ECE385 Final Project, FALL 2020. Copyright: Yian Wang                     |
//|-----------------------------------------------------------------------------------------|
//|-----------------------------------------------------------------------------------------|
//| Inputs:                                                                                 |
//|					Reset, frame_clk		: Basic reset and clk signal                         |
//|					keycode					: Used for determine whether the plant is built      |
//|												  And the movement of position of current coordinate.|
//|                                                                                         |
//| Outputs:                                                                                |
//|					curX						: Current central position for X coordinate.         |
//|					curY						: Current central position for Y coordinate.         |
//|					Plant    				: Indicate if plant is built                         |
//|												  It gives plant.sv together to determine ifLive.    |
//|                                                                                         |
//|Temp Variables:                                                                          |
//|					nextX						: Temp X Coordinate                                  |
//|					nextY						: Temp Y Coordinate                                  |
//|					Plant_in					: Temp Plant signal                                  |
//|												  after isBuilt is 1.                                |
//|Parameters:																										  |
//|					upCoordinate			: UpperBoundary for tiles									  |
//|					downCoordinate			: LowerBoundary for tiles									  |
//|					rightCoordinate		: RightBoundary for tiles									  |
//|					leftCoordinate			: LeftBoundary for tiles                             |
//|					xDifference				: Difference of X between tiles							  |
//|					yDifference				: Difference of Y between tiels							  |
//|-----------------------------------------------------------------------------------------|
//|=========================================================================================|

module Coordinate(input 	logic	[7:0]			keycode,
						input 							MAX10_CLK1_50, Reset_h,
						output	logic	[9:0]			curX, curY,
						output	logic					Plant);
	
	parameter	[9:0]	upCoordinate		=	110; // temp, all parameter values set for test
	parameter	[9:0]	downCoordinate		=	390;
	parameter	[9:0]	rightCoordinate	=	550;
	parameter	[9:0]	leftCoordinate		=	200;
	parameter	[9:0]	xDifference			=	70;
	parameter	[9:0]	yDifference			=	70;
	
	logic			[9:0]	nextX;
	logic			[9:0]	nextY;
	logic					Plant_in;
	logic			[2:0]	stateNum;
	
	
	enum logic [2:0]{START, HALT, W, S, A, D, E, STOP}	state, next_state;
	assign stateNum = state;
	
	always_ff @(posedge Reset_h or posedge MAX10_CLK1_50)
	begin
		if(Reset_h)
		begin
			state		<= START;
		end
		else
		begin
			state 	<= next_state;
			curX 		<=	nextX;
			curY 		<=	nextY;
			Plant		<= Plant_in;
		end
	end
	
	always_comb
	begin
		// Default Condition
		next_state	=	START;
		nextX 		=	leftCoordinate;
		nextY 		=	upCoordinate;
		Plant_in		= 	1'b0;
		
		unique case(state)
			START:
				next_state = HALT;
			HALT:
			begin
				if(keycode == 8'h1A)
					next_state = W;
				else if(keycode == 8'h16)
					next_state = S;
				else if(keycode == 8'h04)
					next_state = A;
				else if(keycode == 8'h07)
					next_state = D;
				else if(keycode == 8'h08)
					next_state = E;
				else
					next_state = HALT;
			end
			
			W:
			begin
				next_state = STOP;
			end
			
			S:
			begin
				next_state = STOP;
			end
			
			A:
			begin
				next_state = STOP;
			end
			
			D:
			begin
				next_state = STOP;
			end
			
			E:
			begin
				next_state = STOP;
			end
			
			STOP:
			begin
				if(keycode == 8'b0)
					next_state = HALT;
				else
					next_state = STOP;
			end
		endcase
		
		case(state)
			START:
			begin
				nextX 	=	leftCoordinate;
				nextY 	=	upCoordinate;
				Plant_in	= 	1'b0;
			end
			HALT:
			begin
				nextX		= 	curX;
				nextY 	= 	curY;
				Plant_in	= 	Plant;
			end
			A:
			begin
				if(curX > leftCoordinate)
					nextX = curX - xDifference;
				else
					nextX = curX;
				nextY 	= curY;
				Plant_in = Plant;
			end

			D:
			begin
				if(curX < rightCoordinate)
					nextX = curX + xDifference;
				else
					nextX = curX;
				nextY		= curY;
				Plant_in = Plant;
			end

			W:
			begin
				if(curY > upCoordinate)
					nextY = curY - yDifference;
				else
					nextY = curY;
				nextX		= curX;
				Plant_in = Plant;
			end

			S:
			begin
				if(curY < downCoordinate)
					nextY = curY + yDifference;
				else
					nextY = curY;
				nextX		= curX;
				Plant_in = Plant;
			end

			E:
			begin
				nextX 	= curX;
				nextY		= curY;
				Plant_in = 1'b1;
			end
			
			STOP:
			begin
				nextX		= curX;
				nextY		= curY;
				Plant_in	= 1'b0;
			end
		endcase
	end

endmodule 