module or #(parameter SIZE=8)(input [SIZE-1:0]in1, input [SIZE-1:0] in2, output[SIZE-1:0] out);

    generate
        genvar i;
        for(i=0; i<SIZE; i=i+1)begin
            assign out[i] = in1[i]|in2[i];
        end
    endgenerate

endmodule