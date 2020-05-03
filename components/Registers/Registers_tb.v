`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module Registers_tb;

    reg [31:0] writedata;
    reg regwrite;
    reg [4:0] writereg;
    wire[31:0] rdata1;
    wire[31:0] rdata2;
    reg [4:0] rreg1;
    reg [4:0] rreg2;


    localparam period = 30;  

    Registers test(rreg1, rreg2, writereg, writedata, rdata1, rdata2, regwrite);
    
    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            regwrite = 0;
            writereg = 0;
            rreg1 = 0;
            rreg2 = 1;
            writedata = 1;
            #1; 
            regwrite = 1;
            #1;
            regwrite = 0;
            writereg = 1;
            writedata = 2;
            #1;
            regwrite = 1;
            #1;
            regwrite = 0;
            writereg = 2;
            writedata = 3;
            #1; 
            regwrite = 1;
            #1;
            regwrite = 0;
            rreg1 = 2;
            rreg2 = 2;
            #1;
            $finish;
        end

endmodule
