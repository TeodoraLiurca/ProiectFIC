`include "register.v"

module stepper #(parameter SIZE = 8)(input clk, input rst, output [SIZE-1:0]steps);
    
    wire tmp[11:0];
    register #(.WIDTH(1)) M1(.in(~rst), .set(rst|~clk), .en(1'b1), .out(tmp[0]));
    register #(.WIDTH(1)) M2(.in(tmp[0]), .set(rst|clk), .en(1'b1), .out(tmp[1]));
    register #(.WIDTH(1)) M3(.in(tmp[1]), .set(rst|~clk), .en(1'b1), .out(tmp[2]));
    register #(.WIDTH(1)) M4(.in(tmp[2]), .set(rst|clk), .en(1'b1), .out(tmp[3]));
    register #(.WIDTH(1)) M5(.in(tmp[3]), .set(rst|~clk), .en(1'b1), .out(tmp[4]));
    register #(.WIDTH(1)) M6(.in(tmp[4]), .set(rst|clk), .en(1'b1), .out(tmp[5]));
    register #(.WIDTH(1)) M7(.in(tmp[5]), .set(rst|~clk), .en(1'b1), .out(tmp[6]));
    register #(.WIDTH(1)) M8(.in(tmp[6]), .set(rst|clk), .en(1'b1), .out(tmp[7]));
    register #(.WIDTH(1)) M9(.in(tmp[7]), .set(rst|~clk), .en(1'b1), .out(tmp[8]));
    register #(.WIDTH(1)) M10(.in(tmp[8]), .set(rst|clk), .en(1'b1), .out(tmp[9]));
    register #(.WIDTH(1)) M11(.in(tmp[9]), .set(rst|~clk), .en(1'b1), .out(tmp[10]));
    register #(.WIDTH(1)) M12(.in(tmp[10]), .set(rst|clk), .en(1'b1), .out(tmp[11]));

    assign steps[6] = tmp[11];
    assign steps[5] = tmp[9] & ~tmp[11];
    assign steps[4] = tmp[7] & ~tmp[9];
    assign steps[3] = tmp[5] & ~tmp[7];
    assign steps[2] = tmp[3] & ~tmp[5];
    assign steps[1] = tmp[1] & ~tmp[3];
    assign steps[0] = rst | ~tmp[1];
    
    
    
endmodule