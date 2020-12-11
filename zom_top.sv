module zom_top(	input		logic				MAX10_CLK1_50,	Reset_h, 		VGA_VS,			//Generate,
						input		logic	[7:0]		keycode,
//						input		logic	[9:0]		startX,			startY1,			startY2,			startY3,			startY4,			startY5,
						input		logic	[9:0]		plant1X, 		plant1Y,			plant2X, 		plant2Y,
														plant3X, 		plant3Y,			plant4X, 		plant4Y,
														plant5X, 		plant5Y,			plant6X, 		plant6Y,
														plant7X, 		plant7Y,			plant8X, 		plant8Y,
														plant9X, 		plant9Y,			plant10X, 		plant10Y,
														plant11X, 		plant11Y,		plant12X, 		plant12Y,
														plant13X, 		plant13Y,		plant14X, 		plant14Y,
														plant15X, 		plant15Y,		plant16X, 		plant16Y,
														plant17X, 		plant17Y,		plant18X, 		plant18Y,
														plant19X, 		plant19Y,		plant20X, 		plant20Y, DrawX, DrawY,
						input	logic					attack1,			attack2,			attack3,			attack4,			attack5,
														attack6,			attack7,			attack8,			attack9,			attack10,
														PlantLive1, 	PlantLive2, 	PlantLive3, 	PlantLive4, 	PlantLive5,
														PlantLive6, 	PlantLive7, 	PlantLive8, 	PlantLive9, 	PlantLive10,
														PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
														PlantLive16,	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20,
						output	logic	[9:0]		ZomCentralX1,	ZomCentralX2,	ZomCentralX3,	ZomCentralX4,	ZomCentralX5,
														ZomCentralX6,	ZomCentralX7,	ZomCentralX8,	ZomCentralX9,	ZomCentralX10,
														ZomCentralY1,	ZomCentralY2,	ZomCentralY3,	ZomCentralY4,	ZomCentralY5,
														ZomCentralY6,	ZomCentralY7,	ZomCentralY8,	ZomCentralY9,	ZomCentralY10,
						output	logic				beingEating1, 	beingEating2, 	beingEating3, 	beingEating4, 	beingEating5,
														beingEating6, 	beingEating7, 	beingEating8, 	beingEating9, 	beingEating10,
														beingEating11, beingEating12, beingEating13, beingEating14, beingEating15,
														beingEating16,	beingEating17,	beingEating18,	beingEating19,	beingEating20,
						
						output	logic	[23:0]	RGB_zom, 		RGB_end,
						output	logic				zom_on,			END_on,
						output	logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
														ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10
						
						);
//|========================================================================================|
//|								Zombie releated variables declaration					 			    |
//|========================================================================================|
	logic				END1,				END2,				END3,				END4,				END5,
						END6,				END7,				END8,				END9,				END10, Generate;
						
	logic				zom_on1, 		zom_on2, 		zom_on3, 		zom_on4, 		zom_on5,
						zom_on6, 		zom_on7, 		zom_on8, 		zom_on9, 		zom_on10;
						
	logic				eat1, 			eat2, 			eat3, 			eat4, 			eat5,
						eat6, 			eat7, 			eat8, 			eat9, 			eat10;
	
	logic				Generate1,		Generate2,		Generate3,		Generate4,		Generate5,
						Generate6,		Generate7,		Generate8,		Generate9,		Generate10;					
						
