LDLIBS=-lm

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
LDLIBS += -lrt
endif

.PHONY:
	test all clean

all: minunit.h
	$(CC) $(LDLIBS) minunit_example.c -o minunit_example

test:
	./minunit_example

clean:
	rm minunit_example
