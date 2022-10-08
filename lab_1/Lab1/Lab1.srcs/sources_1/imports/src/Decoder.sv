`timescale 1ns / 1ps

module Decoder(
    input                clk,
    input                data,
    input logic[1:0]     prev_state,
    output logic[1:0]    out_signal
    );
/*
    00 -  0
    01 -  +U    // 1
    10 -  -U    // 2     
*/
always @(posedge clk) begin
    
end

endmodule
