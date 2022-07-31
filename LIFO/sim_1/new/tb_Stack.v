`timescale 1ns / 1ps

module tb_Stack();

parameter WL = 4, DEPTH = 4;
parameter ClockPeriod = 10;
reg CLK, RST;
reg POP, PUSH;
reg [WL-1:0] din;
wire [WL-1:0] dout;
wire FULL, EMPTY, ERROR;

Stack #(.WL(WL), .DEPTH(DEPTH)) DUT (.CLK(CLK), .RST(RST), .rReq(POP), .wReq(PUSH), 
                                     .din(din), .dout(dout), .FULL(FULL), .EMPTY(EMPTY), .ERROR(ERROR));

    initial begin : ClockGenerator
        CLK = 1'b0;
        forever #(ClockPeriod / 2) CLK = ~CLK;
    end
    
    initial begin : TestVectorGenerator
        @(posedge CLK) RST = 1'b1;
        @(posedge CLK) RST = 1'b0;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0001;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0010;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0100;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0101;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0111;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0100;
        @(posedge CLK) PUSH = 0; POP = 1; 
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0011;
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0001;
        @(posedge CLK) PUSH = 0; POP = 1; 
        @(posedge CLK) PUSH = 0; POP = 1;
        @(posedge CLK) PUSH = 0; POP = 1;
        @(posedge CLK) PUSH = 0; POP = 1; 
        @(posedge CLK) PUSH = 0; POP = 1; 
        @(posedge CLK) PUSH = 1; POP = 0; din = 4'b0010;
        @(posedge CLK); 
        $finish;
    end

endmodule
