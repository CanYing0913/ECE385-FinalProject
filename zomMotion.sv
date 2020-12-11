module zomMotion( input 							frame_clk,
						input 	logic					ZomLive,
						input		logic		[9:0]		startX, startY, stopX,
						output	logic 	[9:0]  	ZomCentralX, ZomCentralY,
						output	logic					END, eat
						//output	logic 	[9:0] 	ZomX_Motion, ZomX_Pos, ZomY_Pos,
						//output				[1:0]		State
						);

	logic [9:0] ZomX_Motion, ZomX_Pos, ZomY_Pos;
	logic			eat_in;

	parameter [9:0] X_Min=0;       // Leftmost point on the X axis
	parameter [9:0] X_Max=639;     // Rightmost point on the X axis
	parameter [9:0] X_Step=1;      // Step size on the X axis
	assign	ZomX_Motion	=	(~(X_Step) + 10'b01);
	//assign	ZomX_Motion	=	X_Step;
	
	enum logic [1:0]{initialize, move, stop, EAT} state, next_state;
	//assign State = state;
	always_ff @ (posedge frame_clk)
	begin
		state			<= next_state;
		ZomCentralX	<=	ZomX_Pos;
		ZomCentralY	<=	ZomY_Pos;
		eat			<=	eat_in;
	end
	
	always_comb
	begin	 
		next_state 	= initialize;
		ZomX_Pos		= 10'b0;
		ZomY_Pos		= 10'b0;
		END			= 1'b0;
		eat_in		= 1'b0;
		
		unique case(state)
			initialize:
			begin
				if(ZomLive == 1'b1)
					next_state 	= move;
				else
					next_state 	= initialize;
			end
			
			move:
			begin
				if(ZomLive == 1)
				begin
					if(ZomCentralX == 10'b0 + 10'b1)
						next_state	= EAT;
					else if(ZomCentralX == stopX + 10'b1)
						next_state	=	stop;
					else
						next_state	= move;
				end
			end
			
			stop:
			begin
				if(ZomLive == 1)
				begin
					if(ZomCentralX != stopX + 10'b1)
						next_state	=	move;
					else
						next_state	=	stop;
				end
			end
			
			EAT:
			begin
				next_state 	= EAT;
			end
		endcase
		
		case(state)
			initialize:
			begin
				ZomX_Pos		= startX;
				ZomY_Pos		= startY;
			end
			
			move:
			begin
				ZomX_Pos		= ZomCentralX + ZomX_Motion;
				ZomY_Pos		= startY;
			end
			
			stop:
			begin
				ZomX_Pos		= stopX + 10'b1;
				ZomY_Pos		= ZomCentralY;
				eat_in		= 1'b1;
			end
			
			EAT:
			begin
				ZomX_Pos		= 10'd680;
				ZomY_Pos		= startY;
				END			= 1'b1;
			end
		endcase
	end

	
endmodule 