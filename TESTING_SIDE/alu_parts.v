`include "register.v"
module full_adder_cell (	input 	a, b, cin,
						output 	sum, cout);

	assign sum  = (a ^ b) ^ cin;
	assign cout = (a & b) | ((a ^ b) & cin);
endmodule

module full_adder #(parameter  SIZE = 8)(input [SIZE-1:0]in1, in2, output [SIZE-1:0]out, output cout);
    
    wire [SIZE-1:0] tmp;

    full_adder_cell f1(.a(in1[0]), .b(in2[0]), .cin(1'b0), .sum(out[0]), .cout(tmp[0]));
    generate
        genvar i;
        for(i=1; i<SIZE;i=i+1)begin
            full_adder_cell f1(.a(in1[i]), .b(in2[i]), .cin(tmp[i-1]), .sum(out[i]), .cout(tmp[i]));
        end
    endgenerate

    assign cout = tmp[7];
endmodule

module ander #(parameter SIZE=8)(input [SIZE-1:0]in1, input [SIZE-1:0] in2, output[SIZE-1:0] out);

    generate
        genvar i;
        for(i=0; i<SIZE; i=i+1)begin
            assign out[i] = in1[i]&in2[i];
        end
    endgenerate

endmodule

module comparator_cell (input a,b, above_equal, a_larger_above, output c, eq_sf, a_larger);
   assign c = a^b;
   assign eq_sf= ~c&above_equal;
   assign a_larger = (c&above_equal&a) | a_larger_above;
endmodule


module comparator #(parameter SIZE=8)(input [SIZE-1:0]a,b, output[SIZE-1:0]c, output a_larger, equal);
    wire [SIZE-1:0] all_above_equal, all_a_larger;
    comparator_cell comp(
      .a(a[SIZE-1]), 
      .b(b[SIZE-1]), 
      .above_equal(1'b1),
      .a_larger_above(1'b0), 
      .eq_sf(all_above_equal[SIZE-1]), 
      .a_larger(all_a_larger[SIZE-1]), 
      .c(c[SIZE-1]));

    generate
        genvar i;
        for(i=SIZE-2; i>=0; i=i-1)begin
            comparator_cell comp(
              .a(a[i]),
              .b(b[i]), 
              .above_equal(all_above_equal[i+1]),
              .a_larger_above(all_a_larger[i+1]),
              .eq_sf(all_above_equal[i]),
              .a_larger(all_a_larger[i]),
              .c(c[i]));
        end
    endgenerate
    assign a_larger = all_a_larger[0];
    assign equal = all_above_equal[0]; 
endmodule

module lshift_register #(parameter SIZE = 8)(
    input sh_in,
    input set1, en1,
    input set2, en2,
    input [SIZE-1:0] in,
    output [SIZE-1:0] out,
    output sh_out
);
    wire [SIZE-2:0] tmp;

    register #(.WIDTH(8)) r1(.in(in), .out({sh_out, tmp}), .en(en1), .set(set1));
    register #(.WIDTH(8)) r2(.in({tmp, sh_in}), .out(out), .en(en2), .set(set2));

endmodule

module notter #(parameter SIZE = 8)(input [SIZE-1:0] in, output [SIZE-1:0]out);

    
  assign out=~in;

endmodule

module orer #(parameter SIZE=8)(input [SIZE-1:0]in1, input [SIZE-1:0] in2, output[SIZE-1:0] out);

    generate
        genvar i;
        for(i=0; i<SIZE; i=i+1)begin
            assign out[i] = in1[i]|in2[i];
        end
    endgenerate

endmodule

module xorer #(parameter SIZE=8)(input [SIZE-1:0]in1, input [SIZE-1:0] in2, output[SIZE-1:0] out);

    generate
        genvar i;
        for(i=0; i<SIZE; i=i+1)begin
            assign out[i] = in1[i]^in2[i];
        end
    endgenerate

endmodule

module rshift_register #(parameter SIZE = 8)(
    input sh_in,
    input set1, en1,
    input set2, en2,
    input [SIZE-1:0] in,
    output [SIZE-1:0] out,
    output sh_out
);
    wire [SIZE-2:0] tmp;

    // Create a shift register with a right shift operation
    register #(.WIDTH(8)) r1(.in(in), .out({sh_out, tmp}), .en(en1), .set(set1));
    register #(.WIDTH(8)) r2(.in({tmp, sh_in}), .out(out), .en(en2), .set(set2));

endmodule