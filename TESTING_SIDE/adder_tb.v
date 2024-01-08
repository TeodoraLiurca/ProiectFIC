`include "adder.v"
module Testbench;

  reg [7:0] input1, input2;
  wire [7:0] sum;
  wire carry_out;

  // Instantiate the full_adder module with SIZE parameter set to 8
  full_adder #(8) uut (
    .in1(input1),
    .in2(input2),
    .out(sum),
    .cout(carry_out)
  );

  // Stimulus generation
  initial begin
    // Apply input data
    input1 = 8'd255;
    input2 = 8'd1;

    // Display inputs
    #1
    $monitor("Input1: %d, Input2: %d , Output: %d, Carry Out:%b", input1, input2, sum, carry_out);

    // Terminate simulation
    #100 $finish;
  end

endmodule
