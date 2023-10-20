#
#    Copyright 2007-2010 Adobe Systems Incorporated
#    Copyright 2018-2022 Chris Cox
#    Distributed under the MIT License (see accompanying file LICENSE_1_0_0.txt
#     or a copy at http://stlab.adobe.com/licenses.html )
#

###################################################
#
# Makefile for C++ benchmarks
#
###################################################


#
# Macros
#

INCLUDE = -I.


# GCC (defaults to Clang/LLVM on MacOS)
#CC = gcc
#CXX = g++


# GCC 8
#CC = gcc-8
#CXX = g++-8


# Clang/LLVM 8
#CC = clang-8
#CXX = clang++-8


CFLAGS = $(INCLUDE) -O3
CPPFLAGS = -std=c++14 $(INCLUDE) -O3

CLIBS = -lm
CPPLIBS = -lm

DEPENDENCYFLAG = -M


#
# our target programs
#

BINARIES = count_sequence 




#
# Build rules
#

all : $(BINARIES)


SUFFIXES:
.SUFFIXES: .c .cpp


# declare some targets to be fakes without real dependencies

.PHONY : clean dependencies

# remove all the stuff we build

clean : 
		rm -f *.o $(BINARIES)


# generate dependency listing from all the source files
# used for double checking problems with headers
# this does NOT go in the makefile

SOURCES = $(wildcard *.c)  $(wildcard *.cpp)
dependencies :   $(SOURCES)
	$(CXX) $(DEPENDENCYFLAG) $(CPPFLAGS) $^


#
# special case compiles
#

exceptions : exceptions.c
	$(CC) $(CFLAGS) -o $@ exceptions.c $(CLIBS)

exceptions_cpp : exceptions.c
	$(CXX) $(CPPFLAGS) -D TEST_WITH_EXCEPTIONS=1 -o $@ exceptions.c $(CPPLIBS)




#
# Run the benchmarks and generate a report
#
REPORT_FILE = report.txt

report:  $(BINARIES)
	echo "##STARTING Version 1.0" > $(REPORT_FILE)
	date >> $(REPORT_FILE)
	echo "##CFlags: $(CFLAGS)" >> $(REPORT_FILE)
	echo "##CPPFlags: $(CPPFLAGS)" >> $(REPORT_FILE)
	./count_sequence >> $(REPORT_FILE)
	date >> $(REPORT_FILE)
	echo "##END Version 1.0" >> $(REPORT_FILE)

