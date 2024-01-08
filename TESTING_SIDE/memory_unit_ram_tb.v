`include "memory_unit_ram.v"
`timescale 1ns/1ns

module ram_testbench;

  // Parameters
  parameter SIZE = 16;
  parameter MAR_SIZE = 8;

  // Inputs
  reg [MAR_SIZE-1:0] address;
  reg set_address, set, enable;
  reg [SIZE-1:0] data_in;

  // Outputs
  wire [SIZE-1:0] data_out;

  // Instantiate the random_access_memory module
  random_access_memory #(SIZE, MAR_SIZE) my_ram (
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
    data_in = 16'b1010101010101010;

    // Apply some test cases
    #10 address = 0; set_address = 1; set = 1; enable = 0; data_in=16'hABCD;// Write data_in to address 0
    #10 address = 0; set_address = 1; set = 0; enable = 1; // Outputdata address 0

    #10 address = 1; set_address = 1; set = 1; enable = 0; // Write data_in to address 3
    #10 address = 1; set_address = 1; set = 0; enable = 1; // Outputdata address 3
    
    #10 address = 2; set_address = 1; set = 1; enable = 0; data_in=16'hFFFF;// Write data_in to address 3
    #10 address = 2; set_address = 1; set = 0; enable = 1; // Outputdata address 3

    #10 address = 3; set_address = 1; set = 1; enable = 0; data_in=16'h0000;// Write data_in to address 3
    #10 address = 3; set_address = 1; set = 0; enable = 1; // Outputdata address 3

    #10 address = 4; set_address = 1; set = 1; enable = 0; // Write data_in to address 3
    #10 address = 4; set_address = 1; set = 0; enable = 1; // Outputdata address 3

    #10 address = 0; set_address = 1; set = 0aa; enable = 1;
    #10 address = 1; set_address = 1; set = 0; enable = 1;


    // Add more test cases as needed

    // Stop simulation after a certain duration
    #100 $finish;
  end

    initial begin
    $monitor("Time=%10t address=%d data_in=%b data_out=%b", $time, address, data_in, data_out);
  end

endmodule
