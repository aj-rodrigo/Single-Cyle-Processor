`timescale 1ns / 1ps

module tb_InstrDec();

parameter WL = 32;

reg [WL-1:0] Instr;
wire [5:0] OPcode, Func;
wire [4:0] RS, RT, RD, shamt;
wire [15:0] Imm;
wire [25:0] Jumpt;

InstrDec #(.WL(WL)) I00 (.Instr(Instr), .OPcode(OPcode), .Func(Func), .RS(RS), .RT(RT), .RD(RD), .shamt(shamt), .Imm(Imm), .Jumpt(Jumpt));

initial begin
    #10 Instr = 32'b10001010101010011010101100011010;
    #50 $finish;
end

endmodule
