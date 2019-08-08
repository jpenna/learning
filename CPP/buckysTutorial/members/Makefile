CFLAGS = -O
CC = g++
SRC = main.cpp Sally.cpp
OBJ = $(SRC:.cpp = .o)

out: $(OBJ)
	$(CC) $(CFLAGS) -o out $(OBJ)

clean:
	rm -f core *.o
