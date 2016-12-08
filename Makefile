### Test MakeFile for experimenting ###
CC = clang
TARGET = ezview

CFLAGS = -g -Wall

.PHONY: default all clean

default: $(TARGET)
all: default

LIBS = -lm

%.o: %.c
	$(CC) $(CFLAGS) -I/usr/local/include -L/usr/local/lib/ -lglib-2.0 -lglfw $< -o $@

$(TARGET): $(OBJECTS) main.c
	$(CC) main.c -Wall -I/usr/local/include -L/usr/local/lib/ -framework GLUT -framework OpenGL -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo -lglfw $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
