`timescale 1ns / 1ps


module Coder(
    input clk,
    input logic[1:0] state,
    output logic data,
    output logic[1:0] prev_state,
    output logic[3:0] cal   // Для теста
    );  
/*
  state - сигнал которые приходит в кодер
  prev_state - предыдущие состояния 0
  data - вывод данных по битово, а не пачкой
  Состояние сигнала кодируется следующим образом:
    00 -  0
    01 -  +U
    10 -  -U     
*/    
// нужен для подсчета количество единицы
logic[3:0] counter;
logic out = 2'b0;
logic prev = 2;

initial counter = 4'd0;
initial out = 2'd0;
initial prev = 2;

assign cal = counter;
   always_comb @(posedge clk) begin
        if(state == 0) begin
            data <= 1;
            counter += 1;
        end else begin
            data <= 0;
            counter = 0;
        end 
//        if(state == 2'b0) begin // если пришло 0В, то тогда это 1 и счетчик увеличивается
//            counter = counter + 1;
//            out = 1;
//        end else begin 
//            if(counter % 2 == 0) begin // проверка на четность количества единиц
//                if(prev == 1) begin 
//                    out = 0;
//                    prev = 2;
//                end else begin
//                    out = 0;
//                    prev = 1;
//                end
//            end else begin
//            end
//            counter = 2'b0;
//        end
    end
endmodule
