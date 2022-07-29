`timescale 1ns / 1ps

module tb_TrafficLightController();

parameter WL = 4;
parameter ClockPeriod = 10;
reg CLK, RST, Car;
wire Green_WN_ES, Yellow_WN_ES, Red_WN_ES,
     Green_NE_SW, Yellow_NE_SW, Red_NE_SW,
     Green_EW, Yellow_EW, Red_EW,
     Green_NS, Yellow_NS, Red_NS;

TrafficLightController #(.WL(WL))
                       DUT (.CLK(CLK), .RST(RST), .Car(Car), .Green_WN_ES(Green_WN_ES), 
                                                             .Yellow_WN_ES(Yellow_WN_ES), 
                                                             .Red_WN_ES(Red_WN_ES),
                                                             .Green_NE_SW(Green_NE_SW), 
                                                             .Yellow_NE_SW(Yellow_NE_SW), 
                                                             .Red_NE_SW(Red_NE_SW),
                                                             .Green_EW(Green_EW), 
                                                             .Yellow_EW(Yellow_EW), 
                                                             .Red_EW(Red_EW),
                                                             .Green_NS(Green_NS), 
                                                             .Yellow_NS(Yellow_NS), 
                                                             .Red_NS(Red_NS));
                       
    initial begin : ClockGenerator
        CLK = 1'b0;
        forever #(ClockPeriod / 2) CLK = ~CLK;
    end
    
    initial begin : TestVectorGenerator
        @(posedge CLK) RST = 1; Car = 1;
        @(posedge CLK) RST = 0;
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        $finish;
    end

endmodule
