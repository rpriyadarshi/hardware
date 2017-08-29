`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2017 11:30:17 PM
// Design Name: 
// Module Name: envelope
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


module envelope #(parameter WIDTH = 16, parameter SIZE = 8) (
    input clk,
    input reset,
    input [WIDTH-1:0] datain,
    output posen,
    output negen,
    output [WIDTH-1:0] dataout,
    output [WIDTH-1:0] maxout,
    output [WIDTH-1:0] minout
    );
        
    slope #(WIDTH) slope_det (
        .clk(clk),
        .datain(datain),
        .dataout(dataout),
        .posen(posen),
        .negen(negen)
    );
    
    register_pipeline #(WIDTH, SIZE) U0 (
        .clk(clk),
        .reset(reset),
        .enable(posen),
        .datain(dataout),
        .dataout(maxout)
    );
    
    register_pipeline #(WIDTH, SIZE) U1 (
        .clk(clk),
        .reset(reset),
        .enable(negen),
        .datain(dataout),
        .dataout(minout)
    );
    
endmodule
