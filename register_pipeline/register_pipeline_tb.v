`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: Rohit Priyadarshi
// 
// Create Date: 08/15/2017 09:32:42 PM
// Design Name: 
// Module Name: register_pipeline_tb
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


module register_pipeline_tb #(parameter WIDTH = 16, parameter SIZE = 8)();
    reg clk;
    reg reset;
    reg enable;
    reg [WIDTH-1:0] datain;
    wire [WIDTH-1:0] dataout;

    register_pipeline #(WIDTH, SIZE) U0 (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .datain(datain),
        .dataout(dataout)
    );

    always begin
        #25 clk = !clk;
    end
    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars;
        $display("\t\ttime,\tclk\tdatain,\tdataout");
        $monitor("%d,\t%b,\t%d,\t%d", $time, clk, datain, dataout);
    end
    
    initial begin
        clk = 0; reset = 0; enable = 0;
        #5 reset = 1;
        #10 enable = 1;
        #1000 $finish;
    end
    
    initial begin
        forever begin
            @(negedge clk);
                datain = $random;
        end
    end

endmodule
