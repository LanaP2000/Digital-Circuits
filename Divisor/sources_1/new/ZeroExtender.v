`timescale 1ns / 1ps

module ZeroExtender #(parameter WL = 4)
                     (input [WL-1:0] dividend,
                      output reg [2*WL-1:0] dividend_extended);
                      
    always @ (*) begin
        dividend_extended = {4'b0, dividend};
    end                     
                      
endmodule
