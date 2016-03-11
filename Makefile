NAME	:= ai-ants

SOURCES  := $(wildcard src/*.c)
OBJS     := $(SOURCES:.c=.o)

INCLUDES := -Iinclude

WARNFLAGS   := -Wall -Wextra -Wshadow -Wcast-align -Wwrite-strings -Winline
WARNFLAGS   += -Wno-attributes -Wno-deprecated-declarations
WARNFLAGS   += -Wno-div-by-zero -Wno-endif-labels -Wfloat-equal
WARNFLAGS   += -Wformat=2 -Wno-format-extra-args -Winit-self
WARNFLAGS   += -Winvalid-pch -Wmissing-format-attribute
WARNFLAGS   += -Wmissing-include-dirs -Wno-multichar -Wshadow
WARNFLAGS   += -Wno-sign-compare -Wswitch
WARNFLAGS   += -Wno-pragmas -Wno-unused-but-set-parameter
WARNFLAGS   += -Wno-unused-but-set-variable -Wno-unused-result
WARNFLAGS   += -Wwrite-strings -Wdisabled-optimization -Wpointer-arith

LINKFLAGS   := -lm -lSDL2

CFLAGS := $(INCLUDES) $(WARNFLAGS)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(LINKFLAGS) $(CFLAGS) $(OBJS) -o $(NAME)

debug: CFLAGS += -g
debug: all

clean:
	rm $(NAME) $(OBJS)
