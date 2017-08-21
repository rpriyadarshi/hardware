`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2017 12:15:39 PM
// Design Name: 
// Module Name: compare_sine_cos_tb
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


module compare_sine_cos_tb ();
    parameter WIDTH = 16;
    wire eq;
    wire lt;
    wire gt;
    reg clk;
    reg reset;
    reg en;
    wire [WIDTH-1:0] sine;
    wire [WIDTH-1:0] cos;

    comparator #(WIDTH) U0 (
        .a(sine),
        .b(cos),
        .eq(eq),
        .lt(lt),
        .gt(gt)
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
        #5 clk = ~clk;
    end
endmodule
