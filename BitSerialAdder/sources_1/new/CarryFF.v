`timescale 1ns / 1ps

module CarryFF (input CLK, RST,
                input cout,
                output reg c);

    always @ (posedge CLK) begin
        if (!RST)
            c <= cout;
    end
                 
endmodule
