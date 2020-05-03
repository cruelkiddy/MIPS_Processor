module Inst_mem(
    input [31:0] read_addr,
    output [31:0] instruction
);

    ///< Size of instruction memory
    parameter IM_SIZE = 8;

    ///< Declare the memory variable
    reg [7:0] rom[0:IM_SIZE-1];  ///< 32 bit address, each byte has an address

    ///< Initial the memory with init.mem
    initial
        $readmemb("init.mem", rom);

    assign instruction[31:24] = rom[read_addr];
    assign instruction[23:16] = rom[read_addr+1];
    assign instruction[15:8]  = rom[read_addr+2];
    assign instruction[7:0]   = rom[read_addr+3];

endmodule // Instruction memory