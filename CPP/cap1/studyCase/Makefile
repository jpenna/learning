CFLAGS = -O
CC = g++
SRC = personal.cpp student.cpp database.cpp
OBJ = $(SRC:.cpp = .o)

out: $(OBJ)
	$(CC) $(CFLAGS) -o out $(OBJ)

clean:
	rm -f core *.o
