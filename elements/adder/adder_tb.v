`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module adder_tb;
    reg [31:0] a, b;
    wire [31:0] out; 
    wire p_overflow, n_overflow; 

    localparam period = 30;  
    
    adder test(a, b, out, p_overflow, n_overflow);

    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            a = 32'h80000001;
            b = 32'h80000001;
            #5;
            a = 32'h7DDDDDDD;
            b = 32'h7DDDDDDD;
            #5;
            a = 5;
            b = 7;
            #5;
            a = -5;
            b = -7;
            #5;
            a = 8;
            b = -9;
            #5;

            $finish;
        end

endmodule
