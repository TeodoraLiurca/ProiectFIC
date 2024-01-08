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