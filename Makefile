srcdir = .

#TODO: if embeded 
build_alias 	= i686-pc-linux-gnu
build_triplet 	= i686-pc-linux-gnu
host_alias 	= i686-pc-linux-gnu
host_triplet 	= i686-pc-linux-gnu
target_alias 	= i686-pc-linux-gnu
target_triplet 	= i686-pc-linux-gnu

CC = gcc
BUILD_CC = gcc
AR = ar
GRANDLIBARCMD = $(AR) cr
GRANDLIBRANLIBCMD = $(RANLIB)
RANLIB = ranlib

INCLUDES = -I$(srcdir) -I../
DEP_PATH = ./deps/

LIBS =

CFLAGS = -D_GNU_SOURCE -g -O2 -Wall -Wno-unknown-pragmas -DDEBUG

COMPILE = $(CC)  $(INCLUDES) $(CFLAGS) 

SRCS = main.c schedule.c
OBJS = main.o schedule.o

DEP_FILES = \
	$(DEP_PATH)main.c.P

EXEC = ./my_scheduler



all: $(EXEC)

$(EXEC): $(OBJS)
	@echo Linking...
	$(CC) -o $@  $(OBJS)  $(LIBS)
clean:
	@echo Clean...
	rm -rf $(OBJS) $(EXEC)



%.o: %.c
#$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<
	$(CC) $(INCLUDES) -c -o $@ $<


-include $(DEP_FILES)

