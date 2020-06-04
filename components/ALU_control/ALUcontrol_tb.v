`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module ALUcontrol_tb;


    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 50;  
    
    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            
            #5;

            #5;
            $finish;
        end

endmodule
