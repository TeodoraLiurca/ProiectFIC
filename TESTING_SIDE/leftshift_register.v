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