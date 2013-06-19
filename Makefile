# I am a comment, and I want to say that the variable CC will be
# the compiler to use.
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AS=arm-none-eabi-as
BINCPY=arm-none-eabi-objcopy

# Hey!, I am comment number 2. I want to say that CFLAGS will be the
# options I'll pass to the compiler.
CFLAGS=-c -mcpu=arm926ej-s -g -Wall
LDFLAGS=
ASFLAGS=-mcpu=arm926ej-s -g

all: main test test-iv interrupt
	$(BINCPY) -O binary main.elf main.bin
	$(BINCPY) -O binary test.elf test.bin
	$(BINCPY) -O binary test-iv.elf test-iv.bin
	$(BINCPY) -O binary interrupt.elf interrupt.bin

test-iv: test-iv.o
	$(LD) $(LDFLAGS) -T src/ld/test-iv.ld test-iv.o -o test-iv.elf	

test: test.o
	$(LD) $(LDFLAGS) -T src/ld/test.ld test.o -o test.elf	

main: main.o entry.o
	$(LD) $(LDFLAGS) -T src/ld/main.ld main.o entry.o -o main.elf

interrupt: interrupt.o interrupt-main.o
	$(LD) $(LDFLAGS) -T src/ld/interrupt.ld interrupt.o -o interrupt.elf

main.o: src/c/main.c
	$(CC) $(CFLAGS) src/c/main.c -o main.o

entry.o: src/s/entry.s
	$(AS) $(ASFLAGS) src/s/entry.s -o entry.o

test.o: src/s/test.s
	$(AS) $(ASFLAGS) src/s/test.s -o test.o

test-iv.o: src/s/test-iv.s
	$(AS) $(ASFLAGS) src/s/test-iv.s -o test-iv.o

interrupt.o:
	$(AS) $(ASFLAGS) src/s/interrupt.s -o interrupt.o

interrupt-main.o:
	$(CC) $(CFLAGS) src/c/interrupt-main.c -o interrupt-main.o

clean:
	rm -rf *o *.elf *.bin *~
 
# CC=g++
# CFLAGS=-c -Wall
# LDFLAGS=
# SOURCES=main.cpp hello.cpp factorial.cpp
# OBJECTS=$(SOURCES:.cpp=.o)
# EXECUTABLE=hello

# all: $(SOURCES) $(EXECUTABLE)
	
# $(EXECUTABLE): $(OBJECTS) 
# 	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

# .cpp.o:
# 	$(CC) $(CFLAGS) $< -o $@
