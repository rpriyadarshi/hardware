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

module sine_cos_tb();
    reg clk;
    reg reset;
    reg en;
    wire [7:0] sine, sine_u;
    wire [7:0] cos, cos_u;
    
    sine_cos U0 (
        .clk(clk),
        .reset(reset),
        .en(en),
        .sine(sine),
        .cos(cos),
        .sine_u(sine_u),
        .cos_u(cos_u)
    );

    initial begin
        clk = 0; reset = 0; en = 0;
        #5 reset = 1;
        #10 en = 1;
        #5000 $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule
