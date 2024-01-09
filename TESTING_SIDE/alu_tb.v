`include "alu.v"
`timescale 1ns / 1ps

module alu_testbench;

  reg [2:0] opcode;
  reg cin;
  reg [7:0] a, b;
  wire a_larger, equal, zero, cout;
  wire [7:0] c;

  // Instantiate the ALU module
  alu #(8) uut (
    .opcode(opcode),
    .cin(cin),
    .a(a),
    .b(b),
    .a_larger(a_larger),
    .equal(equal),
    .zero(zero),
    .cout(cout),
    .c(c)
  );

  // Stimulus generation
  initial begin
    // Test Case 1
    opcode = 3'b000; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 2 (add more test cases as needed)

    opcode = 3'b001; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;

    // Test Case 3 (add more test cases as needed)

    opcode = 3'b010; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 4 (add more test cases as needed)

    opcode = 3'b011; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 5 (add more test cases as needed)

    opcode = 3'b100; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 6 (add more test cases as needed)

    opcode = 3'b101; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 2 (add more test cases as needed)

    opcode = 3'b110; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 2 (add more test cases as needed)

    opcode = 3'b111; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 2 (add more test cases as needed)

    opcode = 3'b000; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;


    // Test Case 7 (add more test cases as needed)

    opcode = 3'b001; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101010;
    b = 8'b11001100;
    #10;



    // Test Case 8 (add more test cases as needed)

    opcode = 3'b111; // Assuming opcode 000 corresponds to addition
    cin = 0;
    a = 8'b10101011;
    b = 8'b10101010;
    #10;

    // Terminate simulation
    $finish;
  end

  initial begin
    $monitor("a=%d b=%d opcode=%d cin=%d c=%b cout=%b, a_larger=%b, equal=%b,", a, b, opcode, cin, c, cout, a_larger, equal);
  end

endmodule
