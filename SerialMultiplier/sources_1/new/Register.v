`timescale 1ns / 1ps

module Register (input CLK, RST,
                 input D,
                 output reg Q);

initial Q <= 0;
                  
    always @ (posedge CLK) begin
        if (RST) // Active-high signal
            Q <= D;
    end                  
                  
endmodule
