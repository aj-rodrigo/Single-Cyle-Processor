`timescale 1ns / 1ps

module tb_MUX();

parameter WL = 32;

reg SEL;
reg [WL-1:0] Din0, Din1;
wire [WL-1:0] Dout;

MUX #(.WL(WL)) M00 (.SEL(SEL), .Din0(Din0), .Din1(Din1), .Dout(Dout));

initial begin
    #10 SEL = 0;
    #10 Din0 = 27; Din1 = 1001;
    #5 SEL = 1;
    #5 Din0 = 123; Din1 = 69;
    #10 SEL = 0;
    #10 $finish;
end

endmodule
