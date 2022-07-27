`timescale 1ns / 1ps

module ShiftRegister #(parameter DWL = 4)
                      (input CLK, RST,
                       input In,
                       output reg Out);

reg [DWL-1:0] temp;

    always @ (posedge CLK) begin
        if (!RST) begin
            temp <= {temp[DWL-2:0], In};
            Out <= temp[DWL-1];
        end
    end
    
endmodule
