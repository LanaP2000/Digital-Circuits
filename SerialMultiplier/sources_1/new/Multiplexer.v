`timescale 1ns / 1ps

module Multiplexer (input In1, In2,
                    input Sel,
                    output reg Out);
                     
    always @ (*) begin
        Out = Sel ? In1 : In2;
    end                     
                     
endmodule
