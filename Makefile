# Simple Makefile to build mkfilter, gencode and genplot using
# gcc. Based on linux.mk.

all:		mkfilter mkshape mkaverage gencode genplot

mkfilter:	mkfilter.o complex.o
		gcc mkfilter.o complex.o -o mkfilter -lm -static

mkshape:	mkshape.o complex.o
		gcc mkshape.o complex.o -o mkshape -lm -static

mkaverage:	mkaverage.o complex.o
		gcc mkaverage.o complex.o -o mkaverage -lm -static

gencode:	gencode.o complex.o readdata.o
		gcc gencode.o complex.o readdata.o -o gencode -lm -static

genplot:	genplot.o complex.o readdata.o
		g++ genplot.o complex.o readdata.o -lgd -o genplot -lm \
			-L /mingw64/lib

%.o:		%.C mkfilter.h complex.h Makefile
		g++ -O -std=gnu++98 -fpermissive -Wall -c $< -I /mingw64/include

clean:
		rm -f mkfilter.o mkshape.o mkaverage.o gencode.o genplot.o complex.o readdata.o

