module plant_top(	input		logic				MAX10_CLK1_50,	Reset_h, 		VGA_VS,			Plant,
						input		logic	[9:0]		curX, curY,
						input		logic	[9:0]		ZomCentralX1,	ZomCentralX2,	ZomCentralX3,	ZomCentralX4,	ZomCentralX5,
														ZomCentralX6,	ZomCentralX7,	ZomCentralX8,	ZomCentralX9,	ZomCentralX10,
														ZomCentralY1,	ZomCentralY2,	ZomCentralY3,	ZomCentralY4,	ZomCentralY5,
														ZomCentralY6,	ZomCentralY7,	ZomCentralY8,	ZomCentralY9,	ZomCentralY10, DrawX, DrawY,
						input		logic				beingEating1, 	beingEating2, 	beingEating3, 	beingEating4, 	beingEating5,
														beingEating6, 	beingEating7, 	beingEating8, 	beingEating9, 	beingEating10,
														beingEating11, beingEating12, beingEating13, beingEating14, beingEating15,
														beingEating16,	beingEating17,	beingEating18,	beingEating19,	beingEating20,
						input		logic				ZomLive1,		ZomLive2,		ZomLive3,		ZomLive4,		ZomLive5,
														ZomLive6,		ZomLive7,		ZomLive8,		ZomLive9,		ZomLive10,
						output	logic				attack1,			attack2,			attack3,			attack4,			attack5,
														attack6,			attack7,			attack8,			attack9,			attack10,//hit1,
														//output logic plant_on1,
						output	logic	[23:0]	RGB_plant, 		RGB_pea,
						output	logic				plant_on,		pea_on,
						output	logic	[9:0]		plant1X, 		plant1Y,			plant2X, 		plant2Y,
														plant3X, 		plant3Y,			plant4X, 		plant4Y,
														plant5X, 		plant5Y,			plant6X, 		plant6Y,
														plant7X, 		plant7Y,			plant8X, 		plant8Y,
														plant9X, 		plant9Y,			plant10X, 		plant10Y,
														plant11X, 		plant11Y,		plant12X, 		plant12Y,
														plant13X, 		plant13Y,		plant14X, 		plant14Y,
														plant15X, 		plant15Y,		plant16X, 		plant16Y,
														plant17X, 		plant17Y,		plant18X, 		plant18Y,
														plant19X, 		plant19Y,		plant20X, 		plant20Y,//, stopX1, stopX2, Ball1X, Ball1Y
						output	logic				PlantLive1, 	PlantLive2, 	PlantLive3, 	PlantLive4, 	PlantLive5,
														PlantLive6, 	PlantLive7, 	PlantLive8, 	PlantLive9, 	PlantLive10,
														PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
														PlantLive16,	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20
						);
//|========================================================================================|
//|								Plant releated variables declaration					 			    |
//|========================================================================================|
//	logic				PlantLive1, 	PlantLive2, 	PlantLive3, 	PlantLive4, 	PlantLive5,
//						PlantLive6, 	PlantLive7, 	PlantLive8, 	PlantLive9, 	PlantLive10,
//						PlantLive11, 	PlantLive12, 	PlantLive13, 	PlantLive14, 	PlantLive15,
//						PlantLive16,	PlantLive17,	PlantLive18,	PlantLive19,	PlantLive20;
						
	logic				plant_on1, 		plant_on2, 		plant_on3, 		plant_on4, 		plant_on5,
						plant_on6, 		plant_on7, 		plant_on8, 		plant_on9, 		plant_on10,
						plant_on11, 	plant_on12, 	plant_on13, 	plant_on14, 	plant_on15,
						plant_on16,		plant_on17,		plant_on18,		plant_on19,		plant_on20;
						
	logic				plant1,			plant2, 			plant3, 			plant4, 			plant5,
						plant6, 			plant7, 			plant8, 			plant9, 			plant10,
						plant11, 		plant12, 		plant13, 		plant14, 		plant15,
						plant16, 		plant17, 		plant18, 		plant19, 		plant20;

	logic	[9:0]		Ball1X,			Ball1Y,			
						Ball2X,			Ball2Y,
						Ball3X,			Ball3Y,			Ball4X,			Ball4Y,
						Ball5X,			Ball5Y,			Ball6X,			Ball6Y,
						Ball7X,			Ball7Y,			Ball8X,			Ball8Y,
						Ball9X,			Ball9Y,			Ball10X,			Ball10Y,
						Ball11X,			Ball11Y,			Ball12X,			Ball12Y,
						Ball13X,			Ball13Y,			Ball14X,			Ball14Y,
						Ball15X,			Ball15Y,			Ball16X,			Ball16Y,
						Ball17X,			Ball17Y,			Ball18X,			Ball18Y,
						Ball19X,			Ball19Y,			Ball20X,			Ball20Y,
						stop1,			stop2,			stop3,			stop4,			stop5,
						stop6,			stop7,			stop8,			stop9,			stop10,
						stop11,			stop12,			stop13,			stop14,			stop15,
						stop16,			stop17,			stop18,			stop19,			stop20,
						stopX1,								stopX2,			
						stopX3,								stopX4,			
						stopX5;
						
	logic				pea_on1, 		pea_on2, 		pea_on3, 		pea_on4, 		pea_on5,
						pea_on6, 		pea_on7, 		pea_on8, 		pea_on9, 		pea_on10,
						pea_on11, 		pea_on12, 		pea_on13, 		pea_on14, 		pea_on15,
						pea_on16,		pea_on17,		pea_on18,		pea_on19,		pea_on20;
	
	logic				hit1,				hit2, 			hit3, 			hit4, 			hit5,
						hit6, 			hit7, 			hit8, 			hit9, 			hit10,
						hit11, 			hit12, 			hit13, 			hit14, 			hit15,
						hit16,			hit17,			hit18,			hit19,			hit20;
						
	logic				attack1_1,		attack1_2,		attack1_3,		attack1_4,		attack1_5,
						attack1_6,		attack1_7,		attack1_8,		attack1_9,		attack1_10,
						attack1_11,		attack1_12,		attack1_13,		attack1_14,		attack1_15,
						attack1_16,		attack1_17,		attack1_18,		attack1_19,		attack1_20,
						
						attack2_1,		attack2_2,		attack2_3,		attack2_4,		attack2_5,
						attack2_6,		attack2_7,		attack2_8,		attack2_9,		attack2_10,
						attack2_11,		attack2_12,		attack2_13,		attack2_14,		attack2_15,
						attack2_16,		attack2_17,		attack2_18,		attack2_19,		attack2_20,
						
						attack3_1,		attack3_2,		attack3_3,		attack3_4,		attack3_5,
						attack3_6,		attack3_7,		attack3_8,		attack3_9,		attack3_10,
						attack3_11,		attack3_12,		attack3_13,		attack3_14,		attack3_15,
						attack3_16,		attack3_17,		attack3_18,		attack3_19,		attack3_20,
						
						attack4_1,		attack4_2,		attack4_3,		attack4_4,		attack4_5,
						attack4_6,		attack4_7,		attack4_8,		attack4_9,		attack4_10,
						attack4_11,		attack4_12,		attack4_13,		attack4_14,		attack4_15,
						attack4_16,		attack4_17,		attack4_18,		attack4_19,		attack4_20,
						
						attack5_1,		attack5_2,		attack5_3,		attack5_4,		attack5_5,
						attack5_6,		attack5_7,		attack5_8,		attack5_9,		attack5_10,
						attack5_11,		attack5_12,		attack5_13,		attack5_14,		attack5_15,
						attack5_16,		attack5_17,		attack5_18,		attack5_19,		attack5_20,
						
						attack6_1,		attack6_2,		attack6_3,		attack6_4,		attack6_5,
						attack6_6,		attack6_7,		attack6_8,		attack6_9,		attack6_10,
						attack6_11,		attack6_12,		attack6_13,		attack6_14,		attack6_15,
						attack6_16,		attack6_17,		attack6_18,		attack6_19,		attack6_20,
						
						attack7_1,		attack7_2,		attack7_3,		attack7_4,		attack7_5,
						attack7_6,		attack7_7,		attack7_8,		attack7_9,		attack7_10,
						attack7_11,		attack7_12,		attack7_13,		attack7_14,		attack7_15,
						attack7_16,		attack7_17,		attack7_18,		attack7_19,		attack7_20,
						
						attack8_1,		attack8_2,		attack8_3,		attack8_4,		attack8_5,
						attack8_6,		attack8_7,		attack8_8,		attack8_9,		attack8_10,
						attack8_11,		attack8_12,		attack8_13,		attack8_14,		attack8_15,
						attack8_16,		attack8_17,		attack8_18,		attack8_19,		attack8_20,
						
						attack9_1,		attack9_2,		attack9_3,		attack9_4,		attack9_5,
						attack9_6,		attack9_7,		attack9_8,		attack9_9,		attack9_10,
						attack9_11,		attack9_12,		attack9_13,		attack9_14,		attack9_15,
						attack9_16,		attack9_17,		attack9_18,		attack9_19,		attack9_20,
						
						attack10_1,		attack10_2,		attack10_3,		attack10_4,		attack10_5,
						attack10_6,		attack10_7,		attack10_8,		attack10_9,		attack10_10,
						attack10_11,	attack10_12,	attack10_13,	attack10_14,	attack10_15,
						attack10_16,	attack10_17,	attack10_18,	attack10_19,	attack10_20;
						
	
	logic	[18:0]	addressplt1,	addressplt2,	addressplt3,	addressplt4,	addressplt5,
						addressplt6,	addressplt7,	addressplt8,	addressplt9,	addressplt10,
						addressplt11,	addressplt12,	addressplt13,	addressplt14,	addressplt15,
						addressplt16,	addressplt17,	addressplt18,	addressplt19,	addressplt20, read_address_plant;
	
	logic	[4:0]		curPlantIndex;
