`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/10/2017 09:16:12 PM
// Design Name: 
// Module Name: Comparator
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


module comparator #(parameter WIDTH = 16) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output eq,
    output lt,
    output gt
    );
    assign eq = (a === b);
    assign lt = (a < b) ? 1'b1 : 1'b0;
    assign gt = (a > b) ? 1'b1 : 1'b0;
endmodule
