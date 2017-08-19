`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/13/2017 03:28:34 PM
// Design Name: 
// Module Name: Counter
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


module counter(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
    );
    
    always @(posedge clk) begin
        if(reset == 1'b1) begin
            count <= 0;
        end
        else if (enable == 1'b1) begin
            count <= count + 1;
        end
    end
    
endmodule
