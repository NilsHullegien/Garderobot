#!/bin/sh

mkdir build
cd build

cmake .. && make

# g++ -Wall -Ithreemxl/include -fPIC -g -c carousel.cpp 
# g++ -shared -Wl,-soname,carousel.so -o carousel.so carousel.o
