
module	PlantMapper		(	input		logic	[4:0]		curPlantIndex,
									output	logic	[23:0]	RGB_plant);

always_comb
begin
	RGB_plant	=		24'h0;
	case(curPlantIndex)
	5'h00:	RGB_plant	=	24'hFF0000;
	5'h01:	RGB_plant	=	24'hF83800;
	5'h02:	RGB_plant	=	24'hF0D0B0;
	5'h03:	RGB_plant	=	24'h503000;
	5'h04:	RGB_plant	=	24'hFFE0A8;
	5'h05:	RGB_plant	=	24'h0058F8;
	5'h06:	RGB_plant	=	24'hFCFCFC;
	5'h07:	RGB_plant	=	24'hBCBCBC;
	5'h08:	RGB_plant	=	24'hA40000;
	5'h09:	RGB_plant	=	24'hD82800;
	5'h0a:	RGB_plant	=	24'hFC7460;
	5'h0b:	RGB_plant	=	24'hFCBCB0;
	5'h0c:	RGB_plant	=	24'hF0BC3C;
	5'h0d:	RGB_plant	=	24'hAEACAE;
	5'h0e:	RGB_plant	=	24'h363301;
	5'h0f:	RGB_plant	=	24'h6C6C01;
	5'h10:	RGB_plant	=	24'hBBBD00;
	5'h11:	RGB_plant	=	24'h88D500;
	5'h12:	RGB_plant	=	24'h398802;
	5'h13:	RGB_plant	=	24'h65B0FF;
	5'h14:	RGB_plant	=	24'h155ED8;
	5'h15:	RGB_plant	=	24'h800080;
	5'h16:	RGB_plant	=	24'h24188A;
	endcase
end

endmodule 