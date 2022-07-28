`timescale 1ns / 1ps

// Shift-Left Register

module Multiplicand (input CLK, RST, LOAD,
                     input In,
                     output Out);

reg [3:0] Shift;
                      
    always @ (posedge CLK) begin
        if (RST) begin // Active-high signal
            if (LOAD)
                Shift <= In;
            else 
                Shift <= {Shift[2:0], In};
        end
    end    
    
    assign Out = Shift[3];                  
                      
endmodule
