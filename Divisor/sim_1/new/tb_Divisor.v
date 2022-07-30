`timescale 1ns / 1ps

module tb_Divisor();

parameter WL = 4;
parameter ClockPeriod = 10;
reg CLK, RST;
reg [WL-1:0] dividend, divisor;
wire [WL-1:0] quotient, remainder;

Divisor #(.WL(WL)) DUT(.CLK(CLK), .RST(RST), .dividend(dividend), 
                                             .divisor(divisor), 
                                             .quotient(quotient), 
                                             .remainder(remainder));

    initial begin : ClockGenerator
        CLK = 1'b0;
        forever #(ClockPeriod / 2) CLK = ~CLK;
    end
    
    initial begin : TestVectorGenerator
        @(posedge CLK) RST = 1'b1;
        @(posedge CLK) RST = 1'b0;
        @(posedge CLK) dividend = 4'b1101; divisor = 4'b0010;
    end

endmodule
