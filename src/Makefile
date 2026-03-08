CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11
TARGET = matrix_task
SOURCES = main.cpp
PREFIX = /usr

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $(TARGET)

install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(TARGET) $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f $(TARGET)

.PHONY: all clean install