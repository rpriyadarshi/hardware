`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/21/2017 09:31:15 PM
// Design Name: 
// Module Name: slope
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


module slope #(parameter WIDTH = 16) (
    input clk,
    input [WIDTH-1:0] datain,
    output eq,
    output lt,
    output gt
    );
    
    reg [WIDTH-1:0] prev_data;
    
    comparator #(WIDTH) U0 (
        .a(prev_data),
        .b(datain),
        .eq(eq),
        .lt(lt),
        .gt(gt)
        );

    always @(posedge clk)
    begin
        prev_data <= datain;
    end
    
endmodule
