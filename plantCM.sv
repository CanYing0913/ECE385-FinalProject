// Inputs:
//					DrawX, DrawY			: VGA Beam coordinate
//					PlantX, PlantY			: Center for current plant
//
// Outputs:
//					Red, Green, Blue		: RGB correspond to DrawX & DrawY to master CM.
//
// Temp Variables:



module plantCM(input							clk,
					input	[9:0]					DrawX, DrawY,
					input	[9:0]					PlantX, PlantY,
					output [7:0]				Red, Green, Blue);
	always_ff @ (negedge clk)
	case (DrawX, DrawY)
		
	endcase
endmodule 