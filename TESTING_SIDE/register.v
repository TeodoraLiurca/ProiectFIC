`include "memory_cell.v"

module enabler #(parameter WIDTH = 16)(input [WIDTH-1:0] in, input en, output[WIDTH-1:0] out);
  generate 
      genvar i;
      for(i=0; i<WIDTH; i=i+1)begin
        assign out[i] = en?in[i]:1'bz;
      end
  endgenerate
endmodule

module register #(parameter WIDTH = 16)(input [WIDTH-1:0]in, input en, set, output[WIDTH-1:0] out);
  wire[WIDTH-1:0] temp;
  byte_memory_cell this_cell(.in(in), .set(set), .out(temp));
  enabler this_enabler(.in(temp), .en(en), .out(out));
endmodule
