`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2022 14:02:52
// Design Name: 
// Module Name: Decoder_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder_bench;
logic       clk;
logic       data;
logic [1:0] out_sig;

parameter PERIOD = 10;
initial forever begin
    #(PERIOD/2) clk = 1'b1;
    #(PERIOD/2) clk = 1'b0;
end

Decoder dut(
    .clk(clk),
    .data(data),
    .out_signal(out_sig)
);

task decoder_task(
    input integer data_,
    output integer out_sig_
);
    begin
        data = data_;
    end
endtask

initial begin 
    int data_in;
    int curr_state;
    
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(0,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
    @(posedge clk); 
    #1;
    decoder_task(1,curr_state);
end
endmodule
