CC=gcc 			# Compiler : gcc, g++, ...
EXT=.c			# Extension
LDFLAGS=		# Library flags : -lgl, -lpthread, ... 
DEBUG_FLAGS= -DDEBUG=1 -W -Wall -ansi -pedantic -g # Debug flags
FLAGS=			# Other flags


INCLUDE_DIR=include

PROG_NAME=mon_prog
SRCS=\
mon_prog.c \
other_file.c


################################################################
#
################################################################

ifeq (${DEBUG},1)
	FLAGS+=${DEBUG_FLAGS}
endif
FLAGS+= -I ${INCLUDE_DIR}
OBJS=${SRCS:${EXT}=.o}


${PROG_NAME}: ${OBJS}
	${CC} -o $@ ${OBJS} ${LDFLAGS} ${FLAGS}

%.o: src/%${EXT}
	${CC} -o $@ -c $< ${FLAGS}

mrproper:
	rm -rf *.o *~ \#*\# ${PROG_NAME}

clean:
	rm -rf *.o
