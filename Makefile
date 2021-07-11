# Simple Makefile to build mkfilter and gencode using gcc. Based on
# linux.mk.

all:		mkfilter gencode

mkfilter:	mkfilter.o complex.o
		gcc mkfilter.o complex.o -o mkfilter -lm

gencode:	gencode.o complex.o readdata.o
		gcc gencode.o complex.o readdata.o -o gencode -lm

%.o:		%.C mkfilter.h complex.h Makefile
		gcc -O -fpermissive -Wall -c $<

clean:
		rm -f mkfilter.o mkshape.o mkaverage.o gencode.o genplot.o complex.o readdata.o

