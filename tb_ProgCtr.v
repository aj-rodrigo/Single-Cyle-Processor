`timescale 1ns / 1ps

module tb_ProgCtr ();

parameter WL = 32;

reg CLK, RST, EN;
reg [WL-1:0] PCIn;
wire [WL-1:0] PCOut;

ProgCtr #(.WL(WL)) PC0 (.CLK(CLK), .RST(RST), .EN(EN), .PCIn(PCIn), .PCOut(PCOut));

initial CLK = 0;

always #5 CLK = ~CLK;

initial begin
    RST = 1;
    #10 RST = 0; PCIn = 192;
    #5 EN = 1; 
    #5 $finish;
end

endmodule
