`timescale 1ns / 1ps

module ProgCtr #(parameter WL = 32) (CLK, RST, PCIn, PCOut);

input CLK, RST;
input [WL-1:0] PCIn;
output reg [WL-1:0] PCOut;

initial PCOut <= 0;

always @(posedge CLK) begin
    if(RST == 1) PCOut <= 0;
    else begin
        PCOut <= PCIn;
    end
end  

endmodule
