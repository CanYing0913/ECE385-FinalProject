module	eatAssembler(	input		logic	beingEating1,		beingEating2,		beingEating3,		beingEating4,		beingEating5,
													beingEating6,		beingEating7,		beingEating8,		beingEating9,		beingEating10,
								output	logic	beingEating
							);

	logic	[9:0]	eat;
	always_comb
	begin
	beingEating	=	1'b0;
		eat	=	{	beingEating1,		beingEating2,		beingEating3,		beingEating4,		beingEating5,
						beingEating6,		beingEating7,		beingEating8,		beingEating9,		beingEating10};
		if(eat != 10'b0)
			beingEating	=	1'b1;
	end				
						
						
endmodule 