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
    data_in = 0000;

    #10

    data_in = 0001;

    #10

    data_in = 0010;

    #10

    data_in = 0011;

    #10

    data_in = 0100;

    #10

    data_in = 0101;

    #10

    data_in = 0110;

    #10

    data_in = 0111;

    #10

    data_in = 1000;

    #10

    data_in = 1001;

    #10

    data_in = 1010;

    #10

    data_in = 1011;

    #10

    data_in = 1100;

    #10

    data_in = 1101;

    #10

    data_in = 1110;

    #10

    data_in = 1111;

end

  initial begin
    $monitor("Time=%0t data_in=%b data_out=%b", $time, data_in, data_out);
  end
endmodule