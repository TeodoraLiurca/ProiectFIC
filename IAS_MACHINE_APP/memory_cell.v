module memory_cell(input in, set, output out);
  wire a, b, c;
  assign a = ~(in&set);
  assign b = ~(a&set);
  assign o = ~(a&c);
  assign c = ~(b&o);
endmodule

module byte_memory_cell(input [7:0] in, input set, output [7:0] out);
  
  generate
    genvar i;
    for(i = 0 ; i < 8 ; i=i+1)begin
      memory_cell this_memory_cell(.in(in[i]), .set(set), .out(out[i]));
    end
  endgenerate

endmodule
