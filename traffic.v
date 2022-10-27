`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/13 21:57:43
// Design Name: 
// Module Name: traffic
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

module traffic(HR,HY,HG,FR,FY,FG,reset,C,AMB,Clk );
output HR,HY,HG,FR,FY,FG;
input reset,C,AMB,Clk;
wire TS,TL,TSE,ST; //Add TSE information
Timer part1(TS,TL,TSE,ST,Clk);
FSM part2(HR,HY,HG,FR,FY,FG,ST,TS,TL,TSE,C,AMB,reset,Clk);
endmodule