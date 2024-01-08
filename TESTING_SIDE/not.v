module notter #(parameter SIZE = 8)(input [SIZE-1:0] in, output [SIZE-1:0]out);

    
  assign out=~in;

endmodule