
module	ENDMapper		(	input		logic	[4:0]		curENDIndex,
									output	logic	[23:0]	RGB_end);

always_comb
begin
	RGB_end	=		24'h0;
	case(curENDIndex)
	5'h00:	RGB_end	=	24'hFF0000;
	5'h01:	RGB_end	=	24'hF83800;
	5'h02:	RGB_end	=	24'hF0D0B0;
	5'h03:	RGB_end	=	24'h503000;
	5'h04:	RGB_end	=	24'hFFE0A8;
	5'h05:	RGB_end	=	24'h0058F8;
	5'h06:	RGB_end	=	24'hFCFCFC;
	5'h07:	RGB_end	=	24'hBCBCBC;
	5'h08:	RGB_end	=	24'hA40000;
	5'h09:	RGB_end	=	24'hD82800;
	5'h0a:	RGB_end	=	24'hFC7460;
	5'h0b:	RGB_end	=	24'hFCBCB0;
	5'h0c:	RGB_end	=	24'hF0BC3C;
	5'h0d:	RGB_end	=	24'hAEACAE;
	5'h0e:	RGB_end	=	24'h363301;
	5'h0f:	RGB_end	=	24'h6C6C01;
	5'h10:	RGB_end	=	24'hBBBD00;
	5'h11:	RGB_end	=	24'h88D500;
	5'h12:	RGB_end	=	24'h398802;
	5'h13:	RGB_end	=	24'h65B0FF;
	5'h14:	RGB_end	=	24'h155ED8;
	5'h15:	RGB_end	=	24'h800080;// this is treated as apparance
	5'h16:	RGB_end	=	24'h24188A;
	endcase
end

endmodule 