`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/15/2017 07:44:23 PM
// Design Name: 
// Module Name: sine_cos_tb
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

module sine_cos_tb #(parameter WIDTH = 8) ();
    reg clk;
    reg reset;
    reg en;
    wire [WIDTH-1:0] sine;
    wire [WIDTH-1:0] cos;
    
    sine_cos #(WIDTH) U0 (
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
        #10000 $finish;
    end

    always begin
        #25 clk = ~clk;
    end

endmodule
