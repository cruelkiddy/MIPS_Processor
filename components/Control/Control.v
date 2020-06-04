module Control(
    input [5:0] Opcode,
    output RegDst,
    output Jump,
    output Branch,
    output MemRead,
    output MemtoReg,
    output [1:0] ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite
);

    ///< ALUOp list
    parameter Add_Address  = 2'b00;
    parameter Branch_equal = 2'b01;
    parameter R_type       = 2'b10;

    ///< Opcode list
    parameter 

    always@(*) begin
        case (Opcode)

            default: 
        endcase
    end
    

endmodule // ALU controller