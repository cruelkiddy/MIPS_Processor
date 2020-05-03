module Registers(
    input[4:0] R_reg1,   ///< Read register 1 ie. rs's Number
    input[4:0] R_reg2,   ///< Read register 2 ie. rt's Number
    input[4:0] W_reg,    ///< Write register ie. rd/rt's Number
    input[31:0] W_data,  ///< Write data
    output[31:0] R_data1,///< Read data 1 rs's value
    output[31:0] R_data2,///< Read data 2 rt's Number
    input RegWrite       ///< Register write enable, high for enable, low for disable
);

    ///< Declare 32 registers 
    reg [31:0] registers [0:31];

    always@(*) begin
        if (RegWrite) 
            registers[W_reg] <= W_data;
        else
            registers[W_reg] <= registers[W_reg];
    end

    assign R_data1 = registers[R_reg1];
    assign R_data2 = registers[R_reg2];


endmodule // Registers