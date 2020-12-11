module attackAssembler(	input		logic	attack1,			attack2,			attack3,			attack4,			attack5,
													attack6,			attack7,			attack8,			attack9,			attack10,
													attack11,		attack12,		attack13,		attack14,		attack15,
													attack16,		attack17,		attack18,		attack19,		attack20,
								output 	logic	attack);
	logic	[19:0]	att;
	always_comb
	begin
	attack	=	1'b0;
		att	=	{	attack1,			attack2,			attack3,			attack4,			attack5,
						attack6,			attack7,			attack8,			attack9,			attack10,
						attack11,		attack12,		attack13,		attack14,		attack15,
						attack16,		attack17,		attack18,		attack19,		attack20};
		if(att != 20'b0)
			attack	=	1'b1;
	end
	
endmodule 