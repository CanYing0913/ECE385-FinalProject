/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  PlantROM
(
		input [18:0] read_address_plant,
		input MAX10_CLK1_50,

		output logic [4:0] curPlantIndex
);

// mem has width of 5 bits and a total of 7200 addresses| 0-0x16
logic [4:0] mem [3600];

initial
begin
	 $readmemh("pea_shooter.txt", mem);
end


always_ff @ (posedge MAX10_CLK1_50) begin
	curPlantIndex	<= mem[read_address_plant];
end

endmodule