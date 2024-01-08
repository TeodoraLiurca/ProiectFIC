`include "xor.v"

module Testbench;

  reg [7:0] input1, input2;
  wire [7:0] out;

  // Instantiate the ander module with SIZE parameter set to 8
  xorer #(8) uut (
    .in1(input1),
    .in2(input2),
    .out(out)
  );

  // Stimulus generation
  initial begin
    // Apply input data
    input1 = 8'b10101010;
    input2 = 8'b11001100;

    // Display inputs
    #1
    $display("Input1: %b, Input2: %b, Output: %b", input1, input2, out);

    // Add a delay to observe the output
    
    input1 = 8'b11111111;
    input2 = 8'b00000000;

    #1
    $display("Input1: %b, Input2: %b, Output: %b", input1, input2, out);

    #100 $finish;
  end

endmodule
