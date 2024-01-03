`include "memory_unit_ram.v"
`timescale 1ns/1ns

module ram_testbench;

  // Parameters
  parameter SIZE = 8;

  // Inputs
  reg [SIZE-1:0] address;
  reg set_address, set, enable;
  reg [SIZE-1:0] data_in;

  // Outputs
  wire [SIZE-1:0] data_out;

  // Instantiate the random_access_memory module
  random_access_memory #(SIZE) my_ram (
    .address(address),
    .set_address(set_address),
    .set(set),
    .enable(enable),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Initial block for testbench stimulus
  initial begin
    // Initialize inputs
    address = 0;
    set_address = 0;
    set = 0;
    enable = 0;
    data_in = 8'b10101010;

    // Apply some test cases
    #10 address = 3; set_address = 1; set = 1; enable = 1; // Write data_in to address 3
    #10 address = 5; set_address = 1; set = 1; enable = 1; // Write data_in to address 5
    #10 address = 2; set_address = 1; set = 1; enable = 1; // Write data_in to address 2
    #10 address = 3; set_address = 0; set = 0; enable = 1; // Read data from address 3

    // Add more test cases as needed

    // Monitor outputs
    $monitor("Time=%0t address=%h set_address=%b set=%b enable=%b data_in=%h data_out=%h",
             $time, address, set_address, set, enable, data_in, data_out);

    // Stop simulation after a certain duration
  end

endmodule
