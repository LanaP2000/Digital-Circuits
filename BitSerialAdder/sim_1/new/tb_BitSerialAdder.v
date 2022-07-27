`timescale 1ns / 1ps

module tb_BitSerialAdder();

parameter DWL = 4;
parameter ClockPeriod = 10;
reg CLK, RST;
reg [DWL-1:0] In1, In2;
wire [DWL:0] Sbit;

BitSerialAdder #(.DWL(DWL))
               DUT (.CLK(CLK), .RST(RST), .In1(In1), .In2(In2), .Sbit(Sbit));
               
    initial begin : ClockGenerator
        CLK = 1'b0;
        forever #(ClockPeriod / 2) CLK = ~CLK;
    end
    
    initial begin : TestVectorGenerator
        RST = 1'b1;
        @(posedge CLK);
        @(posedge CLK) RST = 1'b0;
        In1 = 4'b0000; In2 = 4'b0000;
        #100
        In1 = 4'b1111; In2 = 4'b1111;
        #100
        In1 = 4'b1110; In2 = 4'b0111;
        #100
        In1 = 4'b1010; In2 = 4'b0101;
        #100
        In1 = 4'b1000; In2 = 4'b1000;
        
        $finish;
    end

endmodule
