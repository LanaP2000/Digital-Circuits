`timescale 1ns / 1ps

module CarryLookaheadAdder #(parameter DWL = 4)
                            (input [DWL-1:0] a, b,
                             input [DWL-1:1] c,
                             output [DWL:0] s, 
                             output cout);

wire [DWL-1:0] P, G;
                             
PG #(.DWL(DWL)) 
   UUT0 (.a(a[0]), .b(b[0]), .P(P[0]), .G(G[0]));
   
PG #(.DWL(DWL)) 
   UUT1 (.a(a[1]), .b(b[1]), .P(P[1]), .G(G[1]));
   
PG #(.DWL(DWL)) 
   UUT2 (.a(a[2]), .b(b[2]), .P(P[2]), .G(G[2]));

PG #(.DWL(DWL)) 
   UUT3 (.a(a[3]), .b(b[3]), .P(P[3]), .G(G[3]));


SC #(.DWL(DWL)) 
   UUT4 (.P(P[0]), .G(G[0]), .c(3'b0), .s(s[0]), .cout(c[1]));    
   
SC #(.DWL(DWL)) 
   UUT5 (.P(P[1]), .G(G[1]), .c(c[1]), .s(s[1]), .cout(c[2]));   
   
SC #(.DWL(DWL)) 
   UUT6 (.P(P[2]), .G(G[2]), .c(c[2]), .s(s[2]), .cout(c[3]));                                
                             
SC #(.DWL(DWL)) 
   UUT7 (.P(P[3]), .G(G[3]), .c(c[3]), .s(s[3]), .cout(cout));                                
       
    assign s[DWL] = cout;                     
                             
endmodule
