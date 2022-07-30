`timescale 1ns / 1ps

module Controller #(parameter WL = 4)
                   (input CLK, RST,
                    output reg CompareSubtract, // Control signal
                    output reg ShiftRegister,
                    output reg AVAIL); // Flag for denoting finished division           
      
reg [WL-1:0] state, next_state;

localparam Idle      = 0, // Reset
           Operation = 1, // rh && rl are shifted to the left
           Last      = 2, // Operation
           Done      = 3; // Asserting "avail" signal to indicate the division is complete         
           
    // STATE REGISTER SEQUENTIAL LOGIC
    always @ (posedge CLK) begin
        if (RST)
            state <= Idle;
        else
            state <= next_state;
    end
    
    // NEXT STATE COMBINATIONAL LOGIC
    always @ (state) begin
        case (state)
            Idle: begin
                next_state = Operation;        
            end
            Operation: begin
                next_state = Last;
            end
            Last: begin
                next_state = Done;
            end
            Done: begin
                next_state = Done;
            end
        endcase
    end
    
    // OUTPUT COMBINATIONAL LOGIC
    always @ (state) begin
        case (state)
            Idle: begin
                CompareSubtract = 1'b0;
                ShiftRegister = 1'b0;
                AVAIL = 1'b0;
            end
            Operation: begin
                CompareSubtract = 1'b0;
                ShiftRegister = 1'b1;
                AVAIL = 1'b0;
            end
            Last: begin
                CompareSubtract = 1'b1;
                ShiftRegister = 1'b0;
                AVAIL = 1'b0;
            end
            Done: begin
                CompareSubtract = 1'b0;
                ShiftRegister = 1'b0;
                AVAIL = 1'b1;
            end
            default: begin
                CompareSubtract = 1'bx;
                ShiftRegister = 1'bx;
                AVAIL = 1'bx;
            end
        endcase
    end        
                    
endmodule
