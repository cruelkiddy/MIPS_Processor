module MUX_1bit(
    input sel,
    input [31:0] data0,
    input [31:0] data1,
    output [31:0] out
);
    assign out = (sel) ? data1 : data0;

endmodule // Mux 1 from 2
