module memory_cell(input in, set, output out);
  wire a, b, c;
  assign a = ~(in&set);
  assign b = ~(a&set);
  assign out = ~(a&c);
  assign c = ~(b&out);
endmodule

module byte_memory_cell #(parameter WIDTH = 16)(input [WIDTH-1:0] in, input set, output [WIDTH-1:0] out);
  
  generate
    genvar i;
    for(i = 0 ; i < WIDTH ; i=i+1)begin
      memory_cell this_memory_cell(.in(in[i]), .set(set), .out(out[i]));
    end
  endgenerate

endmodule
