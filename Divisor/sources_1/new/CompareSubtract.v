`timescale 1ns / 1ps

module CompareSubtract #(parameter WL = 4)
                        (input CompareSubtract,
                         input [WL-1:0] rh, d,
                         output [WL-1:0] q,
                         output reg [WL-1:0] rh_tmp);

integer i;

    always @ (*) begin
        if (CompareSubtract) begin
            for (i = 0; i <= WL-1; i = i + 1) begin
                if (rh >= d) begin
                    rh_tmp = rh - d;
                end
                else begin
                    rh_tmp = rh;
                end
            end
        end
    end
    
    assign q = rh_tmp;

endmodule
