`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/13 23:08:31
// Design Name: 
// Module Name: ind
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

module ind(IND_FARMCAR,IND_AMB,AMB,C,Clk,reset );
input AMB;
input C;
input Clk;
input reset;

output reg IND_FARMCAR;
output reg IND_AMB;

wire WH,RE;
integer r;

assign WH = (r >= 800000);
assign RE = (r >= 1600000);

always @(posedge Clk) begin
if(reset) begin
IND_FARMCAR <= 0;
IND_AMB <= 0;
end
else begin
if(AMB & RE) begin
IND_AMB <= 1;
r <= 0;
end
else if(AMB & WH) begin
IND_AMB <= 0;
r <= r+1;
end
else if(AMB) begin
IND_AMB <= 1;
r <= r+1;
end
else begin
IND_AMB <= 0;
r <= 0;
end
if(C) IND_FARMCAR <= 1;
else IND_FARMCAR <= 0;
end
end
endmodule
