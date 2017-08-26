`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VirtualSamaj
// Engineer: http://www.asic-world.com/verilog/art_testbench_writing.html
// 
// Create Date: 08/13/2017 03:47:15 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
    reg clk, reset, enable;
    wire [3:0] count;
    
    counter U0 (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count));
    
    initial begin
        clk = 0;
        reset = 0;
        enable = 0;
    end
    
    always begin
        #25 clk = !clk;
    end
    
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars;
    end
    
    initial begin
        $display("\t\ttime,\tclk,\treset,\tenable,\tcount");
        $monitor("%d,\t%b,\t%b,\t%b,\t%d", $time, clk, reset, enable, count);
    end
    
//    initial begin
//        #100 $finish;
//    end
    
    event reset_trigger;
    event reset_done_trigger;
    
    initial begin
        forever begin
            @(reset_trigger);
            @(negedge clk);
                reset = 1;
            @(negedge clk);
                reset = 0;
            -> reset_done_trigger;
        end
    end
    
//    initial begin: TEST_CASE
//        #10 -> reset_trigger;
//    end

//    initial begin: TEST_CASE
//        #10 -> reset_trigger;
//        @(reset_done_trigger);
//        @(negedge clk);
//            enable = 1;
//        repeat (10) begin
//            @(negedge clk);
//        end
//        enable = 0;
//    end

//    initial begin: TEST_CASE
//        #10 -> reset_trigger;
//        @(reset_done_trigger);
//        fork
//            repeat (10) begin
//                @(negedge clk);
//                enable = $random;
//            end
//            repeat (10) begin
//                @(negedge clk);
//                reset = $random;
//            end
//        join
//    end
    
    event terminate_sim;
    
    initial begin
        @(terminate_sim);
        #5 $finish;
    end
    
    initial begin: TEST_CASE
        #10 -> reset_trigger;
        @(reset_done_trigger);
        @(negedge clk);
            enable = 1;
        repeat (16) begin
            @(negedge clk);
        end
        enable = 0;
        #5 -> terminate_sim;
    end

    // Count comparision for self test
    reg [3:0] count_compare;

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            count_compare <= 0;
        end else if (enable == 1'b1) begin
            count_compare <= count_compare + 1;
        end
    end
    
    always @(posedge clk) begin
        if (count_compare != count) begin
            $display ("DUT Error at time %d", $time);
            $display ("Expected value %d, Got value %d", count_compare, count);
            #5 -> terminate_sim;
        end
    end
    
endmodule
