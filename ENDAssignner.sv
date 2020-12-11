module ENDAssigner(	input 	logic	CLK,
							input		logic	END1, 	END2, 	END3, 	END4, 	END5,
							input		logic	END6, 	END7, 	END8, 	END9, 	END10,
							
							output 	logic	END
							);
	logic	[9:0]	NET;
						
	always_ff @ (posedge CLK)
	begin
		NET	<=	{END1,END2,END3,END4,END5,END6,END7,END8,END9,END10};
	end
	
	always_comb
	begin
		if(NET	==	10'b0)
			END	=	1'b0;
		else
			END	=	1'b1;
	end

endmodule 