`timescale 1ns / 1ps

module Queue #(parameter WL = 4, DEPTH = 4)
              (input CLK, RST,
               input rReq, wReq,
               input [WL-1:0] din,
               output reg [WL-1:0] dout,
               output FULL, EMPTY, 
               output reg ERROR);

reg [WL-1:0] Buffer [0:DEPTH-1];    
reg [$clog2(DEPTH+1)-1:0] rPtr; // Points to the head of the queue   
reg [$clog2(DEPTH+1)-1:0] wPtr; // Points to the tail of the queue   

initial rPtr = 0;
initial wPtr = 0; 

    assign FULL  = (rPtr == DEPTH && wPtr == DEPTH);
    assign EMPTY = (rPtr == 0 && wPtr == 0);
    
        always @ (posedge CLK) begin
        if (!RST) begin
            if (rReq) begin // POP
                if (!EMPTY) begin
                    dout <= Buffer[rPtr];
                    ERROR <= 1'b0;
                end
                else if (EMPTY) begin
                    ERROR <= 1'b1;
                end
                rPtr <= rPtr + 1;
                wPtr <= wPtr;
            end
            if (wReq) begin // PUSH
                if (!FULL) begin
                    Buffer[wPtr] <= din;
                    ERROR <= 1'b0;
                end
                else if (FULL) begin
                    ERROR <= 1'b1;
                end
                wPtr <= wPtr + 1;
                rPtr <= rPtr;
            end
        end
    end
               
endmodule
