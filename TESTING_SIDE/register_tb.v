`include "register.v"


module testbench;
  // Parameters
  parameter WIDTH = 16;

  reg [WIDTH-1:0] in_data;
  reg en;
  reg set;
  wire [WIDTH-1:0] out_data;

  register #(WIDTH) dut (
    .in(in_data),
    .en(en),
    .set(set),
    .out(out_data)
  );

  initial begin
    // Initialize inputs
    in_data = 16'b0;
    en = 0;
    set = 0;

    #10;
    in_data = 16'hABCD;
    en = 1; 
    set = 1; 

    #10;
    en = 0; // Disable the register
    set = 0; // Clear the set signal

    #10;

    in_data = 16'hFFFF;
    en = 0;
    set = 1;

    #10;
    in_data = 16'hAAAA;
    en = 1;
    set = 0;

    #10;
  end

  // Display results
  initial begin
    $monitor("Time=%0t in=%h en=%b set=%b out=%h", $time, in_data, en, set, out_data);
  end
endmodule

