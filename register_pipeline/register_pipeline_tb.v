`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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


module register_pipeline_tb();
    reg clk;
    reg [15:0] datain;
    wire [15:0] dataout;

    register_pipeline U0 (
        .clk(clk),
        .datain(datain),
        .dataout(dataout)
    );

    initial begin
        clk = 0;
    end

    always begin
        #5 clk = !clk;
    end
    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars;
    end
    
    initial begin
        $display("\t\ttime,\tclk\tdatain,\tdataout");
        $monitor("%d,\t%b,\t%d,\t%d", $time, clk, datain, dataout);
    end
    
    initial begin
        #200 $finish;
    end
    
    initial begin
        forever begin
            @(negedge clk);
                datain = $random;
        end
    end

endmodule
