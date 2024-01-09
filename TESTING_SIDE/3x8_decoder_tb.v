`include "3x8_decoder.v"


module testbench;

  reg [2:0] A;
  wire [7:0] Y;

  // Instantiate the decoder_3x8 module
  decoder_3x8 uut (
    .A(A),
    .Y(Y)
  );

  // Stimulus generation
  initial begin
    // Test Case 1
    A = 3'b000;
    #10;
    $display("Input: %b, Output: %b", A, Y);

    // Test Case 2
    A = 3'b101;
    #10;
    $display("Input: %b, Output: %b", A, Y);

    // Test Case 3
    A = 3'b010;
    #10;
    $display("Input: %b, Output: %b", A, Y);

    // Add more test cases as needed

    // Terminate simulation
    $finish;
  end

endmodule
