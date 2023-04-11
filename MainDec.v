`timescale 1ns / 1ps

module MainDec(Opcode, MtoRFSel, DMWE, Branch, ALUInSel, RFDSel, RFWE, ALUOp);

input [5:0] Opcode;
output MtoRFSel, DMWE, Branch, ALUInSel, RFDSel, RFWE;
output [1:0] ALUOp;

endmodule
