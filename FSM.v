`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/13 21:59:48
// Design Name: 
// Module Name: FSM
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

module FSM(HR,HY,HG,FR,FY,FG,ST,TS,TL,TSE,C,AMB,reset,Clk);
output HR,HY,HG,FR,FY,FG;
output ST;

input TS,TL;
input TSE;
input C,reset,Clk;
input AMB;

reg[6:1] state;
reg ST;

parameter highwaygreen = 6'b001100;
parameter highwayyellow = 6'b010100;
parameter farmroadgreen = 6'b100001;
parameter farmroadyellow = 6'b100010;

assign HR = state[6];
assign HY = state[5];
assign HG = state[4];
assign FR = state[3];
assign FY = state[2];
assign FG = state[1];

always @(posedge Clk) begin
if(reset)begin
state <= highwaygreen;
ST <= 1;
end
else begin
ST <= 0;
case(state)
highwaygreen:
if(AMB | (TL & C)) begin
state <= highwayyellow; ST <= 1; end
highwayyellow:
if((AMB & TSE) | TS) begin
state <= farmroadgreen; ST <= 1; end
farmroadgreen:
if((!AMB & C & TL) | (!(C | AMB))&TS) begin
state <= farmroadyellow; ST <= 1; end
farmroadyellow:
if(AMB & TSE) begin
state <= farmroadgreen; ST <= 1; end
else if(TS) begin
state <= highwaygreen; ST <= 1; end
endcase
end
end
endmodule
