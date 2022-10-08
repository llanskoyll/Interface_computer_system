`timescale 1ns / 1ps

module Decoder(
    input                clk,
    input                data,
    output logic[1:0]    out_signal
    );
/*
    00 -  0
    01 -  +U    // 1
    10 -  -U    // 2     
*/
logic [2:0] counter;
logic [1:0] current_state;

initial begin
    counter <= 3'b0;
    current_state <= 2'b10;
end

always @(posedge clk) begin
    if(data == 1) begin
        out_signal <= 2'b00;
        counter <= counter + 1;
    end else begin 
        if(counter % 2 != 0) begin
            if(current_state == 2'b10) begin
                out_signal <= 2'b01;
                current_state <= 2'b01;
            end else begin
                out_signal <= 2'b10;
                current_state <= 2'b10;
            end
        end else begin
            out_signal <= current_state;
        end
        counter <= 0;
    end
end

endmodule