//	logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
//						ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10;
						
	logic				beingEating1_1,		beingEating1_2,		beingEating1_3,		beingEating1_4,		beingEating1_5,
						beingEating1_6,		beingEating1_7,		beingEating1_8,		beingEating1_9,		beingEating1_10,
						beingEating2_1,		beingEating2_2,		beingEating2_3,		beingEating2_4,		beingEating2_5,
						beingEating2_6,		beingEating2_7,		beingEating2_8,		beingEating2_9,		beingEating2_10,
						beingEating3_1,		beingEating3_2,		beingEating3_3,		beingEating3_4,		beingEating3_5,
						beingEating3_6,		beingEating3_7,		beingEating3_8,		beingEating3_9,		beingEating3_10,
						beingEating4_1,		beingEating4_2,		beingEating4_3,		beingEating4_4,		beingEating4_5,
						beingEating4_6,		beingEating4_7,		beingEating4_8,		beingEating4_9,		beingEating4_10,
						beingEating5_1,		beingEating5_2,		beingEating5_3,		beingEating5_4,		beingEating5_5,
						beingEating5_6,		beingEating5_7,		beingEating5_8,		beingEating5_9,		beingEating5_10,
						beingEating6_1,		beingEating6_2,		beingEating6_3,		beingEating6_4,		beingEating6_5,
						beingEating6_6,		beingEating6_7,		beingEating6_8,		beingEating6_9,		beingEating6_10,
						beingEating7_1,		beingEating7_2,		beingEating7_3,		beingEating7_4,		beingEating7_5,
						beingEating7_6,		beingEating7_7,		beingEating7_8,		beingEating7_9,		beingEating7_10,
						beingEating8_1,		beingEating8_2,		beingEating8_3,		beingEating8_4,		beingEating8_5,
						beingEating8_6,		beingEating8_7,		beingEating8_8,		beingEating8_9,		beingEating8_10,
						beingEating9_1,		beingEating9_2,		beingEating9_3,		beingEating9_4,		beingEating9_5,
						beingEating9_6,		beingEating9_7,		beingEating9_8,		beingEating9_9,		beingEating9_10,
						beingEating10_1,		beingEating10_2,		beingEating10_3,		beingEating10_4,		beingEating10_5,
						beingEating10_6,		beingEating10_7,		beingEating10_8,		beingEating10_9,		beingEating10_10,
						beingEating11_1,		beingEating11_2,		beingEating11_3,		beingEating11_4,		beingEating11_5,
						beingEating11_6,		beingEating11_7,		beingEating11_8,		beingEating11_9,		beingEating11_10,
						beingEating12_1,		beingEating12_2,		beingEating12_3,		beingEating12_4,		beingEating12_5,
						beingEating12_6,		beingEating12_7,		beingEating12_8,		beingEating12_9,		beingEating12_10,
						beingEating13_1,		beingEating13_2,		beingEating13_3,		beingEating13_4,		beingEating13_5,
						beingEating13_6,		beingEating13_7,		beingEating13_8,		beingEating13_9,		beingEating13_10,
						beingEating14_1,		beingEating14_2,		beingEating14_3,		beingEating14_4,		beingEating14_5,
						beingEating14_6,		beingEating14_7,		beingEating14_8,		beingEating14_9,		beingEating14_10,
						beingEating15_1,		beingEating15_2,		beingEating15_3,		beingEating15_4,		beingEating15_5,
						beingEating15_6,		beingEating15_7,		beingEating15_8,		beingEating15_9,		beingEating15_10,
						beingEating16_1,		beingEating16_2,		beingEating16_3,		beingEating16_4,		beingEating16_5,
						beingEating16_6,		beingEating16_7,		beingEating16_8,		beingEating16_9,		beingEating16_10,
						beingEating17_1,		beingEating17_2,		beingEating17_3,		beingEating17_4,		beingEating17_5,
						beingEating17_6,		beingEating17_7,		beingEating17_8,		beingEating17_9,		beingEating17_10,
						beingEating18_1,		beingEating18_2,		beingEating18_3,		beingEating18_4,		beingEating18_5,
						beingEating18_6,		beingEating18_7,		beingEating18_8,		beingEating18_9,		beingEating18_10,
						beingEating19_1,		beingEating19_2,		beingEating19_3,		beingEating19_4,		beingEating19_5,
						beingEating19_6,		beingEating19_7,		beingEating19_8,		beingEating19_9,		beingEating19_10,
						beingEating20_1,		beingEating20_2,		beingEating20_3,		beingEating20_4,		beingEating20_5,
						beingEating20_6,		beingEating20_7,		beingEating20_8,		beingEating20_9,		beingEating20_10;
						
	logic	[18:0]	zomaddress1,	zomaddress2,	zomaddress3,	zomaddress4,	zomaddress5,
						zomaddress6,	zomaddress7,	zomaddress8,	zomaddress9,	zomaddress10, read_address_zom, read_address_end;
						
	logic	[9:0]		stopX1,			stopX2,			stopX3,			stopX4,			stopX5,
						stop1,			stop2,			stop3,			stop4,			stop5,
						stop6,			stop7,			stop8,			stop9,			stop10,
						
						startY1,			startY2,			startY3,			startY4,			startY5,	
						startX;
	assign			startY1	= 	110;
	assign			startY2	= 	180;
	assign			startY3	= 	250;
	assign			startY4	= 	320;
	assign			startY5	= 	390;
	assign			startX	=	640;
	logic	[4:0]		curZomIndex, curENDIndex;
