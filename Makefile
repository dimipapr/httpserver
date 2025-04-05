

CC=gcc
CFLAGS=-Wall -Wextra -fPIC -I./include
CFLAGS_RELEASE:=$(CFLAGS) -DNDEBUG -O3
CFLAGS_DEBUG:=$(CFLAGS) -DDEBUG -Og -g
BUILD_PROFILE=:debug

SOURCES=$(wildcard source/*.c)
OBJECTS=$(patsubst source/%.c, build/debug/%.o, $(SOURCES))
TEST_SOURCES=$(wildcard tests/source/test_*.c)
TEST_OBJECTS=$(patsubst tests/source/test_%.c, tests/build/debug/test_%.o, $(TEST_SOURCES))
LIB_TARGET=build/debug/libhttpserver.a

all: test_run_debug

build_debug: CFLAGS:=$(CFLAGS) $(CFLAGS_DEBUG)
build_debug: build

build:$(LIB_TARGET)

$(LIB_TARGET): $(OBJECTS)
	ar -rcs $@ $^
	ranlib $@

build/debug/%.o: source/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

test_debug: run

clean:
	rm -rf ./build ./tests/build ./tests/bin
	
.PHONY: build clean
