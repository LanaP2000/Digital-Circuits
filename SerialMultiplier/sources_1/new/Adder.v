`timescale 1ns / 1ps

module Adder (input In1, In2,
              output reg Out);
               
    always @ (*) begin
        Out = In1 + In2;
    end              
               
endmodule
