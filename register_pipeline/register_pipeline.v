`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/12/2017 10:05:44 AM
// Design Name: 
// Module Name: RegisterPipeline
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


module register_pipeline #(parameter WIDTH = 16, parameter SIZE = 8) (
    input clk,
    input [WIDTH-1:0] datain,
    output reg [WIDTH-1:0] dataout
    );
    
    reg [WIDTH-1:0] array [SIZE-1:0];
   
    genvar i;
    generate
        for (i = 0; i < SIZE; i = i + 1) begin : pipe
            always @(posedge clk) begin
                array[i+1] <= array[i];
                if (i == 0) begin
                    array[i] <= datain;
                end
                else if (i == SIZE-1) begin
                    dataout <= array[i];
                end
            end
        end
    endgenerate
    
endmodule
