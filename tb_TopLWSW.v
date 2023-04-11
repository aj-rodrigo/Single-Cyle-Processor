`timescale 1ns / 1ps

module tb_TopLWSW();

reg CLK, RST;

TopLWSW DUT (.CLK(CLK), .RST(RST));

initial CLK = 0;
initial RST = 1;
always #5 CLK = ~CLK;

initial begin
    #10 RST = 0;
    #500;
    #10 $finish;
end

endmodule
