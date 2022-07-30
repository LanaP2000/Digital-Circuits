`timescale 1ns / 1ps

module Register #(parameter WL = 4)
                 (input CLK, RST,
                  input [WL-1:0] d,
                  output reg [WL-1:0] q);
                  
    always @ (posedge CLK) begin
        if (!RST)
            q <= d;
        else
            q <= 4'b0;
    end
                  
endmodule
