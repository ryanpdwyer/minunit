CFLAGS=-Wall
LDLIBS=-lm

UNAME := $(shell uname)

# On linux we need to link to librt with -lrt.
# We can get the latest version of this library with build-essentials
# We are using -Wl,--no-as-needed to force linking to -lrt
# See. 
ifeq ($(UNAME), Linux)
LDLIBS += -Wl,--no-as-needed -lrt
endif

.PHONY:
	test all clean

all: minunit.h
	$(CC) $(CFLAGS) minunit_example.c -o minunit_example $(LDLIBS)

test:
	./minunit_example \
	exit $$?
clean:
	rm minunit_example
