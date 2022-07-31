`timescale 1ns / 1ps

module Stack #(parameter WL = 4, DEPTH = 4)
              (input CLK, RST,
               input rReq, wReq,
               input [WL-1:0] din, 
               output reg [WL-1:0] dout,
               output FULL, EMPTY, 
               output reg ERROR);

reg [WL-1:0] Buffer [0:DEPTH-1];    
reg [$clog2(DEPTH+1)-1:0] sp; // Stack Pointer register
initial sp = 4'b0;
integer i;
    
    assign FULL  = (sp == DEPTH);
    assign EMPTY = (sp == 0);
    
    always @ (posedge CLK) begin
        if (!RST) begin
            if (rReq) begin // POP
                if (!EMPTY) begin
                    dout <= Buffer[sp];
                    ERROR <= 1'b0;
                end
                else if (EMPTY) begin
                    ERROR <= 1'b1;
                end
                sp <= sp - 1;
            end
            if (wReq) begin // PUSH
                if (!FULL) begin
                    Buffer[sp] <= din;
                    ERROR <= 1'b0;
                end
                else if (FULL) begin
                    ERROR <= 1'b1;
                end
                sp <= sp + 1;
            end
        end
    end
    
endmodule
