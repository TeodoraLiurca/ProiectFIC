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