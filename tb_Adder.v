`timescale 1ns / 1ps

module tb_Adder();

parameter WL = 32;

reg signed [WL-1:0] Addin1, Addin2;
wire signed [WL:0] Addout;

Adder #(.WL(WL)) A00 (.Addin1(Addin1), .Addin2(Addin2), .Addout(Addout));

initial begin
    #10 Addin1 = 56; Addin2 = 100;
    #10 Addin1 = -56; Addin2 = 100;
    #5 $finish;
end 

endmodule
