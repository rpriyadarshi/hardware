`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2017 11:30:40 PM
// Design Name: 
// Module Name: envelope_tb
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


module envelope_tb #(parameter WIDTH = 16, parameter SIZE = 8) ();
    reg clk;
    reg reset;
    reg en;
    wire [WIDTH-1:0] sine;
    wire [WIDTH-1:0] cos;
    wire posen;
    wire negen;
    wire [WIDTH-1:0] dataout;
    wire [WIDTH-1:0] maxout;
    wire [WIDTH-1:0] minout;

    envelope #(WIDTH, SIZE) env (
        .clk(clk),
        .reset(reset),
        .datain(sine),
        .posen(posen),
        .negen(negen),
        .dataout(dataout),
        .maxout(maxout),
        .minout(minout)
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
        #1000000 $finish;
    end
    
    always begin
        #25 clk = ~clk;
    end
endmodule
