# CFLAGS = -O
# CC = g++

# out: helloWorld.o Burrito.o
# 	$(CC) $(CFLAGS) -o out helloWorld.o Burrito.o

# helloWorld.o: helloWorld.cpp
# 	$(CC) $(CFLAGS) -c helloWorld.cpp

# Burrito.o: Burrito.cpp
# 	$(CC) $(CFLAGS) -c Burrito.cpp

# clean:
# 	rm -f core *.o

CFLAGS = -O
CC = g++
SRC = helloWorld.cpp Burrito.cpp
OBJ = $(SRC:.cpp = .o)

out: $(OBJ)
	$(CC) $(CFLAGS) -o out $(OBJ)

clean:
	rm -f core *.o
