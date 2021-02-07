#
#   default-debug.mk
#

CC=gcc
SOURCEDIR=..
CFLAGS=-g -Wall -Wno-multichar


OBJDIR=$(SOURCEDIR)/debug

INCDIR=$(SOURCEDIR)/include
INCLUDES=-I$(INCDIR)
LIBS=-lxml2 -lrt -lm
HALIBS=$(OBJDIR)/libxha.a
INSDIR=/usr/libexec/xapi/cluster-stack/xhad
LOGCONFDIR=/etc/logrotate.d

.PHONY: build clean debug release

%.o: %.c $(INCDIR)/*.h
	$(CC) $(CFLAGS) $(INCLUDES) -c $<
	
%.a: %.c $(INCDIR)/*.h
	$(CC) $(CFLAGS) $(INCLUDES) -c $<
	@$(AR) rv $@ $*.o
	@$(RM) $*.o
