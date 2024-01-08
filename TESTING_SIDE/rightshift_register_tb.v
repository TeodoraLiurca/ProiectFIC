`include "rightshift_register.v"

module tb_rshift_register;
    reg sh_in, set1, en1, set2, en2;
    reg [7:0] in;
    wire [7:0] out;
    wire sh_out;

    rshift_register #(8) dut (
        .sh_in(sh_in),
        .set1(set1),
        .en1(en1),
        .set2(set2),
        .en2(en2),
        .in(in),
        .out(out),
        .sh_out(sh_out)
    );

    initial begin
        $monitor("Time=%0t sh_in=%b set1=%b en1=%b set2=%b en2=%b in=%b out=%b sh_out=%b",
                 $time, sh_in, set1, en1, set2, en2, in, out, sh_out);

        // Test case 1
        sh_in = 1; set1 = 1; en1 = 1; set2 = 1; en2 = 1; in = 8'h55;
        #10;

        // Test case 2
        sh_in = 1; set1 = 1; en1 = 1; set2 = 1; en2 = 1; in = 8'hAA;
        #10;

        // Add more test cases as needed

        #100 $finish;
    end
endmodule
