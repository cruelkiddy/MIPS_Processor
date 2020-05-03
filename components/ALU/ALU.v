module ALU(
    input [31:0] data1,         ///< Connect to read data 1 ie. rs
    input [31:0] data2,         ///< Connect to read data 2 ie. rt
    input [3:0] ALU_Control,    ///< Control signal of ALU 
    input [4:0] shamt,          ///< shamt field in R type instruction
    output reg [31:0] ALU_result,
    output reg Control_error,   ///< Flag Control_error flip if ALU_Control is illegal
    output zero                 ///< Flag zero <= high if ALU_result == 0
);
    ///< ALU_Control list
    parameter AND = 4'b0000;
    parameter OR  = 4'b0001;
    parameter add = 4'b0010;
    parameter sub = 4'b0110;
    parameter slt = 4'b0111;
    parameter NOR = 4'b1100;
    parameter sll = 4'b1101;
    parameter rll = 4'b1110;

    always@(*) begin
        case (ALU_Control)
            AND : ALU_result <= data1 & data2;
            OR  : ALU_result <= data1 | data2;
            add : ALU_result <= data1 + data2;
            sub : ALU_result <= data1 - data2;
            slt : if(data1 < data2) ALU_result <= 1'b1; else ALU_result <= 1'b0;
            NOR : ALU_result <= ~(data1 | data2);
            sll : ALU_result <= data2 << shamt;
            rll : ALU_result <= data2 >> shamt;
            default: Control_error <= ~Control_error;
        endcase
    end

    assign zero = (ALU_result) ? 1'b0 : 1'b1;
    

endmodule // ALU