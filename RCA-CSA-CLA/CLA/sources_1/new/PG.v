`timescale 1ns / 1ps

module PG (input a, b,
           output reg P, G);
            
    always @ (*) begin
        P = a ^ b;
        G = a & b;
    end    
            
endmodule
