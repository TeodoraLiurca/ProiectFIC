`include "4x16_decoder.v"
module decoder_tb;

reg [3:0] data_in;
wire [15:0] data_out;

decoder_4x16 dec (
    .A(data_in),
    .Y(data_out)
);

initial begin 
    //Initialize inputs
    data_in = 4'b0000;

    #10

    data_in = 4'b0001;

    #10

    data_in = 4'b0010;

    #10

    data_in = 4'b0011;

    #10

    data_in = 4'b0100;

    #10

    data_in = 4'b0101;

    #10

    data_in = 4'b0110;

    #10

    data_in = 4'b0111;

    #10

    data_in = 4'b1000;

    #10

    data_in = 4'b1001;

    #10

    data_in = 4'b1010;

    #10

    data_in = 4'b1011;

    #10

    data_in = 4'b1100;

    #10

    data_in = 4'b1101;

    #10

    data_in = 4'b1110;

    #10

    data_in = 4'b1111;

end

  initial begin
    $monitor("Time=%0t \t\t data_in=%b data_out=%b", $time, data_in, data_out);
  end
endmodule