`timescale 1ns / 1ps

module RippleCarryAdder_structural #(parameter IWL = 4, OWL = 5)
                                    (input [IWL-1:0] a, b, 
                                     input [IWL-1:0] c,
                                     output [OWL-1:0] s, 
                                     output cout);                        
    
FullAdder_gate     UUT0 (.a(a[0]), .b(b[0]), .cin(1'b0), .s(s[0]), .cout(c[1])); 

FullAdder_gate     UUT1 (.a(a[1]), .b(b[1]), .cin(c[1]), .s(s[1]), .cout(c[2]));

FullAdder_dataflow UUT2 (.a(a[2]), .b(b[2]), .cin(c[2]), .s(s[2]), .cout(c[3]));

FullAdder_dataflow UUT3 (.a(a[3]), .b(b[3]), .cin(c[3]), .s(s[3]), .cout(cout));

    assign s[4] = cout;

endmodule
