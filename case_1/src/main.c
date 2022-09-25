#include <stdio.h>
#include <stdint.h>
#define SIZE_FRAME 8
#define SIZE_PACKAGE 12

// Есть n(3)-количество прибол откуда идет m-количество полезной информации(14)
// Всего нужно передать 42 битов полезной информации по 8-разрядному UART интерфейсу
// Для этого мы с первого устройства отсылаем пакет. Пакет будет состоять из 12 фреймов.
// Из этих 12 фреймов 6 - данные, которые передаем от приборов, остальные 6 эти служебные данные
// Фрейм полезных данных чередуется с фреймов службных данных, для контроля целостности данных
// В фрейме для служебных данных, хранится биты инверсии предыдущего фрейма полезных данных
// В случае ошибки, происходит вывод на экран фрейма, который является ошибочным
// В фреймах мы используем 7 бит полезной инфомрации, а последний бит для clk в качество синхронизации

int main()
{
    uint8_t package[SIZE_PACKAGE][SIZE_FRAME] = {
        // frame 1
        {0,0,0,1, 1,0,1,0},
        // frame 2
        {1,1,1,0, 0,1,0,1},
        // frame 3
        {1,1,1,1, 1,1,1,1},
        // frame 4
        {0,0,0,0, 0,0,0,0},
        // frame 5
        {1,0,1,0, 1,0,1,0},
        // frame 6 
        {0,1,0,1, 0,1,0,1},
        //frame 7
        {1,0,1,0, 0,0,0,0},
        //frame 8
        {0,1,0,1, 1,1,1,1},
        //frame 9
        {1,1,1,1, 0,0,0,1},
        //frame 10
        {0,0,0,0, 1,1,1,0},
        //frame 11
        {0,0,1,1, 1,0,1,0},
        //frame 12
        {1,1,0,0, 0,1,0,1}
    };
    
    printf("Началась проверка!\r\n");
    
    int curr = 0;
    int err = 0;
    for(uint8_t i = 0; i < SIZE_PACKAGE; i++) {
        if(i % 2 == 0) {
            curr = i + 1;   
            for(uint8_t j = 0; j < SIZE_FRAME; j++) {
                if(package[i][j] == package[curr][j]) {
                    printf("Неверный кадр номер %d\r\n", i+1);
                    err++;
                }
            }
        }
    }
    if(!err) {
        printf("Проверка прошла успешно!\r\n");
    } else {
        printf("Проверка не прошла !\r\n");
    }
    return 0;
}
