module ALU_control(
    input [1:0] ALUOp,
    input [5:0] funct,
    output reg [3:0] control_line
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

    ///< ALUOp list
    parameter Add_Address  = 2'b00;
    parameter Branch_equal = 2'b01;
    parameter R_type       = 2'b10;

    ///< funct list
    parameter sll_f = 6'b000000;
    parameter srl_f = 6'b000010;
    parameter add_f = 6'b100000;
    parameter sub_f = 6'b100010;
    parameter AND_f = 6'b100100;
    parameter OR_f  = 6'b100101;
    parameter slt_f = 6'b101010;


    always@(*) begin
        case (ALUOp)
            Add_Address : control_line <= add;
            Branch_equal : control_line <= sub;
            R_type : begin
               if (funct == sll_f)      control_line <= sll; 
               else if(funct == srl_f)  control_line <= rll; ///< Typo here...rll -> srl
               else if(funct == add_f)  control_line <= add;
               else if(funct == sub_f)  control_line <= sub;
               else if(funct == AND_f)  control_line <= AND;
               else if(funct == OR_f)   control_line <= OR;
               else if(funct == slt_f)  control_line <= slt;
               else control_line <= control_line;
            end
            default: control_line <= control_line;
        endcase
    end
    

endmodule // ALU controller