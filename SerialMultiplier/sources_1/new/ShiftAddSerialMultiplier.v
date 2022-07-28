`timescale 1ns / 1ps

module ShiftAddSerialMultiplier #(parameter WL = 4)
                                 (input CLK, RST, LOAD,
                                  input [2*WL-1:0] Ain, Bin,
                                  output [2*WL-1:0] Result);

wire [2*WL-1:0] Ain_q, Bin_q;
wire [2*WL-1:0] MUXout, Plusout, Pout;
genvar i;
         
    generate 
        for (i = 0; i <= 2*WL-1; i = i + 1) begin
            Multiplicand A (.CLK(CLK), .RST(RST), .LOAD(LOAD), .In(Ain[i]), .Out(Ain_q[i]));
                 
            Multiplier   B (.CLK(CLK), .RST(RST), .LOAD(LOAD), .In(Bin[i]), .Out(Bin_q[i]));
            
            Multiplexer  MUX (.In1(Ain_q[i]), .In2(1'b0), .Sel(Bin_q[0]), .Out(MUXout[i]));
            
            Adder        Plus (.In1(MUXout[i]), .In2(Pout[i]), .Out(Plusout[i])); // Pout
            
            Register     P (.CLK(CLK), .RST(RST), .D(Plusout[i]), .Q(Pout[i]));  
        end
    endgenerate
    
    assign Result = Pout;                         
                                  
endmodule
