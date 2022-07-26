`timescale 1ns / 1ps

module SC (input P, G, c,
           output reg s, cout);
  
    always @ (*) begin
        s = P ^ c;
        cout = G | P & c;
    end            
            
endmodule
