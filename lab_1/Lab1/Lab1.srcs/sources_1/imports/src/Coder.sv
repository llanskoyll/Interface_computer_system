`timescale 1ns / 1ps


module Coder(
    input clk,
    input logic[1:0] state,
    output logic data,
    output logic[1:0] prev_state
    );  
/*
  state - сигнал которые приходит в кодер
  prev_state - предыдущие состояния 0
  data - вывод данных по битово, а не пачкой
  Состояние сигнала кодируется следующим образом:
    00 -  0
    01 -  +U    // 1
    10 -  -U    // 2       
*/    
// нужен для подсчета количество единицы
logic [3:0] counter;
logic [1:0] last_zero;

initial begin
    last_zero <= 2'b10;
    counter <= 4'd0;
    prev_state <= 2'b10;
end

always @(posedge clk) begin
    if(state == 0) begin
        counter <= counter + 1;
        data <= 1;
        prev_state <= 0;
    end else begin 
        if(counter % 2 != 0) begin
            if(prev_state == 2'b01) begin
                data <= 0;
                prev_state <= 2'b10;
                last_zero <= 2'b10;
            end else begin
                data <= 0;
                prev_state <= 2'b01;
                last_zero <= 2'b01;
            end
            counter <= 0;
        end else begin
            data <= 0;
            prev_state <= last_zero;
            counter <= 0;
        end 
    end
end

endmodule
