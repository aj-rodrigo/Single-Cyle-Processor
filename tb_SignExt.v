`timescale 1ns / 1ps

module tb_SignExt();

parameter AWL = 16, WL = 32;

reg signed [AWL-1:0] Imm;
wire signed [WL-1:0] SImm;

SignExt #(.AWL(AWL), .WL(WL)) S00 (.Imm(Imm), .SImm(SImm));

initial begin
    #10 Imm = 16'b0100100111011001;
    #10 Imm = 16'b1100100111011001;
    #5 $finish;
end

endmodule
