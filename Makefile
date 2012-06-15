PLATFORM = $(shell gcc -dumpmachine)

ifeq ($(PLATFORM), x86_64-redhat-linux)
DYNLIB = libshared.so
$(DYNLIB): CXXFLAGS += -fPIC -Wl,-soname,$(DYNLIB) -shared
endif

ifeq ($(PLATFORM), i686-apple-darwin10)
DYNLIB = libshared.dylib
$(DYNLIB): CXXFLAGS += -dynamiclib
endif

ifeq ($(PLATFORM), mingw32)
DYNLIB = shared.dll
$(DYNLIB): CXXFLAGS += -shared
endif

ifndef DYNLIB
$(error Unsupported platform: $(PLATFORM))
endif

# ---

main: main.o $(DYNLIB)
	$(CXX) -o main  main.o -L. -lshared

$(DYNLIB): shared.cpp
	$(CXX) $(CXXFLAGS) -o $@ shared.cpp

clean:
	rm *.o $(DYNLIB) main
