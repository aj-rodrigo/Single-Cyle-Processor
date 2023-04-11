`timescale 1ns / 1ps

module TopLWSW (CLK, RST);

input CLK, RST;

wire [5:0] OPcode2, Func2;
wire [4:0] RS2, RT2, RD2, shamt3;
wire [15:0] Imm3;
wire [25:0] Jumpt3;
wire [4:0] Dout2;
wire [31:0] RFRD11, RFRD22, Dout3, ALUOut2, DMRD2, Dout4;
wire MtoRFSel2, DMWE3, Branch2, ALUInSel2, RFDSel2, RFWE3, Zero2, Jump2;
wire [4:0] ALUsel3;
wire [31:0] SImm2, Dout5, PCOut2, Dout6, Instr2;
wire [31:0] PCBranch, PCp1;

MUX #(.WL(32)) MX3 (.SEL(Branch2&Zero2), .Din0(PCp1), .Din1(PCBranch), .Dout(Dout6));
MUX #(.WL(32)) MX4 (.SEL(Jump2), .Din0(Dout6), .Din1({PCOut2[31:26],Jumpt3}), .Dout(Dout5));
ProgCtr #(.WL(32)) PC0 (.CLK(CLK), .RST(RST), .PCIn(Dout5), .PCOut(PCOut2));
Adder #(.WL(32)) AA0 (.Addin1(PCOut2), .Addin2(1), .Addout(PCp1));
Adder #(.WL(32)) AA1 (.Addin1(SImm2), .Addin2(PCp1), .Addout(PCBranch));
InstrMem #(.AWL(8), .WL(32)) IM0 (.IMA(PCOut2), .IMRD(Instr2));       
InstrDec #(.WL(32)) ID0 (.Instr(Instr2), .OPcode(OPcode2), .Func(Func2), .RS(RS2), .RT(RT2), .RD(RD2), .shamt(shamt3), .Imm(Imm3), .Jumpt(Jumpt3));
ControlUnit CU0(.Opcode3(OPcode2), .funct(Func2), .MtoRFSel(MtoRFSel2), .DMWE2(DMWE3), .Branch(Branch2), .ALUInSel(ALUInSel2), .RFDSel(RFDSel2), .RFWE2(RFWE3), .Jump(Jump2), .ALUsel2(ALUsel3));
MUX #(.WL(5)) MX0 (.SEL(RFDSel2), .Din0(RT2), .Din1(RD2), .Dout(Dout2));
RegFile #(.AWL(5), .WL(32)) RF0 (.CLK(CLK), .RFWE(RFWE3), .RFR1(RS2), .RFR2(RT2), .RFWA(Dout2), .RFWD(Dout4), .RFRD1(RFRD11), .RFRD2(RFRD22));
SignExt #(.AWL(16), .WL(32)) SE0 (.Imm2(Imm3), .SImm(SImm2));
MUX #(.WL(32)) MX1 (.SEL(ALUInSel2), .Din0(RFRD22), .Din1(SImm2), .Dout(Dout3));
ALU #(.WL(32)) A00 (.ALUsel(ALUsel3), .ALUIn1(RFRD11), .ALUIn2(Dout3), .shamt2(shamt3), .Zero(Zero2), .ALUOut(ALUOut2));
DataMem #(.AWL(9), .WL(32)) DM0(.CLK(CLK), .DMWE(DMWE3), .DMA(ALUOut2), .DMWD(RFRD22), .DMRD(DMRD2));
MUX #(.WL(32)) MX2 (.SEL(MtoRFSel2), .Din0(ALUOut2), .Din1(DMRD2), .Dout(Dout4));

endmodule
