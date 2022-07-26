`timescale 1ns / 1ps

module Mux #(DWL = 4)
            (input [DWL-1:0] In1, In2,
             input Sel,
             output reg [DWL-1:0] Out);
    
    always @ (*) begin
        Out = Sel ? In1 : In2;
    end    
    
endmodule
