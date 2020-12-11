/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  ZombieROM
(
		input [18:0] read_address_zom,
		input MAX10_CLK1_50,

		output logic [4:0] curZomIndex
);

// mem has width of 5 bits and a total of 7200 addresses| 0-0x16
logic [4:0] mem [3500];

initial
begin
	 $readmemh("zombie.txt", mem);
end


always_ff @ (posedge MAX10_CLK1_50) begin
	curZomIndex	<= mem[read_address_zom];
end

endmodule
