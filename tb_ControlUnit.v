`timescale 1ns / 1ps

module tb_ControlUnit();

reg [5:0] Opcode, funct;
wire MtoRFSel, DMWE, Branch, ALUInSel, RFDSel, RFWE;
wire [3:0] ALUsel;

ControlUnit CU0 (.Opcode(Opcode), .funct(funct), .MtoRFSel(MtoRFSel), .DMWE(DMWE), .Branch(Branch), .ALUInSel(ALUInSel), .RFDSel(RFDSel), .RFWE(RFWE), .ALUsel(ALUsel));

initial begin
    #10 Opcode = 0; funct = 6'b100000;
    #10 Opcode = 35; 
    #10 Opcode = 43; 
    #10 Opcode = 4; 
    #10 Opcode = 0; funct = 6'b100100;
    #10 Opcode = 0; funct = 6'b100101;
    #10 Opcode = 0; funct = 6'b101010;
    #10 Opcode = 0; funct = 6'b100010;
    #10 $finish;
end

endmodule

