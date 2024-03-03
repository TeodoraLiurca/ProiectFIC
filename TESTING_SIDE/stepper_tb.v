`include "stepper.v"

`timescale 10us/100ns  

module stepper_tb;

    // Signals
    reg clk;
    reg rst;
    wire [6:0] steps;

    // Instantiate the module under test
    stepper #(.SIZE(7)) dut (
        .clk(clk),
        .rst(rst),
        .steps(steps)
    );

    // Clock generation
    initial repeat(40) #20 clk=~clk;

    // Initializations
    initial begin
        clk = 0;
        rst = 1; // Assert reset initially
        #20;    // Wait for a few cycles
        rst = 0; // Deassert reset
        // Add additional tests here if needed

        #200;
        rst = 1;
        #20 rst=0;
    end

    initial begin
        $monitor("steps: %b\t, clk:%b, rst:%b\n", steps, clk, rst);
        $dumpfile("waveform.vcd");
        $dumpvars(0, stepper_tb);
    end

endmodule   
