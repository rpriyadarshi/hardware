`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: http://www.edaboard.com/thread39599.html
// 
// Create Date: 08/15/2017 09:31:24 AM
// Design Name: 
// Module Name: SineCos
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

module sine_cos(clk, reset, en, sine, cos, sine_u, cos_u);
    input clk, reset, en;
    output [7:0] sine, cos;
    output [7:0] sine_u, cos_u;

    reg [7:0] sine_r, cos_r;
    
    assign sine     = sine_r + {cos_r[7], cos_r[7], cos_r[7], cos_r[7:3]};
    assign cos      = cos_r - {sine[7], sine[7], sine[7], sine[7:3]};
    assign sine_u   = {~sine[7], sine[6:3]};
    assign cos_u    = {~cos[7], cos[6:3]};

    always@(posedge clk or negedge reset)
    begin
        if (!reset) begin
            sine_r <= 0;
            cos_r <= 120;
        end else begin
            if (en) begin
                sine_r <= sine;
                cos_r <= cos;
            end
        end
    end
endmodule // sine_cos
