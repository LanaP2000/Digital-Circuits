`timescale 1ns / 1ps

module tb_ShiftAddSerialMultiplier();

parameter WL = 4;
parameter ClockPeriod = 10;
reg CLK, RST, LOAD;
reg [2*WL-1:0] Ain, Bin;
wire [2*WL-1:0] Result;

ShiftAddSerialMultiplier #(.WL(WL)) 
                         DUT (.CLK(CLK), .RST(RST), .LOAD(LOAD), .Ain(Ain), .Bin(Bin), .Result(Result));

    initial begin : ClockGenerator
        CLK = 1'b1; RST = 1; LOAD = 0;
        forever # (ClockPeriod / 2) CLK = ~CLK;
    end
    
    initial begin : TestVectorGenerator
        @(posedge CLK) Ain <= 4'b0101; Bin <= 4'b1011;
//        Ain = 4'b1111; Bin = 4'b1111;
//        #100
//        a = 4'b1110; b = 4'b0111;
//        #100
//        a = 4'b1010; b = 4'b0101;
//        #100
//        a = 4'b1000; b = 4'b1000;
//        #100
    end

endmodule
