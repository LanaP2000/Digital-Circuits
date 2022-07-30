`timescale 1ns / 1ps

module ShiftRegister #(parameter WL = 4)
                      (input ShiftRegister, 
                       input CLK, RST,
                       input [2*WL-1:0] d,
                       output reg [2*WL-1:0] q);

    always @ (*) begin
        if (ShiftRegister) begin
            if (!RST) begin
                q <= d << 1;
            end
            else begin
                q <= 0;
            end
        end
    end

endmodule
