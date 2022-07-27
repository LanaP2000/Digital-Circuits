`timescale 1ns / 1ps

module FullAdder (input a, b,
                  input c,
                  output reg s,
                  output reg cout);

    always @ (*) begin
        s = a ^ b ^ c;
        cout = (a & b) | ((a ^ b) & c);
    end

endmodule
