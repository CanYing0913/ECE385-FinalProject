/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  CoordinateROM
(
		input [18:0] read_address_coor,
		input frame_clk,

		output logic [4:0] curCoordinateIndex
);

// mem has width of 5 bits and a total of 4900 addresses| 0-0x16
logic [4:0] mem [4900];

initial
begin
	 $readmemh("Coordinate.txt", mem);
end


always_ff @ (posedge frame_clk) begin
	curCoordinateIndex	<= mem[read_address_coor];
end

endmodule
