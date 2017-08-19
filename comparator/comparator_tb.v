`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/14/2017 11:15:14 PM
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb();
    reg [15:0] a;
    reg [15:0] b;
    wire eq;
    wire lt;
    wire gt;
    
    comparator U0 (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );
    
    initial begin
        a <= 5;
        b <= 6;
        
        #100;
        a <= 6;
        b <= 5;
        
        #100;
        a <= 5;
        b <= 5;
        
        repeat (10) begin
            #100;
            a <= $random;
            b <= $random;
        end

        #100 $finish;
    end
        
endmodule
