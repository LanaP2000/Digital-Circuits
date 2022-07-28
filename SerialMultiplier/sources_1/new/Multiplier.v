`timescale 1ns / 1ps

// Shift-Right Register

module Multiplier (input CLK, RST, LOAD,
                   input In,
                   output Out);
 
reg [3:0] Shift;
                    
    always @ (posedge CLK) begin
        if (RST) begin // Active-high signal
            if (LOAD)
                Shift <= In;
            else 
                Shift <= {In, Shift[3:1]};
        end
    end    
    
    assign Out = Shift[0];                       
                    
endmodule
