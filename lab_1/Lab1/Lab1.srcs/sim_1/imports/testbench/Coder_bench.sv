`timescale 1ns / 1ps


module Coder_bench;
logic       clk;
logic[1:0]  state;
logic       data;
logic[1:0]  prev_state_;

parameter PERIOD = 10;

initial forever begin
    #(PERIOD/2) clk = 1'b1;
    #(PERIOD/2) clk = 1'b0;
end

Coder dut(
    .clk(clk),
    .state(state),
    .data(data),
    .prev_state(prev_state_)
);

task coder_task(
    input integer state_,
    output integer data_,
    output integer prev_
);
    begin
        state = state_;
    end
endtask


initial begin
    int data_out;
    int prev_state_out;
    int count_out;
    state = 2'b00;
    clk = 0;
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);
    @(posedge clk);
    #1;
    coder_task(1,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(2,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(2,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);    
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);    
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);    
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out); 
    
    @(posedge clk);
    #1;
    coder_task(2,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(2,data_out, prev_state_out);  
    
    @(posedge clk);
    #1;
    coder_task(2,data_out, prev_state_out);     
    
    @(posedge clk);
    #1;
    coder_task(0,data_out, prev_state_out);
    
    @(posedge clk);
    #1;
    coder_task(1,data_out, prev_state_out);  
    @(posedge clk);
    #1;
    coder_task(1,data_out, prev_state_out);  
    @(posedge clk);
    #1;
    coder_task(1,data_out, prev_state_out);  
    @(posedge clk);
    #1;
    coder_task(1,data_out, prev_state_out);        
end


endmodule
