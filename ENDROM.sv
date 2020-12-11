/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  ENDROM
(
		input [18:0] read_address_end,
		input MAX10_CLK1_50,

		output logic [4:0] curENDIndex
);

// mem has width of 5 bits and a total of 7200 addresses| 0-0x16
logic [4:0] mem [100000];

initial
begin
	 $readmemh("end of the game.txt", mem);
end


always_ff @ (posedge MAX10_CLK1_50) begin
	curENDIndex	<= mem[read_address_end];
end

endmodule