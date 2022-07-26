`timescale 1ns / 1ps

module CarrySelectAdder_structural #(parameter IWL = 8, OWL = 9)
                                    (input [IWL-1:0] a, b,
                                     input [IWL-1:0] cin,
                                     output [IWL-1:0] s,
                                     output cout);

wire cSel; 
// wire cin;
wire [IWL-5:0] s1, s2; 
 
RippleCarryAdder_structural #(.IWL(IWL-4), .OWL(OWL-4))
                            UUT0 (.a(a[3:0]), .b(b[3:0]), .c(cin), .s(s[3:0]), .cout(cSel));

RippleCarryAdder_structural #(.IWL(IWL-4), .OWL(OWL-4))
                            UUT1 (.a(a[7:4]), .b(b[7:4]), .c(3'b1), .s(s1), .cout(cout));  
                            
RippleCarryAdder_structural #(.IWL(IWL-4), .OWL(OWL-4))
                            UUT2 (.a(a[7:4]), .b(b[7:4]), .c(3'b0), .s(s2), .cout(cout));    

Mux                         #(.DWL(IWL-4)) 
                            UUT3 (.In1(s1), .In2(s2), .Sel(cSel), .Out(s[7:4]));

endmodule
