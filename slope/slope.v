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
    output reg eq,
    output reg pos,
    output reg neg,
    output posen,
    output negen
    );
        
    reg [WIDTH-1:0] prev_data;
    wire lt_temp, gt_temp, eq_temp;
    
    always @(posedge clk)
    begin
        pos <= lt_temp;
        neg <= gt_temp;
        eq <= eq_temp;
    end

    comparator #(WIDTH) U0 (
        .a(prev_data),
        .b(datain),
        .eq(eq_temp),
        .lt(lt_temp),
        .gt(gt_temp)
        );

    reg prev_pos, prev_neg;
    wire pos_temp, neg_temp;
    assign posen = pos_temp;
    assign negen = neg_temp;
    assign pos_temp = prev_pos && !pos;
    assign neg_temp = prev_neg && !neg;
    
    always @(posedge clk)
    begin
        prev_data <= datain;
        prev_pos <= pos;
        prev_neg <= neg;
    end

endmodule
