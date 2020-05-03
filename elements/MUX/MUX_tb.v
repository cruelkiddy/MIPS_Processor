`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module MUX_tb;
    reg [31:0] data0, data1;
    reg sel;
    wire [31:0] out; 

    localparam period = 30;  
    
    MUX_1bit test(sel, data0, data1, out);

    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            sel = 0;
            data0 = 32'h80000001;
            data1 = 32'h80000002;
            #5;
            sel = 1;
            #5;
            sel = 0;
            #5;
            sel = 1;
            #5;
            sel = 0;
            #5;

            $finish;
        end

endmodule