//|========================================================================================|
//|											End of Declaration												 |
//|========================================================================================|

	
	PlantROM						pltzom	(.*);
	PlantMapper					pltmap	(.*);
	plantAssigner				Pltassign(.*);
	plantAssembler				pltasb	(.*,							.address1(addressplt1),							.address2(addressplt2),
																				.address3(addressplt3),							.address4(addressplt4),
																				.address5(addressplt5),							.address6(addressplt6),
																				.address7(addressplt7),							.address8(addressplt8),
																				.address9(addressplt9),							.address10(addressplt10),
																				.address11(addressplt11),						.address12(addressplt12),
																				.address13(addressplt13),						.address14(addressplt14),
																				.address15(addressplt15),						.address16(addressplt16),
																				.address17(addressplt17),						.address18(addressplt18),
																				.address19(addressplt19),						.address20(addressplt20));
	peaAssembler				peaasb	(.*);
	
	plant 						plt1		(.*,							.Plant(plant1),	.posX(curX),				.posY(curY), 
												 .plantX(plant1X),		.plantY(plant1Y),	.PlantLive(PlantLive1), .beingEating(beingEating1));
	Plant_calculator			pltc1		(.*,							.plantX(plant1X),	.plantY(plant1Y),			.PlantLive(PlantLive1),
												 .address(addressplt1),	.plant_on(plant_on1));
	pea							pea1		(.frame_clk(VGA_VS), 	.startX(plant1X), .startY(plant1Y),			.PlantLive(PlantLive1),
												 .BallX(Ball1X),			.BallY(Ball1Y),	.stopX(stop1),				.hit(hit1));
	matcher1						match1	(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1));
	pea_calculator				pc1		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.PlantLive(PlantLive1),
												 .pea_on(pea_on1));
	attackFinder				af1_1		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit1),				.attack(attack1),	.result(attack1_1));
	attackFinder				af1_2		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit1),				.attack(attack2),	.result(attack2_1));
	attackFinder				af1_3		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit1),				.attack(attack3),	.result(attack3_1));
	attackFinder				af1_4		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit1),				.attack(attack4),	.result(attack4_1));
	attackFinder				af1_5		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit1),				.attack(attack5),	.result(attack5_1));
	attackFinder				af1_6		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit1),				.attack(attack6),	.result(attack6_1));
	attackFinder				af1_7		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit1),				.attack(attack7),	.result(attack7_1));
	attackFinder				af1_8		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit1),				.attack(attack8),	.result(attack8_1));
	attackFinder				af1_9		(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit1),				.attack(attack9),	.result(attack9_1));
	attackFinder				af1_10	(.*,							.BallX(Ball1X),	.BallY(Ball1Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit1),				.attack(attack10),.result(attack10_1));

	
	plant 						plt2		(.*,							.Plant(plant2),	.posX(curX),				.posY(curY), 
												 .plantX(plant2X),		.plantY(plant2Y),	.PlantLive(PlantLive2), .beingEating(beingEating2));
	Plant_calculator			pltc2		(.*,							.plantX(plant2X),	.plantY(plant2Y),			.PlantLive(PlantLive2),
												 .address(addressplt2),	.plant_on(plant_on2));
	pea							pea2		(.frame_clk(VGA_VS), 	.startX(plant2X), .startY(plant2Y),			.PlantLive(PlantLive2),
												 .BallX(Ball2X),			.BallY(Ball2Y),	.stopX(stop2),				.hit(hit2));
	matcher1						match2	(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2));
	pea_calculator				pc2		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.PlantLive(PlantLive2),
												 .pea_on(pea_on2));
	attackFinder				af2_1		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit2),				.attack(attack1),	.result(attack1_2));
	attackFinder				af2_2		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit2),				.attack(attack2),	.result(attack2_2));
	attackFinder				af2_3		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit2),				.attack(attack3),	.result(attack3_2));
	attackFinder				af2_4		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit2),				.attack(attack4),	.result(attack4_2));
	attackFinder				af2_5		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit2),				.attack(attack5),	.result(attack5_2));
	attackFinder				af2_6		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit2),				.attack(attack6),	.result(attack6_2));
	attackFinder				af2_7		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit2),				.attack(attack7),	.result(attack7_2));
	attackFinder				af2_8		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit2),				.attack(attack8),	.result(attack8_2));
	attackFinder				af2_9		(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit2),				.attack(attack9),	.result(attack9_2));
	attackFinder				af2_10	(.*,							.BallX(Ball2X),	.BallY(Ball2Y),			.stopX(stop2),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit2),				.attack(attack10),.result(attack10_2));
												 
	plant 						plt3		(.*,							.Plant(plant3),	.posX(curX),				.posY(curY), 
												 .plantX(plant3X),		.plantY(plant3Y),	.PlantLive(PlantLive3), .beingEating(beingEating3));
	Plant_calculator			pltc3		(.*,							.plantX(plant3X),	.plantY(plant3Y),			.PlantLive(PlantLive3),
												 .address(addressplt3),	.plant_on(plant_on3));
	pea							pea3		(.frame_clk(VGA_VS), 	.startX(plant3X), .startY(plant3Y),			.PlantLive(PlantLive3),
												 .BallX(Ball3X),			.BallY(Ball3Y),	.stopX(stop3),				.hit(hit3));
	matcher1						match3	(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3));
	pea_calculator				pc3		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.PlantLive(PlantLive3),
												 .pea_on(pea_on3));
	attackFinder				af3_1		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit3),				.attack(attack1),	.result(attack1_3));
	attackFinder				af3_2		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit3),				.attack(attack2),	.result(attack2_3));
	attackFinder				af3_3		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit3),				.attack(attack3),	.result(attack3_3));
	attackFinder				af3_4		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit3),				.attack(attack4),	.result(attack4_3));
	attackFinder				af3_5		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit3),				.attack(attack5),	.result(attack5_3));
	attackFinder				af3_6		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit3),				.attack(attack6),	.result(attack6_3));
	attackFinder				af3_7		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit3),				.attack(attack7),	.result(attack7_3));
	attackFinder				af3_8		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit3),				.attack(attack8),	.result(attack8_3));
	attackFinder				af3_9		(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit3),				.attack(attack9),	.result(attack9_3));
	attackFinder				af3_10	(.*,							.BallX(Ball3X),	.BallY(Ball3Y),			.stopX(stop3),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit3),				.attack(attack10),.result(attack10_3));
												 
	plant 						plt4		(.*,							.Plant(plant4),	.posX(curX),				.posY(curY), 
												 .plantX(plant4X),		.plantY(plant4Y),	.PlantLive(PlantLive4), .beingEating(beingEating4));
	Plant_calculator			pltc4		(.*,							.plantX(plant4X),	.plantY(plant4Y),			.PlantLive(PlantLive4),
												 .address(addressplt4),	.plant_on(plant_on4));
	pea							pea4		(.frame_clk(VGA_VS), 	.startX(plant4X), .startY(plant4Y),			.PlantLive(PlantLive4),
												 .BallX(Ball4X),			.BallY(Ball4Y),	.stopX(stop4),				.hit(hit4));
	matcher1						match4	(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4));
	pea_calculator				pc4		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.PlantLive(PlantLive4),
												 .pea_on(pea_on4));
	attackFinder				af4_1		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit4),				.attack(attack1),	.result(attack1_4));
	attackFinder				af4_2		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit4),				.attack(attack2),	.result(attack2_4));
	attackFinder				af4_3		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit4),				.attack(attack3),	.result(attack3_4));
	attackFinder				af4_4		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit4),				.attack(attack4),	.result(attack4_4));
	attackFinder				af4_5		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit4),				.attack(attack5),	.result(attack5_4));
	attackFinder				af4_6		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit4),				.attack(attack6),	.result(attack6_4));
	attackFinder				af4_7		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit4),				.attack(attack7),	.result(attack7_4));
	attackFinder				af4_8		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit4),				.attack(attack8),	.result(attack8_4));
	attackFinder				af4_9		(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit4),				.attack(attack9),	.result(attack9_4));
	attackFinder				af4_10	(.*,							.BallX(Ball4X),	.BallY(Ball4Y),			.stopX(stop4),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit4),				.attack(attack10),.result(attack10_4));
												 
	plant 						plt5		(.*,							.Plant(plant5),	.posX(curX),				.posY(curY), 
												 .plantX(plant5X),		.plantY(plant5Y),	.PlantLive(PlantLive5), .beingEating(beingEating5));
	Plant_calculator			pltc5		(.*,							.plantX(plant5X),	.plantY(plant5Y),			.PlantLive(PlantLive5),
												 .address(addressplt5),	.plant_on(plant_on5));
	pea							pea5		(.frame_clk(VGA_VS), 	.startX(plant5X), .startY(plant5Y),			.PlantLive(PlantLive5),
												 .BallX(Ball5X),			.BallY(Ball5Y),	.stopX(stop5),				.hit(hit5));
	matcher1						match5	(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5));
	pea_calculator				pc5		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.PlantLive(PlantLive5),
												 .pea_on(pea_on5));
	attackFinder				af5_1		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit5),				.attack(attack1),	.result(attack1_5));
	attackFinder				af5_2		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit5),				.attack(attack2),	.result(attack2_5));
	attackFinder				af5_3		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit5),				.attack(attack3),	.result(attack3_5));
	attackFinder				af5_4		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit5),				.attack(attack4),	.result(attack4_5));
	attackFinder				af5_5		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit5),				.attack(attack5),	.result(attack5_5));
	attackFinder				af5_6		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit5),				.attack(attack6),	.result(attack6_5));
	attackFinder				af5_7		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit5),				.attack(attack7),	.result(attack7_5));
	attackFinder				af5_8		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit5),				.attack(attack8),	.result(attack8_5));
	attackFinder				af5_9		(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit5),				.attack(attack9),	.result(attack9_5));
	attackFinder				af5_10	(.*,							.BallX(Ball5X),	.BallY(Ball5Y),			.stopX(stop5),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit5),				.attack(attack10),.result(attack10_5));
												 
	plant 						plt6		(.*,							.Plant(plant6),	.posX(curX),				.posY(curY), 
												 .plantX(plant6X),		.plantY(plant6Y),	.PlantLive(PlantLive6), .beingEating(beingEating6));
	Plant_calculator			pltc6		(.*,							.plantX(plant6X),	.plantY(plant6Y),			.PlantLive(PlantLive6),
												 .address(addressplt6),	.plant_on(plant_on6));
	pea							pea6		(.frame_clk(VGA_VS), 	.startX(plant6X), .startY(plant6Y),			.PlantLive(PlantLive6),
												 .BallX(Ball6X),			.BallY(Ball6Y),	.stopX(stop6),				.hit(hit6));
	matcher1						match6	(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6));
	pea_calculator				pc6		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.PlantLive(PlantLive6),
												 .pea_on(pea_on6));
	attackFinder				af6_1		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop1),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit6),				.attack(attack1),	.result(attack1_6));
	attackFinder				af6_2		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit6),				.attack(attack2),	.result(attack2_6));
	attackFinder				af6_3		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit6),				.attack(attack3),	.result(attack3_6));
	attackFinder				af6_4		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit6),				.attack(attack4),	.result(attack4_6));
	attackFinder				af6_5		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit6),				.attack(attack5),	.result(attack5_6));
	attackFinder				af6_6		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit6),				.attack(attack6),	.result(attack6_6));
	attackFinder				af6_7		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit6),				.attack(attack7),	.result(attack7_6));
	attackFinder				af6_8		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit6),				.attack(attack8),	.result(attack8_6));
	attackFinder				af6_9		(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit6),				.attack(attack9),	.result(attack9_6));
	attackFinder				af6_10	(.*,							.BallX(Ball6X),	.BallY(Ball6Y),			.stopX(stop6),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit6),				.attack(attack10),.result(attack10_6));
												 
	plant 						plt7		(.*,							.Plant(plant7),	.posX(curX),				.posY(curY), 
												 .plantX(plant7X),		.plantY(plant7Y),	.PlantLive(PlantLive7), .beingEating(beingEating7));
	Plant_calculator			pltc7		(.*,							.plantX(plant7X),	.plantY(plant7Y),			.PlantLive(PlantLive7),
												 .address(addressplt7),	.plant_on(plant_on7));
	pea							pea7		(.frame_clk(VGA_VS), 	.startX(plant7X), .startY(plant7Y),			.PlantLive(PlantLive7),
												 .BallX(Ball7X),			.BallY(Ball7Y),	.stopX(stop7),				.hit(hit7));
	matcher1						match7	(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7));
	pea_calculator				pc7		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.PlantLive(PlantLive7),
												 .pea_on(pea_on7));
	attackFinder				af7_1		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit7),				.attack(attack1),	.result(attack1_7));
	attackFinder				af7_2		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit7),				.attack(attack2),	.result(attack2_7));
	attackFinder				af7_3		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit7),				.attack(attack3),	.result(attack3_7));
	attackFinder				af7_4		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit7),				.attack(attack4),	.result(attack4_7));
	attackFinder				af7_5		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit7),				.attack(attack5),	.result(attack5_7));
	attackFinder				af7_6		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit7),				.attack(attack6),	.result(attack6_7));
	attackFinder				af7_7		(.*,							.BallX(Ball7X),		.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit7),				.attack(attack7),	.result(attack7_7));
	attackFinder				af7_8		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit7),				.attack(attack8),	.result(attack8_7));
	attackFinder				af7_9		(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit7),				.attack(attack9),	.result(attack9_7));
	attackFinder				af7_10	(.*,							.BallX(Ball7X),	.BallY(Ball7Y),			.stopX(stop7),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit7),				.attack(attack10),.result(attack10_7));
												 
	plant 						plt8		(.*,							.Plant(plant8),	.posX(curX),				.posY(curY), 
												 .plantX(plant8X),		.plantY(plant8Y),	.PlantLive(PlantLive8), .beingEating(beingEating8));
	Plant_calculator			pltc8		(.*,							.plantX(plant8X),	.plantY(plant8Y),			.PlantLive(PlantLive8),
												 .address(addressplt8),	.plant_on(plant_on8));
	pea							pea8		(.frame_clk(VGA_VS), 	.startX(plant8X), .startY(plant8Y),			.PlantLive(PlantLive8),
												 .BallX(Ball8X),			.BallY(Ball8Y),	.stopX(stop8),				.hit(hit8));
	matcher1						match8	(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8));
	pea_calculator				pc8		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.PlantLive(PlantLive8),
												 .pea_on(pea_on8));
	attackFinder				af8_1		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit8),				.attack(attack1),	.result(attack1_8));
	attackFinder				af8_2		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit8),				.attack(attack2),	.result(attack2_8));
	attackFinder				af8_3		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit8),				.attack(attack3),	.result(attack3_8));
	attackFinder				af8_4		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit8),				.attack(attack4),	.result(attack4_8));
	attackFinder				af8_5		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit8),				.attack(attack5),	.result(attack5_8));
	attackFinder				af8_6		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit8),				.attack(attack6),	.result(attack6_8));
	attackFinder				af8_7		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit8),				.attack(attack7),	.result(attack7_8));
	attackFinder				af8_8		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit8),				.attack(attack8),	.result(attack8_8));
	attackFinder				af8_9		(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit8),				.attack(attack9),	.result(attack9_8));
	attackFinder				af8_10	(.*,							.BallX(Ball8X),	.BallY(Ball8Y),			.stopX(stop8),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit8),				.attack(attack10),.result(attack10_8));
												 
	plant 						plt9		(.*,							.Plant(plant9),	.posX(curX),				.posY(curY), 
												 .plantX(plant9X),		.plantY(plant9Y),	.PlantLive(PlantLive9), .beingEating(beingEating9));
	Plant_calculator			pltc9		(.*,							.plantX(plant9X),	.plantY(plant9Y),			.PlantLive(PlantLive9),
												 .address(addressplt9),	.plant_on(plant_on9));
	pea							pea9		(.frame_clk(VGA_VS), 	.startX(plant9X), .startY(plant9Y),			.PlantLive(PlantLive9),
												 .BallX(Ball9X),			.BallY(Ball9Y),	.stopX(stop9),				.hit(hit9));
	matcher1						match9	(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9));
	pea_calculator				pc9		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.PlantLive(PlantLive9),
												 .pea_on(pea_on9));
	attackFinder				af9_1		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit9),				.attack(attack1),	.result(attack1_9));
	attackFinder				af9_2		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit9),				.attack(attack2),	.result(attack2_9));
	attackFinder				af9_3		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit9),				.attack(attack3),	.result(attack3_9));
	attackFinder				af9_4		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit9),				.attack(attack4),	.result(attack4_9));
	attackFinder				af9_5		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit9),				.attack(attack5),	.result(attack5_9));
	attackFinder				af9_6		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit9),				.attack(attack6),	.result(attack6_9));
	attackFinder				af9_7		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit9),				.attack(attack7),	.result(attack7_9));
	attackFinder				af9_8		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit9),				.attack(attack8),	.result(attack8_9));
	attackFinder				af9_9		(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit9),				.attack(attack9),	.result(attack9_9));
	attackFinder				af9_10	(.*,							.BallX(Ball9X),	.BallY(Ball9Y),			.stopX(stop9),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit9),				.attack(attack10),.result(attack10_9));
												 
	plant 						plt10		(.*,							.Plant(plant10),	.posX(curX),				.posY(curY), 
												 .plantX(plant10X),		.plantY(plant10Y),.PlantLive(PlantLive10),.beingEating(beingEating10));
	Plant_calculator			pltc10	(.*,							.plantX(plant10X),.plantY(plant10Y),		.PlantLive(PlantLive10),
												 .address(addressplt10),.plant_on(plant_on10));
	pea							pea10		(.frame_clk(VGA_VS), 	.startX(plant10X),.startY(plant10Y),		.PlantLive(PlantLive10),
												 .BallX(Ball10X),			.BallY(Ball10Y),	.stopX(stop10),			.hit(hit10));
	matcher1						match10	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10));
	pea_calculator				pc10		(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.PlantLive(PlantLive10),
												 .pea_on(pea_on10));
	attackFinder				af10_1	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit10),				.attack(attack1),	.result(attack1_10));
	attackFinder				af10_2	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit10),				.attack(attack2),	.result(attack2_10));
	attackFinder				af10_3	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit10),				.attack(attack3),	.result(attack3_10));
	attackFinder				af10_4	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit10),				.attack(attack4),	.result(attack4_10));
	attackFinder				af10_5	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit10),				.attack(attack5),	.result(attack5_10));
	attackFinder				af10_6	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit10),				.attack(attack6),	.result(attack6_10));
	attackFinder				af10_7	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit10),				.attack(attack7),	.result(attack7_10));
	attackFinder				af10_8	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit10),				.attack(attack8),	.result(attack8_10));
	attackFinder				af10_9	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit10),				.attack(attack9),	.result(attack9_10));
	attackFinder				af10_10	(.*,							.BallX(Ball10X),	.BallY(Ball10Y),			.stopX(stop10),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit10),				.attack(attack10),.result(attack10_10));
												 
	plant 						plt11		(.*,							.Plant(plant11),	.posX(curX),				.posY(curY), 
												 .plantX(plant11X),		.plantY(plant11Y),.PlantLive(PlantLive11),.beingEating(beingEating11));
	Plant_calculator			pltc11	(.*,							.plantX(plant11X),.plantY(plant11Y),		.PlantLive(PlantLive11),
												 .address(addressplt11),.plant_on(plant_on11));
	pea							pea11		(.frame_clk(VGA_VS), 	.startX(plant11X),.startY(plant11Y),		.PlantLive(PlantLive11),
												 .BallX(Ball11X),			.BallY(Ball11Y),	.stopX(stop11),			.hit(hit11));
	matcher1						match11	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11));
	pea_calculator				pc11		(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.PlantLive(PlantLive11),
												 .pea_on(pea_on11));
	attackFinder				af11_1	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit11),				.attack(attack1),	.result(attack1_11));
	attackFinder				af11_2	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit11),				.attack(attack2),	.result(attack2_11));
	attackFinder				af11_3	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit11),				.attack(attack3),	.result(attack3_11));
	attackFinder				af11_4	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit11),				.attack(attack4),	.result(attack4_11));
	attackFinder				af11_5	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit11),				.attack(attack5),	.result(attack5_11));
	attackFinder				af11_6	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit11),				.attack(attack6),	.result(attack6_11));
	attackFinder				af11_7	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit11),				.attack(attack7),	.result(attack7_11));
	attackFinder				af11_8	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit11),				.attack(attack8),	.result(attack8_11));
	attackFinder				af11_9	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit11),				.attack(attack9),	.result(attack9_11));
	attackFinder				af11_10	(.*,							.BallX(Ball11X),	.BallY(Ball11Y),			.stopX(stop11),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit11),				.attack(attack10),.result(attack10_11));
												 
	plant 						plt12		(.*,							.Plant(plant12),	.posX(curX),				.posY(curY), 
												 .plantX(plant12X),		.plantY(plant12Y),.PlantLive(PlantLive12),.beingEating(beingEating12));
	Plant_calculator			pltc12	(.*,							.plantX(plant12X),.plantY(plant12Y),		.PlantLive(PlantLive12),
												 .address(addressplt12),	.plant_on(plant_on12));
	pea							pea12		(.frame_clk(VGA_VS), 	.startX(plant12X),.startY(plant12Y),		.PlantLive(PlantLive12),
												 .BallX(Ball12X),			.BallY(Ball12Y),	.stopX(stop12),			.hit(hit12));
	matcher1						match12	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12));
	pea_calculator				pc12		(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.PlantLive(PlantLive12),
												 .pea_on(pea_on12));
	attackFinder				af12_1	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit12),				.attack(attack1),	.result(attack1_12));
	attackFinder				af12_2	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit12),				.attack(attack2),	.result(attack2_12));
	attackFinder				af12_3	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit12),				.attack(attack3),	.result(attack3_12));
	attackFinder				af12_4	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit12),				.attack(attack4),	.result(attack4_12));
	attackFinder				af12_5	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit12),				.attack(attack5),	.result(attack5_12));
	attackFinder				af12_6	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit12),				.attack(attack6),	.result(attack6_12));
	attackFinder				af12_7	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit12),				.attack(attack7),	.result(attack7_12));
	attackFinder				af12_8	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit12),				.attack(attack8),	.result(attack8_12));
	attackFinder				af12_9	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit12),				.attack(attack9),	.result(attack9_12));
	attackFinder				af12_10	(.*,							.BallX(Ball12X),	.BallY(Ball12Y),			.stopX(stop12),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit12),				.attack(attack10),.result(attack10_12));
												 
	plant 						plt13		(.*,							.Plant(plant13),	.posX(curX),				.posY(curY), 
												 .plantX(plant13X),		.plantY(plant13Y),.PlantLive(PlantLive13),.beingEating(beingEating13));
	Plant_calculator			pltc13	(.*,						.plantX(plant13X),.plantY(plant13Y),		.PlantLive(PlantLive13),
												 .address(addressplt13),.plant_on(plant_on13));
	pea							pea13		(.frame_clk(VGA_VS), 	.startX(plant13X),.startY(plant13Y),		.PlantLive(PlantLive13),
												 .BallX(Ball13X),			.BallY(Ball13Y),	.stopX(stop13),			.hit(hit13));
	matcher1						match13	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13));
	pea_calculator				pc13		(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.PlantLive(PlantLive13),
												 .pea_on(pea_on13));
	attackFinder				af13_1	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit13),				.attack(attack1),	.result(attack1_13));
	attackFinder				af13_2	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit13),				.attack(attack2),	.result(attack2_13));
	attackFinder				af13_3	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit13),				.attack(attack3),	.result(attack3_13));
	attackFinder				af13_4	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit13),				.attack(attack4),	.result(attack4_13));
	attackFinder				af13_5	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit13),				.attack(attack5),	.result(attack5_13));
	attackFinder				af13_6	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit13),				.attack(attack6),	.result(attack6_13));
	attackFinder				af13_7	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit13),				.attack(attack7),	.result(attack7_13));
	attackFinder				af13_8	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit13),				.attack(attack8),	.result(attack8_13));
	attackFinder				af13_9	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit13),				.attack(attack9),	.result(attack9_13));
	attackFinder				af13_10	(.*,							.BallX(Ball13X),	.BallY(Ball13Y),			.stopX(stop13),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit13),				.attack(attack10),.result(attack10_13));
												 
	plant 						plt14		(.*,							.Plant(plant14),	.posX(curX),				.posY(curY), 
												 .plantX(plant14X),		.plantY(plant14Y),.PlantLive(PlantLive14),.beingEating(beingEating14));
	Plant_calculator			pltc14	(.*,							.plantX(plant14X),.plantY(plant14Y),		.PlantLive(PlantLive14),
												 .address(addressplt14),	.plant_on(plant_on14));
	pea							pea14 	(.frame_clk(VGA_VS), 	.startX(plant14X),.startY(plant14Y),		.PlantLive(PlantLive14),
												 .BallX(Ball14X),			.BallY(Ball14Y),	.stopX(stop14),			.hit(hit14));
	matcher1						match14	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14));
	pea_calculator				pc14		(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.PlantLive(PlantLive14),
												 .pea_on(pea_on14));
	attackFinder				af14_1	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit14),				.attack(attack1),	.result(attack1_14));
	attackFinder				af14_2	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit14),				.attack(attack2),	.result(attack2_14));
	attackFinder				af14_3	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit14),				.attack(attack3),	.result(attack3_14));
	attackFinder				af14_4	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit14),				.attack(attack4),	.result(attack4_14));
	attackFinder				af14_5	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit14),				.attack(attack5),	.result(attack5_14));
	attackFinder				af14_6	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit14),				.attack(attack6),	.result(attack6_14));
	attackFinder				af14_7	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit14),				.attack(attack7),	.result(attack7_14));
	attackFinder				af14_8	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit14),				.attack(attack8),	.result(attack8_14));
	attackFinder				af14_9	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit14),				.attack(attack9),	.result(attack9_14));
	attackFinder				af14_10	(.*,							.BallX(Ball14X),	.BallY(Ball14Y),			.stopX(stop14),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit14),				.attack(attack10),.result(attack10_14));
												 
	plant 						plt15		(.*,							.Plant(plant15),	.posX(curX),				.posY(curY), 
												 .plantX(plant15X),		.plantY(plant15Y),.PlantLive(PlantLive15),.beingEating(beingEating15));
	Plant_calculator			pltc15	(.*,							.plantX(plant15X),.plantY(plant15Y),		.PlantLive(PlantLive15),
												 .address(addressplt15),.plant_on(plant_on15));
	pea							pea15		(.frame_clk(VGA_VS), 	.startX(plant15X),.startY(plant15Y),		.PlantLive(PlantLive15),
												 .BallX(Ball15X),			.BallY(Ball15Y),	.stopX(stop15),			.hit(hit15));
	matcher1						match15	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15));
	pea_calculator				pc15		(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.PlantLive(PlantLive15),
												 .pea_on(pea_on15));
	attackFinder				af15_1	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit15),				.attack(attack1),	.result(attack1_15));
	attackFinder				af15_2	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit15),				.attack(attack2),	.result(attack2_15));
	attackFinder				af15_3	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit15),				.attack(attack3),	.result(attack3_15));
	attackFinder				af15_4	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit15),				.attack(attack4),	.result(attack4_15));
	attackFinder				af15_5	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit15),				.attack(attack5),	.result(attack5_15));
	attackFinder				af15_6	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit15),				.attack(attack6),	.result(attack6_15));
	attackFinder				af15_7	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit15),				.attack(attack7),	.result(attack7_15));
	attackFinder				af15_8	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit15),				.attack(attack8),	.result(attack8_15));
	attackFinder				af15_9	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit15),				.attack(attack9),	.result(attack9_15));
	attackFinder				af15_10	(.*,							.BallX(Ball15X),	.BallY(Ball15Y),			.stopX(stop15),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit15),				.attack(attack10),.result(attack10_15));
												 
	plant 						plt16		(.*,							.Plant(plant16),	.posX(curX),				.posY(curY), 
												 .plantX(plant16X),		.plantY(plant16Y),.PlantLive(PlantLive16),.beingEating(beingEating16));
	Plant_calculator			pltc16	(.*,						.plantX(plant16X),	.plantY(plant16Y),		.PlantLive(PlantLive16),
												 .address(addressplt16),.plant_on(plant_on16));
	pea							pea16		(.frame_clk(VGA_VS), 	.startX(plant16X),.startY(plant16Y),		.PlantLive(PlantLive16),
												 .BallX(Ball16X),			.BallY(Ball16Y),	.stopX(stop16),			.hit(hit16));
	matcher1						match16	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16));
	pea_calculator				pc16		(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.PlantLive(PlantLive16),
												 .pea_on(pea_on16));
	attackFinder				af16_1	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit16),				.attack(attack1),	.result(attack1_16));
	attackFinder				af16_2	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit16),				.attack(attack2),	.result(attack2_16));
	attackFinder				af16_3	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit16),				.attack(attack3),	.result(attack3_16));
	attackFinder				af16_4	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit16),				.attack(attack4),	.result(attack4_16));
	attackFinder				af16_5	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit16),				.attack(attack5),	.result(attack5_16));
	attackFinder				af16_6	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit16),				.attack(attack6),	.result(attack6_16));
	attackFinder				af16_7	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit16),				.attack(attack7),	.result(attack7_16));
	attackFinder				af16_8	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit16),				.attack(attack8),	.result(attack8_16));
	attackFinder				af16_9	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit16),				.attack(attack9),	.result(attack9_16));
	attackFinder				af16_10	(.*,							.BallX(Ball16X),	.BallY(Ball16Y),			.stopX(stop16),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit16),				.attack(attack10),.result(attack10_16));
												 
	plant 						plt17		(.*,							.Plant(plant17),	.posX(curX),				.posY(curY), 
												 .plantX(plant17X),		.plantY(plant17Y),.PlantLive(PlantLive17),.beingEating(beingEating17));
	Plant_calculator			pltc17	(.*,							.plantX(plant17X),.plantY(plant17Y),		.PlantLive(PlantLive17),
												 .address(addressplt17),	.plant_on(plant_on17));
	pea							pea17		(.frame_clk(VGA_VS), 	.startX(plant17X),.startY(plant17Y),		.PlantLive(PlantLive17),
												 .BallX(Ball17X),			.BallY(Ball17Y),	.stopX(stop17),			.hit(hit17));
	matcher1						match17	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17));
	pea_calculator				pc17		(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.PlantLive(PlantLive17),
												 .pea_on(pea_on17));
	attackFinder				af17_1	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit17),				.attack(attack1),	.result(attack1_17));
	attackFinder				af17_2	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit17),				.attack(attack2),	.result(attack2_17));
	attackFinder				af17_3	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit17),				.attack(attack3),	.result(attack3_17));
	attackFinder				af17_4	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit17),				.attack(attack4),	.result(attack4_17));
	attackFinder				af17_5	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit17),				.attack(attack5),	.result(attack5_17));
	attackFinder				af17_6	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit17),				.attack(attack6),	.result(attack6_17));
	attackFinder				af17_7	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit17),				.attack(attack7),	.result(attack7_17));
	attackFinder				af17_8	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit17),				.attack(attack8),	.result(attack8_17));
	attackFinder				af17_9	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit17),				.attack(attack9),	.result(attack9_17));
	attackFinder				af17_10	(.*,							.BallX(Ball17X),	.BallY(Ball17Y),			.stopX(stop17),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit17),				.attack(attack10),.result(attack10_17));
												 
	plant 						plt18		(.*,							.Plant(plant18),	.posX(curX),				.posY(curY), 
												 .plantX(plant18X),		.plantY(plant18Y),.PlantLive(PlantLive18),.beingEating(beingEating18));
	Plant_calculator			pltc18	(.*,						.plantX(plant18X),	.plantY(plant18Y),		.PlantLive(PlantLive18),
												 .address(addressplt18),.plant_on(plant_on18));
	pea							pea18		(.frame_clk(VGA_VS), 	.startX(plant18X),.startY(plant18Y),		.PlantLive(PlantLive18),
												 .BallX(Ball18X),			.BallY(Ball18Y),	.stopX(stop18),			.hit(hit18));
	matcher1						match18	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18));
	pea_calculator				pc18		(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.PlantLive(PlantLive18),
												 .pea_on(pea_on18));
	attackFinder				af18_1	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit18),				.attack(attack1),	.result(attack1_18));
	attackFinder				af18_2	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit18),				.attack(attack2),	.result(attack2_18));
	attackFinder				af18_3	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit18),				.attack(attack3),	.result(attack3_18));
	attackFinder				af18_4	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit18),				.attack(attack4),	.result(attack4_18));
	attackFinder				af18_5	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit18),				.attack(attack5),	.result(attack5_18));
	attackFinder				af18_6	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit18),				.attack(attack6),	.result(attack6_18));
	attackFinder				af18_7	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit18),				.attack(attack7),	.result(attack7_18));
	attackFinder				af18_8	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit18),				.attack(attack8),	.result(attack8_18));
	attackFinder				af18_9	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit18),				.attack(attack9),	.result(attack9_18));
	attackFinder				af18_10	(.*,							.BallX(Ball18X),	.BallY(Ball18Y),			.stopX(stop18),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit18),				.attack(attack10),.result(attack10_18));
												 
	plant 						plt19		(.*,							.Plant(plant19),	.posX(curX),				.posY(curY), 
												 .plantX(plant19X),		.plantY(plant19Y),.PlantLive(PlantLive19),.beingEating(beingEating19));
	Plant_calculator			pltc19	(.*,							.plantX(plant19X),.plantY(plant19Y),		.PlantLive(PlantLive19),
												 .address(addressplt19),.plant_on(plant_on19));
	pea							pea19		(.frame_clk(VGA_VS), 	.startX(plant19X),.startY(plant19Y),		.PlantLive(PlantLive19),
												 .BallX(Ball19X),			.BallY(Ball19Y),	.stopX(stop19),			.hit(hit19));
	matcher1						match19	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19));
	pea_calculator				pc19		(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.PlantLive(PlantLive19),
												 .pea_on(pea_on19));
	attackFinder				af19_1	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit19),				.attack(attack1),	.result(attack1_19));
	attackFinder				af19_2	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit19),				.attack(attack2),	.result(attack2_19));
	attackFinder				af19_3	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit19),				.attack(attack3),	.result(attack3_19));
	attackFinder				af19_4	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit19),				.attack(attack4),	.result(attack4_19));
	attackFinder				af19_5	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit19),				.attack(attack5),	.result(attack5_19));
	attackFinder				af19_6	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit19),				.attack(attack6),	.result(attack6_19));
	attackFinder				af19_7	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit19),				.attack(attack7),	.result(attack7_19));
	attackFinder				af19_8	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit19),				.attack(attack8),	.result(attack8_19));
	attackFinder				af19_9	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit19),				.attack(attack9),	.result(attack9_19));
	attackFinder				af19_10	(.*,							.BallX(Ball19X),	.BallY(Ball19Y),			.stopX(stop19),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit19),				.attack(attack10),.result(attack10_19));
												 
	plant 						plt20		(.*,							.Plant(plant20),	.posX(curX),				.posY(curY), 
												 .plantX(plant20X),		.plantY(plant20Y),.PlantLive(PlantLive20),.beingEating(beingEating20));
	Plant_calculator			pltc20	(.*,							.plantX(plant20X),.plantY(plant20Y),		.PlantLive(PlantLive20),
												 .address(addressplt20),	.plant_on(plant_on20));
	pea							pea20		(.frame_clk(VGA_VS), 	.startX(plant20X),.startY(plant20Y),		.PlantLive(PlantLive20),
												 .BallX(Ball20X),			.BallY(Ball20Y),	.stopX(stop20),			.hit(hit20));
	matcher1						match20	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20));
	pea_calculator				pc20		(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.PlantLive(PlantLive20),
												 .pea_on(pea_on20));
	attackFinder				af20_1	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX1),					.ZomCentralY(ZomCentralY1),
												 .hit(hit20),				.attack(attack1),	.result(attack1_20));
	attackFinder				af20_2	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX2),					.ZomCentralY(ZomCentralY2),
												 .hit(hit20),				.attack(attack2),	.result(attack2_20));
	attackFinder				af20_3	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX3),					.ZomCentralY(ZomCentralY3),
												 .hit(hit20),				.attack(attack3),	.result(attack3_20));
	attackFinder				af20_4	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX4),					.ZomCentralY(ZomCentralY4),
												 .hit(hit20),				.attack(attack4),	.result(attack4_20));
	attackFinder				af20_5	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX5),					.ZomCentralY(ZomCentralY5),
												 .hit(hit20),				.attack(attack5),	.result(attack5_20));
	attackFinder				af20_6	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX6),					.ZomCentralY(ZomCentralY6),
												 .hit(hit20),				.attack(attack6),	.result(attack6_20));
	attackFinder				af20_7	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX7),					.ZomCentralY(ZomCentralY7),
												 .hit(hit20),				.attack(attack7),	.result(attack7_20));
	attackFinder				af20_8	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX8),					.ZomCentralY(ZomCentralY8),
												 .hit(hit20),				.attack(attack8),	.result(attack8_20));
	attackFinder				af20_9	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX9),					.ZomCentralY(ZomCentralY9),
												 .hit(hit20),				.attack(attack9),	.result(attack9_20));
	attackFinder				af20_10	(.*,							.BallX(Ball20X),	.BallY(Ball20Y),			.stopX(stop20),
												 .ZomCentralX(ZomCentralX10),					.ZomCentralY(ZomCentralY10),
												 .hit(hit20),				.attack(attack10),.result(attack10_20));

	peaStopCalculator			ptc1		(.*);
	
	attackAssembler			attasm1	(.attack1(attack1_1),	.attack2(attack1_2),	.attack3(attack1_3),		.attack4(attack1_4),		.attack5(attack1_5),
												 .attack6(attack1_6),	.attack7(attack1_7),	.attack8(attack1_8),		.attack9(attack1_1),		.attack10(attack1_10),
												 .attack11(attack1_11),	.attack12(attack1_12),.attack13(attack1_13),	.attack14(attack1_14),	.attack15(attack1_15),
												 .attack16(attack1_16),	.attack17(attack1_17),.attack18(attack1_18),	.attack19(attack1_19),	.attack20(attack1_20),
												 .attack(attack1));
												 
	attackAssembler			attasm2	(.attack1(attack2_1),	.attack2(attack2_2),	.attack3(attack2_3),		.attack4(attack2_4),		.attack5(attack2_5),
												 .attack6(attack2_6),	.attack7(attack2_7),	.attack8(attack2_8),		.attack9(attack2_1),		.attack10(attack2_10),
												 .attack11(attack2_11),	.attack12(attack2_12),.attack13(attack2_13),	.attack14(attack2_14),	.attack15(attack2_15),
												 .attack16(attack2_16),	.attack17(attack2_17),.attack18(attack2_18),	.attack19(attack2_19),	.attack20(attack2_20),
												 .attack(attack2));
												 
	attackAssembler			attasm3	(.attack1(attack3_1),	.attack2(attack3_2),	.attack3(attack3_3),		.attack4(attack3_4),		.attack5(attack3_5),
												 .attack6(attack3_6),	.attack7(attack3_7),	.attack8(attack3_8),		.attack9(attack3_1),		.attack10(attack3_10),
												 .attack11(attack3_11),	.attack12(attack3_12),.attack13(attack3_13),	.attack14(attack3_14),	.attack15(attack3_15),
												 .attack16(attack3_16),	.attack17(attack3_17),.attack18(attack3_18),	.attack19(attack3_19),	.attack20(attack3_20),
												 .attack(attack3));
												 
	attackAssembler			attasm4	(.attack1(attack4_1),	.attack2(attack4_2),	.attack3(attack4_3),		.attack4(attack4_4),		.attack5(attack4_5),
												 .attack6(attack4_6),	.attack7(attack4_7),	.attack8(attack4_8),		.attack9(attack4_1),		.attack10(attack4_10),
												 .attack11(attack4_11),	.attack12(attack4_12),.attack13(attack4_13),	.attack14(attack4_14),	.attack15(attack4_15),
												 .attack16(attack4_16),	.attack17(attack4_17),.attack18(attack4_18),	.attack19(attack4_19),	.attack20(attack4_20),
												 .attack(attack4));
												 
	attackAssembler			attasm5	(.attack1(attack5_1),	.attack2(attack5_2),	.attack3(attack5_3),		.attack4(attack5_4),		.attack5(attack5_5),
												 .attack6(attack5_6),	.attack7(attack5_7),	.attack8(attack5_8),		.attack9(attack5_1),		.attack10(attack5_10),
												 .attack11(attack5_11),	.attack12(attack5_12),.attack13(attack5_13),	.attack14(attack5_14),	.attack15(attack5_15),
												 .attack16(attack5_16),	.attack17(attack5_17),.attack18(attack5_18),	.attack19(attack5_19),	.attack20(attack5_20),
												 .attack(attack5));
												 
	attackAssembler			attasm6	(.attack1(attack6_1),	.attack2(attack6_2),	.attack3(attack6_3),		.attack4(attack6_4),		.attack5(attack6_5),
												 .attack6(attack6_6),	.attack7(attack6_7),	.attack8(attack6_8),		.attack9(attack6_1),		.attack10(attack6_10),
												 .attack11(attack6_11),	.attack12(attack6_12),.attack13(attack6_13),	.attack14(attack6_14),	.attack15(attack6_15),
												 .attack16(attack6_16),	.attack17(attack6_17),.attack18(attack6_18),	.attack19(attack6_19),	.attack20(attack6_20),
												 .attack(attack6));
												 
	attackAssembler			attasm7	(.attack1(attack7_1),	.attack2(attack7_2),	.attack3(attack7_3),		.attack4(attack7_4),		.attack5(attack7_5),
												 .attack6(attack7_6),	.attack7(attack7_7),	.attack8(attack7_8),		.attack9(attack7_1),		.attack10(attack7_10),
												 .attack11(attack7_11),	.attack12(attack7_12),.attack13(attack7_13),	.attack14(attack7_14),	.attack15(attack7_15),
												 .attack16(attack7_16),	.attack17(attack7_17),.attack18(attack7_18),	.attack19(attack7_19),	.attack20(attack7_20),
												 .attack(attack7));
												 
	attackAssembler			attasm8	(.attack1(attack8_1),	.attack2(attack8_2),	.attack3(attack8_3),		.attack4(attack8_4),		.attack5(attack8_5),
												 .attack6(attack8_6),	.attack7(attack8_7),	.attack8(attack8_8),		.attack9(attack8_1),		.attack10(attack8_10),
												 .attack11(attack8_11),	.attack12(attack8_12),.attack13(attack8_13),	.attack14(attack8_14),	.attack15(attack8_15),
												 .attack16(attack8_16),	.attack17(attack8_17),.attack18(attack8_18),	.attack19(attack8_19),	.attack20(attack8_20),
												 .attack(attack8));
												 
	attackAssembler			attasm9	(.attack1(attack9_1),	.attack2(attack9_2),	.attack3(attack9_3),		.attack4(attack9_4),		.attack5(attack9_5),
												 .attack6(attack9_6),	.attack7(attack9_7),	.attack8(attack9_8),		.attack9(attack9_1),		.attack10(attack9_10),
												 .attack11(attack9_11),	.attack12(attack9_12),.attack13(attack9_13),	.attack14(attack9_14),	.attack15(attack9_15),
												 .attack16(attack9_16),	.attack17(attack9_17),.attack18(attack9_18),	.attack19(attack9_19),	.attack20(attack9_20),
												 .attack(attack9));
	attackAssembler			attasm10	(.attack1(attack10_1),	.attack2(attack10_2),	.attack3(attack10_3),	.attack4(attack10_4),	.attack5(attack10_5),
												 .attack6(attack10_6),	.attack7(attack10_7),	.attack8(attack10_8),	.attack9(attack10_1),	.attack10(attack10_10),
												 .attack11(attack10_11),.attack12(attack10_12),	.attack13(attack10_13),	.attack14(attack10_14),	.attack15(attack10_15),
												 .attack16(attack10_16),.attack17(attack10_17),	.attack18(attack10_18),	.attack19(attack10_19),	.attack20(attack10_20),
												 .attack(attack10));
	
endmodule 