module zomAssigner(	
						input		MAX10_CLK1_50,
						input		logic		Generate,
						input		logic		ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
												ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10,		
						
						output	logic 	Generate1,		Generate2,		Generate3,		Generate4,		Generate5,
												Generate6,		Generate7,		Generate8,		Generate9,		Generate10
						);
	
	always_comb
	begin
		Generate1	=	1'b0;
		Generate2	=	1'b0;
		Generate3	=	1'b0;
		Generate4	=	1'b0;
		Generate5	=	1'b0;
		Generate6	=	1'b0;
		Generate7	=	1'b0;
		Generate8	=	1'b0;
		Generate9	=	1'b0;
		Generate10	=	1'b0;
		
		if(Generate == 1'b1)
		begin
					if(ZomLive1	==	1'b0)
				Generate1	=	1'b1;
			else if(ZomLive2	==	1'b0)
				Generate2	=	1'b1;
			else if(ZomLive3	==	1'b0)
				Generate3		=	1'b1;
			else if(ZomLive4	==	1'b0)
				Generate4		=	1'b1;
			else if(ZomLive5	==	1'b0)
				Generate5		=	1'b1;
			else if(ZomLive6	==	1'b0)
				Generate6		=	1'b1;
			else if(ZomLive7	==	1'b0)
				Generate7		=	1'b1;
			else if(ZomLive8	==	1'b0)
				Generate8		=	1'b1;
			else if(ZomLive9	==	1'b0)
				Generate9		=	1'b1;
			else if(ZomLive10	==	1'b0)
				Generate10		=	1'b1;
		end
	end

endmodule 