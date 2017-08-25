`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/21/2017 09:31:46 PM
// Design Name: 
// Module Name: slope_tb
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

module slope_tb #(parameter WIDTH = 16) ();
    reg clk;
    reg reset;
    reg en;
    wire eq;
    wire pos;
    wire neg;
    wire posen;
    wire negen;
    wire [WIDTH-1:0] sine;
    wire [WIDTH-1:0] cos;
    
    slope #(WIDTH) U0 (
        .clk(clk),
        .datain(sine),
        .eq(eq),
        .pos(pos),
        .neg(neg),
        .posen(posen),
        .negen(negen)
    );
    
    sine_cos #(WIDTH) U1 (
        .clk(clk),
        .reset(reset),
        .en(en),
        .sine(sine),
        .cos(cos)
    );
    
    initial begin
        clk = 0; reset = 0; en = 0;
        #5 reset = 1;
        #10 en = 1;
        #50000 $finish;
    end
    
    always begin
        #25 clk = ~clk;
    end
endmodule
