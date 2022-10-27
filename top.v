`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/13 21:56:40
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top (FARMTR,HIGHWAYTR,IND_FARMCAR,IND_AMB,Clk,RS,FARMCAR,AMB_IN);

input Clk;
input RS;
input FARMCAR;
input AMB_IN;
output[2:0]FARMTR;
output[2:0]HIGHWAYTR;
output IND_FARMCAR;
output IND_AMB;

wire AMB,C;
wire HR,HY,HG,FR,FY,FG;

traffic trafficlight_controller(.AMB(AMB),.HR(HR),.HY(HY),.HG(HG),.FR(FR),.FY(FY),.FG(FG),.reset(RS),.C(C),.Clk(Clk));
ind indicator(.IND_FARMCAR(IND_FARMCAR),.IND_AMB(IND_AMB),.AMB(AMB),.C(C),.Clk(Clk),.reset(RS));
trafficlight trafficlight(FARMTR,HIGHWAYTR,AMB,C,HR,HY,HG,FR,FY,FG,AMB_IN,FARMCAR,Clk,RS);
endmodule