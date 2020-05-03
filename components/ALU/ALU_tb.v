`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module ALU_tb;

    reg [31:0] data1, data2;
    reg [3:0] ALU_Control;
    reg [4:0] shamt;
    wire [31:0] ALU_result;
    wire Control_error, zero;

    ///< ALU_Control list
    parameter AND = 4'b0000;
    parameter OR  = 4'b0001;
    parameter add = 4'b0010;
    parameter sub = 4'b0110;
    parameter slt = 4'b0111;
    parameter NOR = 4'b1100;
    parameter sll = 4'b1101;
    parameter rll = 4'b1110;

    ALU test(data1, data2,ALU_Control, shamt, ALU_result, Control_error, zero);

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 50;  
    
    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            data1 = 32'h00001100;
            data2 = 32'h00011000;
            shamt = 5'd4;
            ALU_Control = AND;
            #5;
            ALU_Control = OR;
            #5;
            ALU_Control = add;
            #5;
            ALU_Control = sub;
            #5;
            ALU_Control = slt;
            #5;
            ALU_Control = NOR;
            #5;
            ALU_Control = sll;
            #5;
            ALU_Control = rll;
            #5;
            $finish;
        end

endmodule
