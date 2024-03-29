module decoder_3x8(input [2:0]A, output [7:0]Y);
    assign Y[0] = (~A[0])&(~A[1])&(~A[2]);
    assign Y[1] = (A[0])&(~A[1])&(~A[2]);
    assign Y[2] = (~A[0])&(A[1])&(~A[2]);
    assign Y[3] = (A[0])&(A[1])&(~A[2]);
    assign Y[4] = (~A[0])&(~A[1])&(A[2]);
    assign Y[5] = (A[0])&(~A[1])&(A[2]);
    assign Y[6] = (~A[0])&(A[1])&(A[2]);
    assign Y[7] = (A[0])&(A[1])&(A[2]);
endmodule

module decoder_4x16(input [3:0]A, output [15:0]Y);
    assign Y[0] = (~A[0])&(~A[1])&(~A[2])&(~A[3]);
    assign Y[1] = (A[0])&(~A[1])&(~A[2])&(~A[3]);
    assign Y[2] = (~A[0])&(A[1])&(~A[2])&(~A[3]);
    assign Y[3] = (A[0])&(A[1])&(~A[2])&(~A[3]);
    assign Y[4] = (~A[0])&(~A[1])&(A[2])&(~A[3]);
    assign Y[5] = (A[0])&(~A[1])&(A[2])&(~A[3]);
    assign Y[6] = (~A[0])&(A[1])&(A[2])&(~A[3]);
    assign Y[7] = (A[0])&(A[1])&(A[2])&(~A[3]);
    assign Y[8] = (~A[0])&(~A[1])&(~A[2])&(A[3]);
    assign Y[9] = (A[0])&(~A[1])&(~A[2])&(A[3]);
    assign Y[10] = (~A[0])&(A[1])&(~A[2])&(A[3]);
    assign Y[11] = (A[0])&(A[1])&(~A[2])&(A[3]);
    assign Y[12] = (~A[0])&(~A[1])&(A[2])&(A[3]);
    assign Y[13] = (A[0])&(~A[1])&(A[2])&(A[3]);
    assign Y[14] = (~A[0])&(A[1])&(A[2])&(A[3]);
    assign Y[15] = (A[0])&(A[1])&(A[2])&(A[3]);
endmodule

