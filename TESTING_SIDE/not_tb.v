`include "not.v"
module Testbench;

  reg [7:0] input_data;
  wire [7:0] output_data;

  // Instantiate the notter module with SIZE parameter set to 8
  notter #(8) uut (
    .in(input_data),
    .out(output_data)
  );

  // Stimulus generation
  initial begin
    // Apply input data
    input_data = 8'b10101010;
    #1;
    // Display initial state
    $display("Input: %b, Output: %b", input_data, output_data);

    // Add a delay to observe the output
    #10;

    // Change input data
    input_data = 8'b11001100;
    #1;
    // Display updated state
    $display("Input: %b, Output: %b", input_data, output_data);

    // Add a delay to observe the final output
    #10;

    // Terminate simulation
    $finish;
  end

endmodule
