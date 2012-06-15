PLATFORM = $(shell gcc -dumpmachine)

ifeq ($(PLATFORM), x86_64-redhat-linux)
DYNLIB = libshared.so
endif

ifeq ($(PLATFORM), mingw32)
DYNLIB = shared.dll
endif

ifndef DYNLIB
$(error Unsupported platform: $(PLATFORM))
endif

main: main.o $(DYNLIB)
	$(CXX) -o main  main.o -L. -lshared

$(DYNLIB): shared.cpp
	$(CXX) -fPIC -c shared.cpp -o shared.o
	$(CXX) -shared -Wl,-soname,$(DYNLIB) -o $@ shared.o

clean:
	rm *.o *.so main
