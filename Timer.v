`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/13 21:59:17
// Design Name: 
// Module Name: Timer
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

module Timer(TS,TL,TSE,ST,Clk);
output TS;
output TL;
output TSE;
input ST;
input Clk;

integer value;

assign TS = (value >= 4*6000000);
assign TSE = (value >= 1*6000000);
assign TL = (value >= 14*6000000);

always @(posedge Clk or posedge ST) begin
if(ST)
value <= 0;
else if(TL)
value <=value;
else
value <= value+1;
end
endmodule
