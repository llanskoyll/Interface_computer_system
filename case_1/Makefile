# Compile which you use
COMPILE=gcc
#Flags 
CFLAGS=-c -Wall
#Target
TARGET=App
#Variable for directories
PREF_SRC= ./src/
PREF_OBJ= ./obj/
#Source file's
SRC=$(wildcard $(PREF_SRC)*.c)
#List object's
OBJ=$(patsubst $(PREF_SRC)%.c, $(PREF_OBJ)%.o, $(SRC))


all: $(TARGET)

$(TARGET): $(OBJ)
	$(COMPILE) $(OBJ) -o $(TARGET)

${PREF_OBJ}%.o: $(PREF_SRC)%.c
# $< - argument to right
# $@ < argument to left
	$(COMPILE) $(CFLAGS) $< -o $@

clean: 
	rm $(TARGET) $(PREF_OBJ)*.o 
