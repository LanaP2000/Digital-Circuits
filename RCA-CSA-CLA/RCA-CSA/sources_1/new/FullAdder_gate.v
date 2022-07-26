`timescale 1ns / 1ps

module FullAdder_gate (input a, b, cin,
                       output s, cout);
                        
wire aXORb, aANDb, p;

    xor UUT0 (s, a, b, cin);   // s = (a ^ b) ^ cin
    
    xor UUT1 (aXORb, a, b);    // aXORb = a ^ b
    and UUT2 (aANDb, a, b);    // aANDb = a & b
    and UUT3 (p, cin, aXORb);  // cin & (a ^ b)
    or  UUT4 (cout, aANDb, p); // cout = (a & b) | (cin & (a ^ b)) 
                        
endmodule
