# Mkfilter

This is the mkfilter code from
https://github.com/university-of-york/cs-www-users-fisher slightly
hacked so it will compile with the more pernickety up to date Gnu C++
compiler.

## Examples
    mkfilter -Bu -Lp -o 4 -a 0.2
Generate a 4-pole Butterworth lowpass filter with corner frequency 0.2 fs;
display pole & zero positions and filter recurrence relation

    mkfilter -Bu -Lp -o 4 -a 0.2 -l | gencode
Generate C code for the above filter

    mkfilter -Bu -Lp -o 4 -a 0.2 -l | genplot graph.gif
Generate phase & magnitude graphs for the above filter

    mkfilter -Re 1000 -Bp -a 0.3
Generate a bandpass resonator with Q = 1000 and centre frequency 0.3 fs;
display pole & zero positions and filter recurrence relation


See `doc.pdf` for original documentation.
