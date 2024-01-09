`include "comparator.v"
module Testbench;

  reg [7:0] a, b;
  wire [7:0] c;
  wire a_larger, equal;

  // Instantiate the comparator module with SIZE parameter set to 8
  comparator #(8) uut (
    .a(a),
    .b(b),
    .c(c),
    .a_larger(a_larger),
    .equal(equal)
  );

  // Stimulus generation
  initial begin
    // Test Case 1
    a = 8'b11011010;
    b = 8'b10100101;
    #10;

    // Test Case 2
    a = 8'b10101010;
    b = 8'b10101010;
    #10;

    // Test Case 3
    a = 8'b00110011;
    b = 8'b01010101;
    #10;

    // Test Case 4
    a = 8'b11111111;
    b = 8'b00000000;
    #10;

    // Test Case 5
    a = 8'b01010101;
    b = 8'b11001100;
    #10;

    // Terminate simulation
    $finish;
  end

  initial begin
    $monitor("Test Case :a=%d,  b=%d a > b: %b, a == b: %b, c: %b",a, b, a_larger, equal, c);
  end

endmodule
