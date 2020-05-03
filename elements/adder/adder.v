module adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out,
    output positive_overflow,
    output negative_overflow
);

    ///< Overflow detection 1: Dual sign-bit method
    
    wire [32:0] a_extended, b_extended, result;
    ///< extend sign bit 
    assign a_extended[31:0] = a;
    assign a_extended[32] = a[31];
    assign b_extended[31:0] = b;
    assign b_extended[32] = b[31];
    ///< Add  
    assign result = a_extended + b_extended;

    ///< leftmost 2 bit: 01 -> positive overflow
    ///< leftmost 2 bit: 10 -> negative overflow
    assign positive_overflow = (result[32:31] == 2'b01) ? 1'b1 : 1'b0;
    assign negative_overflow = (result[32:31] == 2'b10) ? 1'b1 : 1'b0;

    assign out = result[31:0];
    

    ///< Overflow detection 2: Sigle sign-bit method
    ///< Not implemented yet


endmodule // adder