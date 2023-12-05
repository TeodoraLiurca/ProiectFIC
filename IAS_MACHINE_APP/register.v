`include "memory_cell.v"

module enabler(input [7:0] in, input en, output[7:0] out);
  generate 
      genvar i;
      for(i=0; i<8; i=i+1)begin
        assign out[i] = in[i] & en ;
      end
  endgenerate
endmodule

module register(input [7:0]in, input en, set, output[7:0] out);
  wire[7:0] temp;
  byte_memory_cell this_cell(.in(in), .set(set), .out(temp));
  enabler this_enabler(.in(temp), .en(en), .out(out));
endmodule
