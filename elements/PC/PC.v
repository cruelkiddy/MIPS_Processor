module PC(
    input clk,
    input [31:0] next_addr,
    output reg [31:0] current_addr
);

    ///< update address of instruciton at rising edge of clock
    always@(posedge clk) begin
        current_addr <= next_addr;
    end


endmodule // Program counter