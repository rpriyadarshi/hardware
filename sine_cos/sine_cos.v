`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: http://www.edaboard.com/thread39599.html, 
// https://electronics.stackexchange.com/questions/39354/concatenate-signal-n-times-in-verilog
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
//   7  6  5  4 3 2 1 0
// 128 64 32 16 8 4 2 1
//   0  1  1  1 1 0 0 0
//                = 120
// 16'b0111111110000000;//8'b01111000;
// 
//////////////////////////////////////////////////////////////////////////////////

module sine_cos #(parameter WIDTH = 8) (
    input clk, 
    input reset, 
    input en, 
    output [WIDTH-1:0] sine, 
    output [WIDTH-1:0] cos
    );

    wire [WIDTH-1:0] sine_f, cos_f;
    reg [WIDTH-1:0] sine_r, cos_r;
        
    assign sine_f   = sine_r + {{(WIDTH/2){cos_r[WIDTH-1]}}, cos_r[WIDTH-2:(WIDTH-1)/2]};
    assign cos_f    = cos_r - {{(WIDTH/2){sine_f[WIDTH-1]}}, sine_f[WIDTH-2:(WIDTH-1)/2]};
    
    assign sine     = {~sine_f[WIDTH-1], sine_f[WIDTH-2:0]};
    assign cos      = {~cos_f[WIDTH-1], cos_f[WIDTH-2:0]};

    always@(posedge clk or negedge reset)
    begin
        if (!reset) begin
            sine_r <= 0;
            cos_r <= {1'b0, {WIDTH/2{1'b1}}, {WIDTH/2-1{1'b0}}};
        end else begin
            if (en) begin
                sine_r <= sine_f;
                cos_r <= cos_f;
            end
        end
    end
endmodule // sine_cos
