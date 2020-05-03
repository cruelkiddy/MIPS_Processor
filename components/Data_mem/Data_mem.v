module Data_mem(
    input[31:0] addr,
    input[31:0] Write_data,      ///< Write data
    output reg[31:0] Read_data,  ///< Read data
    input MemWrite,              ///< Data_mem write enable, high for enable, low for disable
    input MemRead                ///< Data_mem read enable, high for enable, low for disable
);

    ///< Declare 32 Byte memory 
    reg [7:0] mem [0:31];

    ///< Write Write_data to addr if MemWrite
    always@(*) begin
        if (MemWrite) begin
            mem[addr] <= Write_data[31:24];
            mem[addr+1] <= Write_data[23:16];
            mem[addr+2] <= Write_data[15:8];
            mem[addr+3] <= Write_data[7:0];
        end
        else begin
            mem[addr] <= mem[addr];
            mem[addr+1] <= mem[addr+1];
            mem[addr+2] <= mem[addr+2];
            mem[addr+3] <= mem[addr+3];            
        end          
    end
    ///< Read addr's data to Read_data if MemRead
    always@(*) begin
        if (MemRead) begin
            Read_data[31:24] <= mem[addr];
            Read_data[23:16] <= mem[addr+1];
            Read_data[15:8] <= mem[addr+2];
            Read_data[7:0] <= mem[addr+3];
        end
            
        else begin
            Read_data[31:24] <= Read_data[31:24];
            Read_data[23:16] <= Read_data[23:16];
            Read_data[15:8]  <= Read_data[15:8];
            Read_data[7:0]   <= Read_data[7:0];
        end 
            
    end


endmodule // Data memory