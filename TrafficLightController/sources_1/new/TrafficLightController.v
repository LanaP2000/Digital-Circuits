`timescale 1ns / 1ps

module TrafficLightController #(parameter WL = 4)
                               (input CLK, RST, Car,
                                output reg Green_WN_ES, Yellow_WN_ES, Red_WN_ES,
                                output reg Green_NE_SW, Yellow_NE_SW, Red_NE_SW,
                                output reg Green_EW, Yellow_EW, Red_EW,
                                output reg Green_NS, Yellow_NS, Red_NS);

reg [WL-1:0] state, next_state;

// States
localparam SR = 0, // Reset
           S0 = 1, // WN (West-to-North) and ES (East-to-South)
           S1 = 2, // NE (North-to-East) and SW (South-to-West)
           S2 = 3, // EW (East and West)
           S3 = 4; // NS (North and South)

    // STATE REGISTER SEQUENTIAL LOGIC
    always @ (posedge CLK) begin
        if (RST)
            state <= SR;
        else
            state <= next_state;
    end
    
    // NEXT STATE COMBINATIONAL LOGIC
    always @ (state) begin
        case (state)
            // Reset
            SR: begin
                if (Car)
                    next_state = S0;
            end
            // WN && ES
            S0: begin
                next_state = S1;
            end
            // NE && SW
            S1: begin
                next_state = S2;
            end
            // EW
            S2: begin
                next_state = S3;
            end
            // NS
            S3: begin
                next_state = S0;
            end
        endcase
    end
    
    // OUTPUT COMBINATIONAL LOGIC
    always @ (state) begin
        case (state)
            // Reset
            SR: begin
                Green_WN_ES  = 1'b0;
                Yellow_WN_ES = 1'b1; // Next-state
                Red_WN_ES    = 1'b0;
                Green_NE_SW  = 1'b0;
                Yellow_NE_SW = 1'b0;
                Red_NE_SW    = 1'b1;
                Green_EW     = 1'b0;
                Yellow_EW    = 1'b0;
                Red_EW       = 1'b1;
                Green_NS     = 1'b0;
                Yellow_NS    = 1'b0;
                Red_NS       = 1'b1;
            end
            // WN && ES
            S0: begin
                Green_WN_ES  = 1'b1;
                Yellow_WN_ES = 1'b0;
                Red_WN_ES    = 1'b0;
                Green_NE_SW  = 1'b0;
                Yellow_NE_SW = 1'b1; // Next state NE && SW
                Red_NE_SW    = 1'b0;
                Green_EW     = 1'b0;
                Yellow_EW    = 1'b0;
                Red_EW       = 1'b1;
                Green_NS     = 1'b0;
                Yellow_NS    = 1'b0;
                Red_NS       = 1'b1;
            end
            // NE && SW
            S1: begin
                Green_WN_ES  = 1'b0;
                Yellow_WN_ES = 1'b0;
                Red_WN_ES    = 1'b1;
                Green_NE_SW  = 1'b1;
                Yellow_NE_SW = 1'b0;
                Red_NE_SW    = 1'b0;
                Green_EW     = 1'b0;
                Yellow_EW    = 1'b1; // Next state EW
                Red_EW       = 1'b0;
                Green_NS     = 1'b0;
                Yellow_NS    = 1'b0;
                Red_NS       = 1'b1;
            end
            // EW
            S2: begin
                Green_WN_ES  = 1'b0;
                Yellow_WN_ES = 1'b0;
                Red_WN_ES    = 1'b1;
                Green_NE_SW  = 1'b0;
                Yellow_NE_SW = 1'b0;
                Red_NE_SW    = 1'b1;
                Green_EW     = 1'b1;
                Yellow_EW    = 1'b0;
                Red_EW       = 1'b0;
                Green_NS     = 1'b0;
                Yellow_NS    = 1'b1; // Next state NS
                Red_NS       = 1'b0;
            end
            // NS
            S3: begin
                Green_WN_ES  = 1'b0;
                Yellow_WN_ES = 1'b1; // Next state WN && ES
                Red_WN_ES    = 1'b0;
                Green_NE_SW  = 1'b0;
                Yellow_NE_SW = 1'b0;
                Red_NE_SW    = 1'b1;
                Green_EW     = 1'b0;
                Yellow_EW    = 1'b0;
                Red_EW       = 1'b1;
                Green_NS     = 1'b1;
                Yellow_NS    = 1'b0;
                Red_NS       = 1'b0;
            end
            default: begin
                Green_WN_ES  = 1'bx;
                Yellow_WN_ES = 1'bx;
                Red_WN_ES    = 1'bx;
                Green_NE_SW  = 1'bx;
                Yellow_NE_SW = 1'bx;
                Red_NE_SW    = 1'bx;
                Green_EW     = 1'bx;
                Yellow_EW    = 1'bx;
                Red_EW       = 1'bx;
                Green_NS     = 1'bx;
                Yellow_NS    = 1'bx;
                Red_NS       = 1'bx;
            end
        endcase
    end

endmodule
