`include "register.v"
module testbench;
  // Parameters
  parameter WIDTH = 16;

  reg [WIDTH-1:0] in1_data;
  reg [WIDTH-1:0] in2_data;
  reg en1, en2;
  reg set1, set2;
  wire [WIDTH-1:0] out_data;

  register #(WIDTH) dut1 (
    .in(in1_data),
    .en(en1),
    .set(set1),
    .out(out_data)
  );
  register #(WIDTH) dut2 (
    .in(in2_data),
    .en(en2),
    .set(set2),
    .out(out_data)
  );


  initial begin
    // Initialize inputs
    in1_data = 16'b0;
    en1 = 0;
    set1 = 0;

    in2_data = 16'b0;
    en2 = 0;
    set2 = 0;

    #10;
    in1_data = 16'hABCD;
    en1 = 1; 
    set1 = 1; 

    in2_data = 16'b0;
    en2 = 0;
    set2 = 0;

    #10;
    en1 = 0; 
    set1 = 0; 

    en2 = 0;
    set2 = 0;

    #10;

    in1_data = 16'hFFFF;
    en1 = 0;
    set1 = 1;

    in2_data = 16'hCCCC;
    en2 = 1;
    set2 = 1;

    #10;
    in1_data = 16'hAAAA;
    en1 = 1;
    set1 = 0;

    #10;
  end

  // Display results
  initial begin
    $monitor("Time=%0t in1=%h en1=%b set1=%b out=%h \n\tin2=%h en2=%b set2=%b out=%h",
      $time, in1_data, en1, set1, out_data, in2_data, en2, set2, out_data );
  end
endmodule

