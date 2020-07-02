`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Pine Training Academy
// Engineer: Aditya Gupta
// 
// Create Date:    12:35:00 06/30/2020 
// Design Name: 
// Module Name:    Signed_Calculator_4bit_Reset 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Signed_Calculator_4bit_Reset(Out15_R7, Out14_R6, Out13_R5, Out12_R4, Out11_R3, Out10_R2, Out9_R1, Out8_R0, Out7, Out6, Out5, Out4, Out3, Out2, Out1, Out0, A3, A2, A1, A0, B3, B2, B1, B0, M1, M0, S1, S0, Reset);

output Out15_R7, Out14_R6, Out13_R5, Out12_R4, Out11_R3, Out10_R2, Out9_R1, Out8_R0, Out7, Out6, Out5, Out4, Out3, Out2, Out1, Out0;
input A3, A2, A1, A0, B3, B2, B1, B0, M1, M0, S1, S0, Reset;

wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
wire w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;
wire w21, w22, w23, w24, w25, w26, w27, w28, w29, w30;
wire w31, w32, w33, w34, w35, w36, w37, w38, w39, w40;
wire w41, w42, w43, w44, w45, w46, w47, w48, w49, w50;
wire w51, w52, w53, w54, w55, w56, w57, w58, w59, w60;
wire w61, w62, w63, w64, w65, w66, w67, w68, w69, w70;
wire w71, w72, w73, w74, w75, w76, w77, w78, w79, w80;
wire w81, w82, w83, w84, w85, w86, w87, w88, w89, w90;
wire w91, w92, w93, w94, w95, w96, w97, w98, w99, w100;
wire w101, w102, w103, w104, w105, w106, w107, w108, w109, w110;
wire w111, w112, w113, w114, w115, w116, w117, w118, w119, w120;
wire w121, w122, w123, w124, w125, w126, w127, w128, w129, w130;
wire w131, w132, w133, w134, w135, w136, w137, w138, w139, w140;
wire w141, w142, w143, w144, w145, w146, w147, w148, w149, w150;
wire w151, w152, w153, w154, w155, w156, w157, w158, w159, w160;
wire w161, w162, w163, w164, w165, w166, w167, w168, w169, w170;
wire w171, w172, w173, w174, w175, w176, w177;

and n1(w1, A3, Reset);
and n2(w2, A2, Reset);
and n3(w3, A1, Reset);
and n4(w4, A0, Reset);

and n5(w5, B3, Reset);
and n6(w6, B2, Reset);
and n7(w7, B1, Reset);
and n8(w8, B0, Reset);

and n9(w9, M1, Reset);
and n10(w10, M0, Reset);

and n11(w11, S1, Reset); // S1(A) bit sign positive
not n12(w12, w11);
and n13(w13, S0, Reset);  // S0(B) bit Sign positive
not n14(w14, w13);

and n15(w15, w12, Reset); //S1 negative bit with Reset
and n16(w16, w14, Reset); //S0 negative bit with Reset
Two_Complement_Reset n17(w17, w18, w19, w20, w21, w22, w23, w24, w1, w2, w3, w4, w15); //A compl
Two_Complement_Reset n18(w25, w26, w27, w28, w29, w30, w31, w32, w5, w6, w7, w8, w16); //B compl

and n19(w33, w1, w11); // A bits with +ve Sign
and n20(w34, w2, w11);
and n21(w35, w3, w11);
and n22(w36, w4, w11);

and n23(w37, w5, w13);  // B bits with +ve Sign
and n24(w38, w6, w13);
and n25(w39, w7, w13);
and n26(w40, w8, w13);

or n27(w41, w17, 0);  // Both A7-A0 +ve and -ve i/p.
or n28(w42, w18, 0);
or n29(w43, w19, 0);
or n30(w44, w20, 0);
or n31(w45, w21, w33);
or n32(w46, w22, w34);
or n33(w47, w23, w35);
or n34(w48, w24, w36);

or n35(w49, w25, 0);  // Both B7-B0 +ve and -ve i/p.
or n36(w50, w26, 0);
or n37(w51, w27, 0);
or n38(w52, w28, 0);
or n39(w53, w29, w37);
or n40(w54, w30, w38);
or n41(w55, w31, w39);
or n42(w56, w32, w40);

Decoder_2_4_Reset n43(w57, w58, w59, w60, w9, w10, Reset, Reset);

and n44(w61, w57, Reset);   // M1M0 = 11(Will use for Divider)
and n45(w62, w58, Reset);   // M1M0 = 10 Mult
and n46(w63, w59, Reset);   // Sub
and n47(w64, w60, Reset);   // Add

Parallel_Adder_8bit n48(w65, w66, w67, w68, w69, w70, w71, w72, w73, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, 0, w64);

Parallel_Subtractor_8bit_Reset n49(w74, w75, w76, w77, w78, w79, w80, w81, w82, w41, w42, w43, w44, w45, w46, w47, w48, w49, w50, w51, w52, w53, w54, w55, w56, 0, w63);

Multiplier_4bit_Reset n50(w83, w84, w85, w86, w87, w88, w89, w90, w91, w1, w2, w3, w4, w5, w6, w7, w8, w62);

Parallel_Divider_4bit_Reset n51(w92, w93, w94, w95, w96, w97, w98, w99, w1, w2, w3, w4, w5, w6, w7, w8, w61);

xnor n52(w100, w11, w13);
not n53(w101, w100);
Two_Complement_Reset n54(w102, w103, w104, w105, w106, w107, w108, w109, w92, w93, w94, w95, w101);

and n55(w110, w92, w100);
and n56(w111, w93, w100);
and n57(w112, w94, w100);
and n58(w113, w95, w100);

or n59(w114, w102, 0); //Divider o/p Q7-Q0
or n60(w115, w103, 0);
or n61(w116, w104, 0);
or n62(w117, w105, 0);
or n63(w118, w106, w110);
or n64(w119, w107, w111);
or n65(w120, w108, w112);
or n66(w121, w109, w113);

Two_Complement_8bit_Reset n67(w122, w123, w124, w125, w126, w127, w128, w129, w130, w131, w132, w133, w134, w135, w136, w137, w84, w85, w86, w87, w88, w89, w90, w91, w101);

and n68(w138, w84, w100);
and n69(w139, w85, w100);
and n70(w140, w86, w100);
and n71(w141, w87, w100);
and n72(w142, w88, w100);
and n73(w143, w89, w100);
and n74(w144, w90, w100);
and n75(w145, w91, w100);

or n76(w146, w122, 0);  // Mult O/p Q15-Q0
or n77(w147, w123, 0);
or n78(w148, w124, 0);
or n79(w149, w125, 0);
or n80(w150, w126, 0);
or n81(w151, w127, 0);
or n82(w152, w128, 0);
or n83(w153, w129, 0);
or n84(w154, w130, w138);
or n85(w155, w131, w139);
or n86(w156, w132, w140);
or n87(w157, w133, w141);
or n88(w158, w134, w142);
or n89(w159, w135, w143);
or n90(w160, w136, w144);
or n91(w161, w137, w145);

Mux_4_Reset n92(w162, w121, w161, w82, w73, w9, w10, Reset);
Mux_4_Reset n93(w163, w120, w160, w81, w72, w9, w10, Reset);
Mux_4_Reset n94(w164, w119, w159, w80, w71, w9, w10, Reset);
Mux_4_Reset n95(w165, w118, w158, w79, w70, w9, w10, Reset);
Mux_4_Reset n96(w166, w117, w157, w78, w69, w9, w10, Reset);
Mux_4_Reset n97(w167, w116, w156, w77, w68, w9, w10, Reset);
Mux_4_Reset n98(w168, w115, w155, w76, w67, w9, w10, Reset);
Mux_4_Reset n99(w169, w114, w154, w75, w66, w9, w10, Reset);
Mux_4_Reset n100(w170, w99, w153, w74, w65, w9, w10, Reset);
Mux_4_Reset n101(w171, w98, w152, 0, 0, w9, w10, Reset);
Mux_4_Reset n102(w172, w97, w151, 0, 0, w9, w10, Reset);
Mux_4_Reset n103(w173, w96, w150, 0, 0, w9, w10, Reset);
Mux_4_Reset n104(w174, 0, w149, 0, 0, w9, w10, Reset);
Mux_4_Reset n105(w175, 0, w148, 0, 0, w9, w10, Reset);
Mux_4_Reset n106(w176, 0, w147, 0, 0, w9, w10, Reset);
Mux_4_Reset n107(w177, 0, w146, 0, 0, w9, w10, Reset);

and n108(Out0, w162, Reset);
and n109(Out1, w163, Reset);
and n110(Out2, w164, Reset);
and n111(Out3, w165, Reset);
and n112(Out4, w166, Reset);
and n113(Out5, w167, Reset);
and n114(Out6, w168, Reset);
and n115(Out7, w169, Reset);
and n116(Out8_R0, w170, Reset);
and n117(Out9_R1, w171, Reset);
and n118(Out10_R2, w172, Reset);
and n119(Out11_R3, w173, Reset);
and n120(Out12_R4, w174, Reset);
and n121(Out13_R5, w175, Reset);
and n122(Out14_R6, w176, Reset);
and n123(Out15_R7, w177, Reset);


endmodule
