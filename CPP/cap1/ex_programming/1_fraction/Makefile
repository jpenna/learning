CFLAGS = -O -std=c++11
CC = g++
SRC = fraction.cpp utils.cpp main.cpp
OBJ = $(SRC:.cpp = .o)

out: $(OBJ)
	$(CC) $(CFLAGS) -o out $(OBJ)

clean:
	rm -f core *.o
