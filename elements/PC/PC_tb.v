`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module PC_tb;
    
    reg clk;
    reg [31:0] income_addr;
    wire [31:0] current_addr;

    localparam period = 30;  
    
    PC test(clk, income_addr, current_addr);

    initial // initial block executes only once
        begin
            $dumpfile("waveform");
            $dumpvars;
        
            income_addr = 32'h1;
            clk = 0;
            #5;
            clk = 1;
            income_addr = 32'h2;
            #5;
            clk = 0;
            income_addr = 32'h3;
            #5;
            clk = 1;
            income_addr = 32'h4;
            #5;
            clk= 1;
            income_addr = 32'h5;
            #5;
            clk = 0;
            income_addr = 32'h6;
            #5;
            $finish;
        end

endmodule
