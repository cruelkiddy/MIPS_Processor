`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module IM_tb;

    reg [31:0] Write_data, addr;
    wire[31:0] out;

    reg Write_En, Read_En;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 40;  

    Data_mem test(addr, Write_data, out, Write_En, Read_En);
    
    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
            Write_En = 0;
            Read_En = 0;
            addr = 2;
            Write_data = 32'h2341a214;
            #5;
            Write_En = 1;
            #1;
            Write_En = 0;
            #5;
            Read_En = 1;
            #1;
            Write_data = 32'h0;
            addr = 1;
            Read_En = 0;
            #1;
            Write_En = 1;
            #1;
            Read_En = 1;
            #5;
            $finish;
        end

endmodule
