# Simple Makefile to build mkfilter, gencode and genplot using
# gcc. Based on linux.mk.

all:		mkfilter gencode genplot

mkfilter:	mkfilter.o complex.o
		gcc mkfilter.o complex.o -o mkfilter -lm

gencode:	gencode.o complex.o readdata.o
		gcc gencode.o complex.o readdata.o -o gencode -lm

genplot:	genplot.o complex.o readdata.o
		g++ genplot.o complex.o readdata.o -lgd -o genplot -lm \
			-L /c/msys64/mingw64/lib

%.o:		%.C mkfilter.h complex.h Makefile
		g++ -g -std=gnu++98 -fpermissive -Wall -c $< -I /c/msys64/mingw64/include

clean:
		rm -f mkfilter.o mkshape.o mkaverage.o gencode.o genplot.o complex.o readdata.o

