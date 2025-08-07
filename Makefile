# Compiler and linker settings
CXX = g++
CXXFLAGS = -I./include -Wall -g
LDFLAGS = -L./lib -lpdcurses

# Source files and object files
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(SRC_FILES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
EXE = $(BIN_DIR)/goob

# Default target: compile the program
all: $(EXE)

# Rule to create the executable
$(EXE): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $(EXE) $(LDFLAGS)

# Rule to compile .cpp files into .o object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean the project
clean:
	rm -f $(OBJ_DIR)/*.o $(EXE)

# Rebuild the project
rebuild: clean all

.PHONY: all clean rebuild
