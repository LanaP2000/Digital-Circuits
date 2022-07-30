`timescale 1ns / 1ps

module Divisor #(parameter WL = 4)
                (input CLK, RST,
                 input [WL-1:0] dividend,
                 input [WL-1:0] divisor,
                 output [WL-1:0] quotient,
                 output [WL-1:0] remainder);
                 
wire [2*WL-1:0] dividend_extended, dividend_extended_q;
wire [WL-1:0] rh, rl, d, q, rh_tmp;
wire CompareSubtract, ShiftRegister, AVAIL;

Controller      #(.WL(WL)) C  (.CLK(CLK), .RST(RST), .CompareSubtract(CompareSubtract), .ShiftRegister(ShiftRegister), .AVAIL(AVAIL));

ZeroExtender    #(.WL(WL)) ZE (.dividend(dividend), .dividend_extended(dividend_extended));

Register        #(.WL(WL)) D  (.CLK(CLK), .RST(RST), .d(divisor), .q(d));

Register        #(.WL(WL)) RH (.CLK(CLK), .RST(RST), .d(dividend_extended_q[2*WL-1:4]), .q(rh));

Register        #(.WL(WL)) RL (.CLK(CLK), .RST(RST), .d(dividend_extended_q[WL-1:0]),   .q(rl));

CompareSubtract #(.WL(WL)) CS (.CompareSubtract(CompareSubtract), .rh(rh), .d(d), .rh_tmp(rh_tmp), .q(q));

ShiftRegister   #(.WL(WL)) SR (.ShiftRegister(ShiftRegister), .CLK(CLK), .RST(RST), 
                               .d(dividend_extended), .q(dividend_extended_q));        
 
    assign quotient = rl;
    assign remainder = rh;
                 
endmodule
