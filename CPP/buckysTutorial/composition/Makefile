CFLAGS = -O
CC = g++
SRC = main.cpp Birthday.cpp People.cpp
OBJ = $(SRC:.cpp = .o)

out: $(OBJ)
	$(CC) $(CFLAGS) -o out $(OBJ)

clean:
	rm -f core *.o
