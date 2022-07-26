`timescale 1ns / 1ps

module tb_CarryLookaheadAdder();

parameter DWL = 4;
reg [DWL-1:0] a, b;
wire [DWL:0] s;
wire cout;

CarryLookaheadAdder #(.DWL(DWL)) 
                    DUT (.a(a), .b(b), .s(s), .cout(cout));
                    
    initial begin : TestVectorGenerator
        a = 4'b0000; b = 4'b0000;
        #100
        a = 4'b1111; b = 4'b1111;
        #100
        a = 4'b1110; b = 4'b0111;
        #100
        a = 4'b1010; b = 4'b0101;
        #100
        a = 4'b1000; b = 4'b1000;
        #100
        $finish;
    end

endmodule
