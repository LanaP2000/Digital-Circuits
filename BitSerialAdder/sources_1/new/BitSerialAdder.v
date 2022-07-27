`timescale 1ns / 1ps

module BitSerialAdder #(parameter DWL = 4)
                       (input CLK, RST,
                        input [DWL-1:0] In1, In2,
                        output [DWL:0] Sbit);

wire [DWL-1:0] a, b; 
wire [DWL-1:1] c;
wire cout; 
wire [DWL-1:0] s;
wire cout_q;

ShiftRegister #(.DWL(DWL))
              B0 (.CLK(CLK), .RST(RST), .In(In1[0]), .Out(b[0]));
ShiftRegister #(.DWL(DWL))
              B1 (.CLK(CLK), .RST(RST), .In(In1[1]), .Out(b[1]));
ShiftRegister #(.DWL(DWL))
              B2 (.CLK(CLK), .RST(RST), .In(In1[2]), .Out(b[2]));
ShiftRegister #(.DWL(DWL))
              B3 (.CLK(CLK), .RST(RST), .In(In1[3]), .Out(b[3]));
              
ShiftRegister #(.DWL(DWL))
              A0 (.CLK(CLK), .RST(RST), .In(In2[0]), .Out(a[0]));
ShiftRegister #(.DWL(DWL))
              A1 (.CLK(CLK), .RST(RST), .In(In2[1]), .Out(a[1]));
ShiftRegister #(.DWL(DWL))
              A2 (.CLK(CLK), .RST(RST), .In(In2[2]), .Out(a[2]));
ShiftRegister #(.DWL(DWL))
              A3 (.CLK(CLK), .RST(RST), .In(In2[3]), .Out(a[3]));

FullAdder     FA0 (.a(a[0]), .b(b[0]), .c(1'b0), .s(s[0]), .cout(c[1]));
FullAdder     FA1 (.a(a[1]), .b(b[1]), .c(c[1]), .s(s[1]), .cout(c[2]));
FullAdder     FA2 (.a(a[2]), .b(b[2]), .c(c[2]), .s(s[2]), .cout(c[3]));
FullAdder     FA3 (.a(a[3]), .b(b[3]), .c(c[3]), .s(s[3]), .cout(cout));

CarryFF       FF (.CLK(CLK), .RST(RST), .cout(cout), .c(cout_q));
              
ShiftRegister #(.DWL(DWL))
              S0 (.CLK(CLK), .RST(RST), .In(s[0]), .Out(Sbit[0]));
ShiftRegister #(.DWL(DWL))
              S1 (.CLK(CLK), .RST(RST), .In(s[1]), .Out(Sbit[1]));
ShiftRegister #(.DWL(DWL))
              S2 (.CLK(CLK), .RST(RST), .In(s[2]), .Out(Sbit[2]));
ShiftRegister #(.DWL(DWL))
              S3 (.CLK(CLK), .RST(RST), .In(s[3]), .Out(Sbit[3]));
              
    assign Sbit[4] = cout_q;

endmodule
