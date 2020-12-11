/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */
//	BackGround is 480*640
module  BackGroundROM
(
		input [18:0] read_address_bg,
		input frame_clk,

		output logic [4:0] curBGIndex
);

// mem has width of 5 bits and a total of 307200 addresses| 0-16
logic [4:0] mem [76800];

initial
begin
	 $readmemh("bg.txt", mem);
end


always_ff @ (posedge frame_clk) begin
	curBGIndex	<= mem[read_address_bg];
end

endmodule