//|========================================================================================|
//|											End of Declaration												 |
//|========================================================================================|	
	logic	[24:0] counter;
	enum logic [4:0] {HALT, first, pause1,second, pause2, third, pause3, fourth, pause4, fifth, pause}state, next_state;
	always_ff@(posedge MAX10_CLK1_50)
	begin
		state	<=	next_state;
	end
						
	always_comb
	begin
		next_state	=	HALT;
		Generate		=	1'b0;
		counter		=	25'd10000000;
		
		unique case(state)
			HALT:
			begin
				if(keycode	==		8'h20)
					next_state	=	first;
				else
					next_state	=	HALT;
			end
			
			first:
//			begin
////				next_state	=	pause1;
//			end
//			
//			pause1:
//			begin
//				if(counter == 25'd0)
//					next_state	=	second;
//				else
//					next_state	=	pause1;
//			end
//			second:
//			begin
//				next_state	=	pause2;
//			end
//			
//			pause2:
//			begin
//				if(counter == 25'd0)
//					next_state	=	third;
//				else
//					next_state	=	pause2;
//			end
//			
//			third:
//				next_state	=	pause3;
//				
//			pause3:
//			begin
//				if(counter == 25'd0)
//					next_state	=	fourth;
//				else
//					next_state	=	pause3;
//			end
//			fourth:
//				next_state	=	pause4;
//			
//			pause4:
//			begin
//				if(counter == 25'd0)
//					next_state	=	fifth;
//				else
//					next_state	=	pause4;
//			end
//			fifth:
				next_state	=	pause;
			pause:
				if(keycode != 8'h0)
					next_state	=	pause;
				else
					next_state	=	HALT;
		endcase
		
		case(state)
			first:
			begin
				Generate	=	1'b1;
			end
//			
//			pause1:
//				counter	=	counter	-	1;
//			
//			second:
//				Generate	=	1'b1;
//				
//			pause2:
//				counter	=	counter	-	1;
//			
//			third:
//				Generate	=	1'b1;
//			
//			pause3:
//				counter	=	counter	-	1;
//				
//			fourth:
//				Generate	=	1'b1;
//			
//			pause4:
//				counter	=	counter	-	1;
//			fifth:
//				Generate	=	1'b1;.
			pause:
				Generate	=	0;
		endcase
	end
						
	ZombieROM					zomrom	(.*);
	ZomMapper					zommap	(.*);
	zomAssigner					zomas		(.*);
	zomAssembler				zomasb	(.*,			 .address1(zomaddress1), 	.address2(zomaddress2), .address3(zomaddress3), 	.address4(zomaddress4), 	.address5(zomaddress5),
																 .address6(zomaddress6), 	.address7(zomaddress7), .address8(zomaddress8), 	.address9(zomaddress9), 	.address10(zomaddress10));
	
	zombie						zomb1		(.*,			.Generate(Generate1),		.beingAttack(attack1),		.ZomLive(ZomLive1));
	zomMotion					zomMove1	(.*, 			.frame_clk(VGA_VS), 			.END(END1), 					.startY(startY1),
												 .stopX(stop1),								.eat(eat1),						.ZomLive(ZomLive1),
												 .ZomCentralX(ZomCentralX1),				.ZomCentralY(ZomCentralY1));
	Zom_calculator				zc1		(.*, 			.ZomX(ZomCentralX1),			.ZomY(ZomCentralY1),			.ZomLive(ZomLive1),
												 .address(zomaddress1),						.zom_on(zom_on1));
	matcher1						mc1		(.*,			.BallX(ZomCentralX1),		.BallY(ZomCentralY1),		.stopX(stop1));
	eatFinder					ef1_1		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating1),.result(beingEating1_1),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef1_2		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating2),.result(beingEating2_1),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef1_3		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating3),.result(beingEating3_1),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef1_4		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating4),.result(beingEating4_1),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef1_5		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating5),.result(beingEating5_1),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef1_6		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating6),.result(beingEating6_1),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef1_7		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating7),.result(beingEating7_1),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef1_8		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating8),.result(beingEating8_1),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef1_9		(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating9),.result(beingEating9_1),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef1_10	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating10),.result(beingEating10_1),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef1_11	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating11),.result(beingEating11_1),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef1_12	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating12),.result(beingEating12_1),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef1_13	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating13),.result(beingEating13_1),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef1_14	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating14),.result(beingEating14_1),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef1_15	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating15),.result(beingEating15_1),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef1_16	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating16),.result(beingEating16_1),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef1_17	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating17),.result(beingEating17_1),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef1_18	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating18),.result(beingEating18_1),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef1_19	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating19),.result(beingEating19_1),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef1_20	(.*,			.stopX(stop1),					.ZomCentralX(ZomCentralX1),.ZomCentralY(ZomCentralY1),
												 .eat(eat1),.beingEating(beingEating20),.result(beingEating20_1),
												 .plantX(plant20X),							.plantY(plant20Y));
	
	zombie						zomb2		(.*,			.Generate(Generate2),		.beingAttack(attack2),		.ZomLive(ZomLive2));
	zomMotion					zomMove2	(.*, 			.frame_clk(VGA_VS), 			.END(END2), 					.startY(startY4),
												 .stopX(stop2),								.eat(eat2),						.ZomLive(ZomLive2),
												 .ZomCentralX(ZomCentralX2),				.ZomCentralY(ZomCentralY2));
	Zom_calculator				zc2		(.*, 			.ZomX(ZomCentralX2),			.ZomY(ZomCentralY2),			.ZomLive(ZomLive2),
												 .address(zomaddress2),						.zom_on(zom_on2));
	matcher1						mc2		(.*,			.BallX(ZomCentralX2),		.BallY(ZomCentralY2),		.stopX(stop2));
	eatFinder					ef2_1		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating1),.result(beingEating1_2),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef2_2		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating2),.result(beingEating2_2),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef2_3		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating3),.result(beingEating3_2),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef2_4		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating4),.result(beingEating4_2),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef2_5		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating5),.result(beingEating5_2),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef2_6		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating6),.result(beingEating6_2),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef2_7		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating7),.result(beingEating7_2),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef2_8		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating8),.result(beingEating8_2),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef2_9		(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating9),.result(beingEating9_2),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef2_10	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating10),.result(beingEating10_2),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef2_11	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating11),.result(beingEating11_2),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef2_12	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating12),.result(beingEating12_2),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef2_13	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating13),.result(beingEating13_2),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef2_14	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating14),.result(beingEating14_2),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef2_15	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating15),.result(beingEating15_2),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef2_16	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating16),.result(beingEating16_2),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef2_17	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating17),.result(beingEating17_2),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef2_18	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating18),.result(beingEating18_2),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef2_19	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating19),.result(beingEating19_2),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef2_20	(.*,			.stopX(stop2),					.ZomCentralX(ZomCentralX2),.ZomCentralY(ZomCentralY2),
												 .eat(eat2),.beingEating(beingEating20),.result(beingEating20_2),
												 .plantX(plant20X),							.plantY(plant20Y));
	
	zombie						zomb3		(.*,			.Generate(Generate3),		.beingAttack(attack3),		.ZomLive(ZomLive3));
	zomMotion					zomMove3	(.*, 			.frame_clk(VGA_VS), 			.END(END3), 					.startY(startY2),
												 .stopX(stop3),								.eat(eat3),						.ZomLive(ZomLive3),
												 .ZomCentralX(ZomCentralX3),				.ZomCentralY(ZomCentralY3));
	Zom_calculator				zc3		(.*, 			.ZomX(ZomCentralX3),			.ZomY(ZomCentralY3),			.ZomLive(ZomLive3),
												 .address(zomaddress3),						.zom_on(zom_on3));
	matcher1						mc3		(.*,			.BallX(ZomCentralX3),		.BallY(ZomCentralY3),		.stopX(stop3));
	eatFinder					ef3_1		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating1),.result(beingEating1_3),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef3_2		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating2),.result(beingEating2_3),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef3_3		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating3),.result(beingEating3_3),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef3_4		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating4),.result(beingEating4_3),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef3_5		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating5),.result(beingEating5_3),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef3_6		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating6),.result(beingEating6_3),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef3_7		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating7),.result(beingEating7_3),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef3_8		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating8),.result(beingEating8_3),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef3_9		(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating9),.result(beingEating9_3),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef3_10	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating10),.result(beingEating10_3),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef3_11	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating11),.result(beingEating11_3),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef3_12	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating12),.result(beingEating12_3),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef3_13	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating13),.result(beingEating13_3),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef3_14	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating14),.result(beingEating14_3),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef3_15	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating15),.result(beingEating15_3),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef3_16	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating16),.result(beingEating16_3),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef3_17	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating17),.result(beingEating17_3),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef3_18	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating18),.result(beingEating18_3),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef3_19	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating19),.result(beingEating19_3),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef3_20	(.*,			.stopX(stop3),					.ZomCentralX(ZomCentralX3),.ZomCentralY(ZomCentralY3),
												 .eat(eat3),.beingEating(beingEating20),.result(beingEating20_3),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb4		(.*,			.Generate(Generate4),		.beingAttack(attack4),		.ZomLive(ZomLive4));
	zomMotion					zomMove4	(.*, 			.frame_clk(VGA_VS), 			.END(END4), 					.startY(startY1),
												 .stopX(stop4),								.eat(eat4),						.ZomLive(ZomLive4),
												 .ZomCentralX(ZomCentralX4),				.ZomCentralY(ZomCentralY4));
	Zom_calculator				zc4		(.*, 			.ZomX(ZomCentralX4),			.ZomY(ZomCentralY4),			.ZomLive(ZomLive4),
												 .address(zomaddress4),						.zom_on(zom_on4));
	matcher1						mc4		(.*,			.BallX(ZomCentralX4),		.BallY(ZomCentralY4),		.stopX(stop4));
	eatFinder					ef4_1		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating1),.result(beingEating1_4),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef4_2		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating2),.result(beingEating2_4),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef4_3		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating3),.result(beingEating3_4),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef4_4		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating4),.result(beingEating4_4),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef4_5		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating5),.result(beingEating5_4),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef4_6		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating6),.result(beingEating6_4),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef4_7		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating7),.result(beingEating7_4),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef4_8		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating8),.result(beingEating8_4),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef4_9		(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating9),.result(beingEating9_4),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef4_10	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating10),.result(beingEating10_4),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef4_11	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating11),.result(beingEating11_4),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef4_12	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating12),.result(beingEating12_4),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef4_13	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating13),.result(beingEating13_4),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef4_14	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating14),.result(beingEating14_4),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef4_15	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating15),.result(beingEating15_4),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef4_16	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating16),.result(beingEating16_4),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef4_17	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating17),.result(beingEating17_4),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef4_18	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating18),.result(beingEating18_4),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef4_19	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating19),.result(beingEating19_4),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef4_20	(.*,			.stopX(stop4),					.ZomCentralX(ZomCentralX4),.ZomCentralY(ZomCentralY4),
												 .eat(eat4),.beingEating(beingEating20),.result(beingEating20_4),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb5		(.*,			.Generate(Generate5),		.beingAttack(attack5),		.ZomLive(ZomLive5));
	zomMotion					zomMove5	(.*, 			.frame_clk(VGA_VS), 			.END(END5), 					.startY(startY3),
												 .stopX(stop5),								.eat(eat5),						.ZomLive(ZomLive5),
												 .ZomCentralX(ZomCentralX5),				.ZomCentralY(ZomCentralY5));
	Zom_calculator				zc5		(.*, 			.ZomX(ZomCentralX5),			.ZomY(ZomCentralY5),			.ZomLive(ZomLive5),
												 .address(zomaddress5),						.zom_on(zom_on5));
	matcher1						mc5		(.*,			.BallX(ZomCentralX5),		.BallY(ZomCentralY5),		.stopX(stop5));
	eatFinder					ef5_1		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating1),.result(beingEating1_5),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef5_2		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating2),.result(beingEating2_5),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef5_3		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating3),.result(beingEating3_5),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef5_4		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating4),.result(beingEating4_5),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef5_5		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating5),.result(beingEating5_5),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef5_6		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating6),.result(beingEating6_5),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef5_7		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating7),.result(beingEating7_5),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef5_8		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating8),.result(beingEating8_5),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef5_9		(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating9),.result(beingEating9_5),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef5_10	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating10),.result(beingEating10_5),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef5_11	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating11),.result(beingEating11_5),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef5_12	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating12),.result(beingEating12_5),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef5_13	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating13),.result(beingEating13_5),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef5_14	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating14),.result(beingEating14_5),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef5_15	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating15),.result(beingEating15_5),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef5_16	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating16),.result(beingEating16_5),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef5_17	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating17),.result(beingEating17_5),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef5_18	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating18),.result(beingEating18_5),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef5_19	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating19),.result(beingEating19_5),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef5_20	(.*,			.stopX(stop5),					.ZomCentralX(ZomCentralX5),.ZomCentralY(ZomCentralY5),
												 .eat(eat5),.beingEating(beingEating20),.result(beingEating20_5),
												 .plantX(plant20X),							.plantY(plant20Y));
											 
	zombie						zomb6		(.*,			.Generate(Generate6),		.beingAttack(attack6),		.ZomLive(ZomLive6));
	zomMotion					zomMove6	(.*, 			.frame_clk(VGA_VS), 			.END(END6), 					.startY(startY5),
												 .stopX(stop6),								.eat(eat6),						.ZomLive(ZomLive6),
												 .ZomCentralX(ZomCentralX6),				.ZomCentralY(ZomCentralY6));
	Zom_calculator				zc6		(.*, 			.ZomX(ZomCentralX6),			.ZomY(ZomCentralY6),			.ZomLive(ZomLive6),
												 .address(zomaddress6),						.zom_on(zom_on6));
	matcher1						mc6		(.*,			.BallX(ZomCentralX6),		.BallY(ZomCentralY6),		.stopX(stop6));
	eatFinder					ef6_1		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating1),.result(beingEating1_6),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef6_2		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating2),.result(beingEating2_6),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef6_3		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating3),.result(beingEating3_6),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef6_4		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating4),.result(beingEating4_6),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef6_5		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating5),.result(beingEating5_6),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef6_6		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating6),.result(beingEating6_6),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef6_7		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating7),.result(beingEating7_6),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef6_8		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating8),.result(beingEating8_6),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef6_9		(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating9),.result(beingEating9_6),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef6_10	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating10),.result(beingEating10_6),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef6_11	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating11),.result(beingEating11_6),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef6_12	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating12),.result(beingEating12_6),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef6_13	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating13),.result(beingEating13_6),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef6_14	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating14),.result(beingEating14_6),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef6_15	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating15),.result(beingEating15_6),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef6_16	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating16),.result(beingEating16_6),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef6_17	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating17),.result(beingEating17_6),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef6_18	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating18),.result(beingEating18_6),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef6_19	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating19),.result(beingEating19_6),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef6_20	(.*,			.stopX(stop6),					.ZomCentralX(ZomCentralX6),.ZomCentralY(ZomCentralY6),
												 .eat(eat6),.beingEating(beingEating20),.result(beingEating20_6),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb7		(.*,			.Generate(Generate7),		.beingAttack(attack7),		.ZomLive(ZomLive7));
	zomMotion					zomMove7	(.*, 			.frame_clk(VGA_VS), 			.END(END7), 					.startY(startY2),
												 .stopX(stop7),								.eat(eat7),						.ZomLive(ZomLive7),
												 .ZomCentralX(ZomCentralX7),				.ZomCentralY(ZomCentralY7));
	Zom_calculator				zc7		(.*, 			.ZomX(ZomCentralX7),			.ZomY(ZomCentralY7),			.ZomLive(ZomLive7),
												 .address(zomaddress7),						.zom_on(zom_on7));
	matcher1						mc7		(.*,			.BallX(ZomCentralX7),		.BallY(ZomCentralY7),		.stopX(stop7));
	eatFinder					ef7_1		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating1),.result(beingEating1_7),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef7_2		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating2),.result(beingEating2_7),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef7_3		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating3),.result(beingEating3_7),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef7_4		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating4),.result(beingEating4_7),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef7_5		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating5),.result(beingEating5_7),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef7_6		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating6),.result(beingEating6_7),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef7_7		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating7),.result(beingEating7_7),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef7_8		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating8),.result(beingEating8_7),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef7_9		(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating9),.result(beingEating9_7),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef7_10	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating10),.result(beingEating10_7),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef7_11	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating11),.result(beingEating11_7),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef7_12	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating12),.result(beingEating12_7),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef7_13	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating13),.result(beingEating13_7),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef7_14	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating14),.result(beingEating14_7),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef7_15	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating15),.result(beingEating15_7),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef7_16	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating16),.result(beingEating16_7),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef7_17	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating17),.result(beingEating17_7),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef7_18	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating18),.result(beingEating18_7),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef7_19	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating19),.result(beingEating19_7),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef7_20	(.*,			.stopX(stop7),					.ZomCentralX(ZomCentralX7),.ZomCentralY(ZomCentralY7),
												 .eat(eat7),.beingEating(beingEating20),.result(beingEating20_7),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb8		(.*,			.Generate(Generate8),		.beingAttack(attack8),		.ZomLive(ZomLive8));
	zomMotion					zomMove8	(.*, 			.frame_clk(VGA_VS), 			.END(END8), 					.startY(startY4),
												 .stopX(stop8),								.eat(eat8),						.ZomLive(ZomLive8),
												 .ZomCentralX(ZomCentralX8),				.ZomCentralY(ZomCentralY8));
	Zom_calculator				zc8		(.*, 			.ZomX(ZomCentralX1),			.ZomY(ZomCentralY8),			.ZomLive(ZomLive8),
												 .address(zomaddress8),						.zom_on(zom_on8));
	matcher1						mc8		(.*,			.BallX(ZomCentralX8),		.BallY(ZomCentralY8),		.stopX(stop8));
	eatFinder					ef8_1		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating1),.result(beingEating1_8),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef8_2		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating2),.result(beingEating2_8),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef8_3		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating3),.result(beingEating3_8),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef8_4		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating4),.result(beingEating4_8),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef8_5		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating5),.result(beingEating5_8),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef8_6		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating6),.result(beingEating6_8),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef8_7		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating7),.result(beingEating7_8),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef8_8		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating8),.result(beingEating8_8),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef8_9		(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating9),.result(beingEating9_8),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef8_10	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating10),.result(beingEating10_8),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef8_11	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating11),.result(beingEating11_8),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef8_12	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating12),.result(beingEating12_8),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef8_13	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating13),.result(beingEating13_8),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef8_14	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating14),.result(beingEating14_8),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef8_15	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating15),.result(beingEating15_8),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef8_16	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating16),.result(beingEating16_8),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef8_17	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating17),.result(beingEating17_8),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef8_18	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating18),.result(beingEating18_8),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef8_19	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating19),.result(beingEating19_8),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef8_20	(.*,			.stopX(stop8),					.ZomCentralX(ZomCentralX8),.ZomCentralY(ZomCentralY8),
												 .eat(eat8),.beingEating(beingEating20),.result(beingEating20_8),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb9		(.*,			.Generate(Generate9),		.beingAttack(attack9),		.ZomLive(ZomLive9));
	zomMotion					zomMove9	(.*, 			.frame_clk(VGA_VS), 			.END(END9), 					.startY(startY2),
												 .stopX(stop9),								.eat(eat9),						.ZomLive(ZomLive9),
												 .ZomCentralX(ZomCentralX9),				.ZomCentralY(ZomCentralY9));
	Zom_calculator				zc9		(.*, 			.ZomX(ZomCentralX9),			.ZomY(ZomCentralY9),			.ZomLive(ZomLive9),
												 .address(zomaddress9),						.zom_on(zom_on9));
	matcher1						mc9		(.*,			.BallX(ZomCentralX9),		.BallY(ZomCentralY9),		.stopX(stop9));
	eatFinder					ef9_1		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating1),.result(beingEating1_9),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef9_2		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating2),.result(beingEating2_9),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef9_3		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating3),.result(beingEating3_9),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef9_4		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating4),.result(beingEating4_9),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef9_5		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating5),.result(beingEating5_9),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef9_6		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating6),.result(beingEating6_9),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef9_7		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating7),.result(beingEating7_9),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef9_8		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating8),.result(beingEating8_9),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef9_9		(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating9),.result(beingEating9_9),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef9_10	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating10),.result(beingEating10_9),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef9_11	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating11),.result(beingEating11_9),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef9_12	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating12),.result(beingEating12_9),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef9_13	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating13),.result(beingEating13_9),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef9_14	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating14),.result(beingEating14_9),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef9_15	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating15),.result(beingEating15_9),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef9_16	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating16),.result(beingEating16_9),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef9_17	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating17),.result(beingEating17_9),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef9_18	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating18),.result(beingEating18_9),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef9_19	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating19),.result(beingEating19_9),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef9_20	(.*,			.stopX(stop9),					.ZomCentralX(ZomCentralX9),.ZomCentralY(ZomCentralY9),
												 .eat(eat9),.beingEating(beingEating20),.result(beingEating20_9),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zombie						zomb10	(.*,			.Generate(Generate10),		.beingAttack(attack10),		.ZomLive(ZomLive10));
	zomMotion					zomMove10(.*, 			.frame_clk(VGA_VS), 			.END(END10), 					.startY(startY1),
												 .stopX(stop10),								.eat(eat10),					.ZomLive(ZomLive10),
												 .ZomCentralX(ZomCentralX10),				.ZomCentralY(ZomCentralY10));
	Zom_calculator				zc10		(.*, 			.ZomX(ZomCentralX10),		.ZomY(ZomCentralY10),		.ZomLive(ZomLive10),
												 .address(zomaddress10),					.zom_on(zom_on10));
	matcher1						mc10		(.*,			.BallX(ZomCentralX10),		.BallY(ZomCentralY10),		.stopX(stop10));
	eatFinder					ef10_1	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating1),.result(beingEating1_10),
												 .plantX(plant1X),							.plantY(plant1Y));
	eatFinder					ef10_2	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating2),.result(beingEating2_10),
												 .plantX(plant2X),							.plantY(plant2Y));
	eatFinder					ef10_3	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating3),.result(beingEating3_10),
												 .plantX(plant3X),							.plantY(plant3Y));
	eatFinder					ef10_4	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating4),.result(beingEating4_10),
												 .plantX(plant4X),							.plantY(plant4Y));
	eatFinder					ef10_5	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating5),.result(beingEating5_10),
												 .plantX(plant5X),							.plantY(plant5Y));
	eatFinder					ef10_6	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating6),.result(beingEating6_10),
												 .plantX(plant6X),							.plantY(plant6Y));
	eatFinder					ef10_7	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating7),.result(beingEating7_10),
												 .plantX(plant7X),							.plantY(plant7Y));
	eatFinder					ef10_8	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating8),.result(beingEating8_10),
												 .plantX(plant8X),							.plantY(plant8Y));
	eatFinder					ef10_9	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating9),.result(beingEating9_10),
												 .plantX(plant9X),							.plantY(plant9Y));
	eatFinder					ef10_10	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating10),.result(beingEating10_10),
												 .plantX(plant10X),							.plantY(plant10Y));
	eatFinder					ef10_11	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating11),.result(beingEating11_10),
												 .plantX(plant11X),							.plantY(plant11Y));
	eatFinder					ef10_12	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating12),.result(beingEating12_10),
												 .plantX(plant12X),							.plantY(plant12Y));
	eatFinder					ef10_13	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating13),.result(beingEating13_10),
												 .plantX(plant13X),							.plantY(plant13Y));
	eatFinder					ef10_14	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating14),.result(beingEating14_10),
												 .plantX(plant14X),							.plantY(plant14Y));
	eatFinder					ef10_15	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating15),.result(beingEating15_10),
												 .plantX(plant15X),							.plantY(plant15Y));
	eatFinder					ef10_16	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating16),.result(beingEating16_10),
												 .plantX(plant16X),							.plantY(plant16Y));
	eatFinder					ef10_17	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating17),.result(beingEating17_10),
												 .plantX(plant17X),							.plantY(plant17Y));
	eatFinder					ef10_18	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating18),.result(beingEating18_10),
												 .plantX(plant18X),							.plantY(plant18Y));
	eatFinder					ef10_19	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating19),.result(beingEating19_10),
												 .plantX(plant19X),							.plantY(plant19Y));
	eatFinder					ef10_20	(.*,			.stopX(stop10),					.ZomCentralX(ZomCentralX10),.ZomCentralY(ZomCentralY10),
												 .eat(eat10),.beingEating(beingEating20),.result(beingEating20_10),
												 .plantX(plant20X),							.plantY(plant20Y));
												 
	zomStopCalculator			zomstopc	(.*);	
	eatAssembler				eatasm1	(.beingEating1(beingEating1_1),	.beingEating2(beingEating1_2),	.beingEating3(beingEating1_3),	.beingEating4(beingEating1_4),
												 .beingEating5(beingEating1_5),	.beingEating6(beingEating1_6),	.beingEating7(beingEating1_7),	.beingEating8(beingEating1_8),
												 .beingEating9(beingEating1_9),	.beingEating10(beingEating1_10),	.beingEating(beingEating1));
												 
	eatAssembler				eatasm2	(.beingEating1(beingEating2_1),	.beingEating2(beingEating2_2),	.beingEating3(beingEating2_3),	.beingEating4(beingEating2_4),
												 .beingEating5(beingEating2_5),	.beingEating6(beingEating2_6),	.beingEating7(beingEating2_7),	.beingEating8(beingEating2_8),
												 .beingEating9(beingEating2_9),	.beingEating10(beingEating2_10),	.beingEating(beingEating2));
												 
	eatAssembler				eatasm3	(.beingEating1(beingEating3_1),	.beingEating2(beingEating3_2),	.beingEating3(beingEating3_3),	.beingEating4(beingEating3_4),
												 .beingEating5(beingEating3_5),	.beingEating6(beingEating3_6),	.beingEating7(beingEating3_7),	.beingEating8(beingEating3_8),
												 .beingEating9(beingEating3_9),	.beingEating10(beingEating3_10),	.beingEating(beingEating3));
												 
	eatAssembler				eatasm4	(.beingEating1(beingEating4_1),	.beingEating2(beingEating4_2),	.beingEating3(beingEating4_3),	.beingEating4(beingEating4_4),
												 .beingEating5(beingEating4_5),	.beingEating6(beingEating4_6),	.beingEating7(beingEating4_7),	.beingEating8(beingEating4_8),
												 .beingEating9(beingEating4_9),	.beingEating10(beingEatinG4_10),	.beingEating(beingEating4));
												 
	eatAssembler				eatasm5	(.beingEating1(beingEating5_1),	.beingEating2(beingEating5_2),	.beingEating3(beingEating5_3),	.beingEating4(beingEating5_4),
												 .beingEating5(beingEating5_5),	.beingEating6(beingEating5_6),	.beingEating7(beingEating5_7),	.beingEating8(beingEating5_8),
												 .beingEating9(beingEating5_9),	.beingEating10(beingEating5_10),	.beingEating(beingEating5));
												 
	eatAssembler				eatasm6	(.beingEating1(beingEating6_1),	.beingEating2(beingEating6_2),	.beingEating3(beingEating6_3),	.beingEating4(beingEating6_4),
												 .beingEating5(beingEating6_5),	.beingEating6(beingEating6_6),	.beingEating7(beingEating6_7),	.beingEating8(beingEating6_8),
												 .beingEating9(beingEating6_9),	.beingEating10(beingEating6_10),	.beingEating(beingEating6));
												 
	eatAssembler				eatasm7	(.beingEating1(beingEating7_1),	.beingEating2(beingEating7_2),	.beingEating3(beingEating7_3),	.beingEating4(beingEating7_4),
												 .beingEating5(beingEating7_5),	.beingEating6(beingEating7_6),	.beingEating7(beingEating7_7),	.beingEating8(beingEating7_8),
												 .beingEating9(beingEating7_9),	.beingEating10(beingEating7_10),	.beingEating(beingEating7));
												 
	eatAssembler				eatasm8	(.beingEating1(beingEating8_1),	.beingEating2(beingEating8_2),	.beingEating3(beingEating8_3),	.beingEating4(beingEating8_4),
												 .beingEating5(beingEating8_5),	.beingEating6(beingEating8_6),	.beingEating7(beingEating8_7),	.beingEating8(beingEating8_8),
												 .beingEating9(beingEating8_9),	.beingEating10(beingEating8_10),	.beingEating(beingEating8));
												 
	eatAssembler				eatasm9	(.beingEating1(beingEating9_1),	.beingEating2(beingEating9_2),	.beingEating3(beingEating9_3),	.beingEating4(beingEating9_4),
												 .beingEating5(beingEating9_5),	.beingEating6(beingEating9_6),	.beingEating7(beingEating9_7),	.beingEating8(beingEating9_8),
												 .beingEating9(beingEating9_9),	.beingEating10(beingEating9_10),	.beingEating(beingEating9));
												 
	eatAssembler				eatasm10	(.beingEating1(beingEating10_1),	.beingEating2(beingEating10_2),	.beingEating3(beingEating10_3),	.beingEating4(beingEating10_4),
												 .beingEating5(beingEating10_5),	.beingEating6(beingEating10_6),	.beingEating7(beingEating10_7),	.beingEating8(beingEating10_8),
												 .beingEating9(beingEating10_9),	.beingEating10(beingEating10_10),	.beingEating(beingEating10));
												 
	eatAssembler				eatasm11	(.beingEating1(beingEating11_1),	.beingEating2(beingEating11_2),	.beingEating3(beingEating11_3),	.beingEating4(beingEating11_4),
												 .beingEating5(beingEating11_5),	.beingEating6(beingEating11_6),	.beingEating7(beingEating11_7),	.beingEating8(beingEating11_8),
												 .beingEating9(beingEating11_9),	.beingEating10(beingEating11_10),	.beingEating(beingEating11));
												 
	eatAssembler				eatasm12	(.beingEating1(beingEating12_1),	.beingEating2(beingEating12_2),	.beingEating3(beingEating12_3),	.beingEating4(beingEating12_4),
												 .beingEating5(beingEating12_5),	.beingEating6(beingEating12_6),	.beingEating7(beingEating12_7),	.beingEating8(beingEating12_8),
												 .beingEating9(beingEating12_9),	.beingEating10(beingEating12_10),	.beingEating(beingEating12));
												 
	eatAssembler				eatasm13	(.beingEating1(beingEating13_1),	.beingEating2(beingEating13_2),	.beingEating3(beingEating13_3),	.beingEating4(beingEating13_4),
												 .beingEating5(beingEating13_5),	.beingEating6(beingEating13_6),	.beingEating7(beingEating13_7),	.beingEating8(beingEating13_8),
												 .beingEating9(beingEating13_9),	.beingEating10(beingEating13_10),	.beingEating(beingEating13));
												 
	eatAssembler				eatasm14	(.beingEating1(beingEating14_1),	.beingEating2(beingEating14_2),	.beingEating3(beingEating14_3),	.beingEating4(beingEating14_4),
												 .beingEating5(beingEating14_5),	.beingEating6(beingEating14_6),	.beingEating7(beingEating14_7),	.beingEating8(beingEating14_8),
												 .beingEating9(beingEating14_9),	.beingEating10(beingEating14_10),	.beingEating(beingEating14));
												 
	eatAssembler				eatasm15	(.beingEating1(beingEating15_1),	.beingEating2(beingEating15_2),	.beingEating3(beingEating15_3),	.beingEating4(beingEating15_4),
												 .beingEating5(beingEating15_5),	.beingEating6(beingEating15_6),	.beingEating7(beingEating15_7),	.beingEating8(beingEating15_8),
												 .beingEating9(beingEating15_9),	.beingEating10(beingEating15_10),	.beingEating(beingEating15));
												 
	eatAssembler				eatasm16	(.beingEating1(beingEating16_1),	.beingEating2(beingEating16_2),	.beingEating3(beingEating16_3),	.beingEating4(beingEating16_4),
												 .beingEating5(beingEating16_5),	.beingEating6(beingEating16_6),	.beingEating7(beingEating16_7),	.beingEating8(beingEating16_8),
												 .beingEating9(beingEating16_9),	.beingEating10(beingEating16_10),	.beingEating(beingEating16));
												 
	eatAssembler				eatasm17	(.beingEating1(beingEating17_1),	.beingEating2(beingEating17_2),	.beingEating3(beingEating17_3),	.beingEating4(beingEating17_4),
												 .beingEating5(beingEating17_5),	.beingEating6(beingEating17_6),	.beingEating7(beingEating17_7),	.beingEating8(beingEating17_8),
												 .beingEating9(beingEating17_9),	.beingEating10(beingEating17_10),	.beingEating(beingEating17));
												 
	eatAssembler				eatasm18	(.beingEating1(beingEating18_1),	.beingEating2(beingEating18_2),	.beingEating3(beingEating18_3),	.beingEating4(beingEating18_4),
												 .beingEating5(beingEating18_5),	.beingEating6(beingEating18_6),	.beingEating7(beingEating18_7),	.beingEating8(beingEating18_8),
												 .beingEating9(beingEating18_9),	.beingEating10(beingEating18_10),	.beingEating(beingEating18));
												 
	eatAssembler				eatasm19	(.beingEating1(beingEating19_1),	.beingEating2(beingEating19_2),	.beingEating3(beingEating19_3),	.beingEating4(beingEating19_4),
												 .beingEating5(beingEating19_5),	.beingEating6(beingEating19_6),	.beingEating7(beingEating19_7),	.beingEating8(beingEating19_8),
												 .beingEating9(beingEating19_9),	.beingEating10(beingEating19_10),	.beingEating(beingEating19));
												 
	eatAssembler				eatasm20	(.beingEating1(beingEating20_1),	.beingEating2(beingEating20_2),	.beingEating3(beingEating20_3),	.beingEating4(beingEating20_4),
												 .beingEating5(beingEating20_5),	.beingEating6(beingEating20_6),	.beingEating7(beingEating20_7),	.beingEating8(beingEating20_8),
												 .beingEating9(beingEating20_9),	.beingEating10(beingEating20_10),	.beingEating(beingEating20));
												 
												 
	ENDAssigner					ea(.END1(END1), .END2(END1), .END3(END1), .END4(END1), .END5(END1),
										.END6(END1), .END7(END1), .END8(END1), .END9(END1), .END10(END1), .END(END), .CLK(MAX10_CLK1_50));
	ENDROM						endrom(.*);
	ENDMapper					endm(.*);
	END_calculator				endc(.*, .frame_clk(MAX10_CLK1_50));
						
endmodule 