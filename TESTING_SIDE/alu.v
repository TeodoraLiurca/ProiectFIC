`include "alu_parts.v"
`include "3x8_decoder.v"

module alu #(parameter SIZE=8)(input [2:0]opcode,
input cin,
input [SIZE-1:0] a, b,
output a_larger,
output equal,
output zero,
output cout,
output [SIZE-1:0] c);

wire [7:0] enable;

wire [SIZE-1:0] comp_out;
wire [SIZE-1:0] xor_out;
wire [SIZE-1:0] or_out;
wire [SIZE-1:0] and_out;
wire [SIZE-1:0] not_out;
wire [SIZE-1:0] shl_out;
wire [SIZE-1:0] shr_out;
wire [SIZE-1:0] sum_out;

wire shl_cout;
wire shr_cout;
wire add_cout;

decoder_3x8 dec(.A(opcode), .Y(enable));

comparator #(.SIZE(SIZE)) comp_op(.a(a), .b(b), .c(comp_out), .a_larger(a_larger), .equal(equal));
xorer #(.SIZE(SIZE)) xor_op (.in1(a), .in2(b), .out(xor_out));
orer #(.SIZE(SIZE)) or_op (.in1(a), .in2(b), .out(or_out));
ander #(.SIZE(SIZE)) and_op (.in1(a), .in2(b), .out(and_out));
notter #(.SIZE(SIZE)) not_op (.in(a), .out(not_out));
lshift_register #(.SIZE(SIZE)) shl_op (.sh_in(cin), .set1(1'b1), .en1(1'b1), .set2(1'b1), .en2(1'b1), .in(a), .out(shl_out), .sh_out(shl_cout));
rshift_register #(.SIZE(SIZE)) shr_op (.sh_in(cin), .set1(1'b1), .en1(1'b1), .set2(1'b1), .en2(1'b1), .in(a), .out(shr_out), .sh_out(shr_cout));
full_adder #(.SIZE(SIZE)) add_op (.in1(a), .in2(b), .out(sum_out), .cout(add_cout)); 

enabler #(.WIDTH(SIZE)) com_en(.in(comp_out), .en(enable[7]), .out(c));
enabler #(.WIDTH(SIZE)) xor_en(.in(xor_out), .en(enable[6]), .out(c));
enabler #(.WIDTH(SIZE)) or_en(.in(or_out), .en(enable[5]), .out(c));
enabler #(.WIDTH(SIZE)) and_en(.in(and_out), .en(enable[4]), .out(c));
enabler #(.WIDTH(SIZE)) not_en(.in(not_out), .en(enable[3]), .out(c));
enabler #(.WIDTH(SIZE)) shl_en(.in(shl_out), .en(enable[2]), .out(c));
enabler #(.WIDTH(SIZE)) shr_en(.in(shr_out), .en(enable[1]), .out(c));
enabler #(.WIDTH(SIZE)) add_en(.in(sum_out), .en(enable[0]), .out(c));

enabler #(.WIDTH(1)) add_cout_en(.in(add_cout), .en(enable[0]), .out(cout));
enabler #(.WIDTH(1)) shl_cout_en(.in(shl_cout), .en(enable[2]), .out(cout));
enabler #(.WIDTH(1)) shr_cout_en(.in(shr_cout), .en(enable[1]), .out(cout));

endmodule
