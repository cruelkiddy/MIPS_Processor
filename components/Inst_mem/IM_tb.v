`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module IM_tb;

    reg [31:0] a;
    wire[31:0] b;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    Inst_mem IM(.read_addr(a), .instruction(b));
    
    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            // values for a and b
            a = 0;
            #10; // wait for period 

            a = 4;
            #5;
            $finish;
        end

endmodule
