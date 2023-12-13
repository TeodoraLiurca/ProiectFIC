`include "register.v"
module testbench;
  // Parameters
  parameter WIDTH = 16;

  // Signals
  reg [WIDTH-1:0] in_data;
  reg en;
  reg set;
  wire [WIDTH-1:0] out_data;

  // Instantiate the module under test
  register #(WIDTH) dut (
    .in(in_data),
    .en(en),
    .set(set),
    .out(out_data)
  );

  // Initial block for stimulus generation
  initial begin
    // Initialize inputs
    in_data = 16'b0;
    en = 0;
    set = 0;

    // Apply stimulus
    #10;
    in_data = 16'hABCD; // Change input data
    en = 1; // Enable the register
    set = 1; // Set the register

    #10;
    en = 0; // Disable the register
    set = 0; // Clear the set signal

    #10;
    // Add more test scenarios as needed

    // Add a delay to observe the output
    #10;
    $stop; // Stop simulation
  end

  // Display results
  initial begin
    $monitor("Time=%0t in=%h en=%b set=%b out=%h", $time, in_data, en, set, out_data);
  end
endmodule

