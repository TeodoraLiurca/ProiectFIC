`include "register.v"
`include "4x16_decoder.v"

module random_access_memory #(parameter SIZE = 16, parameter MAR_SIZE = 8)
(input [MAR_SIZE-1:0] address, 
input set_address, 
input set, enable,
input [SIZE-1:0]data_in,
output [SIZE-1:0]data_out);

    wire [MAR_SIZE-1:0] to_dec;
    wire [SIZE-1:0] column, row;

    register #(.WIDTH(MAR_SIZE)) memory_address_register (.in(address), .set(set_address), .en(1'b1), .out(to_dec));
    decoder_4x16 dec1 (.A(to_dec[3:0]), .Y(column));
    decoder_4x16 dec2 (.A(to_dec[7:4]), .Y(row));

    genvar i, j;
    generate
        for(i= 0; i< SIZE; i= i+1) begin
          for(j= 0; j< SIZE; j= j+1)begin
            register #(.WIDTH(SIZE)) this_register( .in(data_in), .set(row[i]&column[j]&set), .en(row[i]&column[j]&enable), .out(data_out));
          end
        end
    endgenerate
    
endmodule
