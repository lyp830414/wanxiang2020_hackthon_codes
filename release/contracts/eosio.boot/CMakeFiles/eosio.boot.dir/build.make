# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/lyp830414/bin/cmake

# The command to remove a file.
RM = /home/lyp830414/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lyp830414/eosio.contracts/contracts

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lyp830414/eosio.contracts/build/contracts

# Include any dependencies generated for this target.
include eosio.boot/CMakeFiles/eosio.boot.dir/depend.make

# Include the progress variables for this target.
include eosio.boot/CMakeFiles/eosio.boot.dir/progress.make

# Include the compile flags for this target's objects.
include eosio.boot/CMakeFiles/eosio.boot.dir/flags.make

eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj: eosio.boot/CMakeFiles/eosio.boot.dir/flags.make
eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj: /home/lyp830414/eosio.contracts/contracts/eosio.boot/src/eosio.boot.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lyp830414/eosio.contracts/build/contracts/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj"
	cd /home/lyp830414/eosio.contracts/build/contracts/eosio.boot && /home/lyp830414/EOSIO/eosio.cdt/build/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj -c /home/lyp830414/eosio.contracts/contracts/eosio.boot/src/eosio.boot.cpp

eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.i"
	cd /home/lyp830414/eosio.contracts/build/contracts/eosio.boot && /home/lyp830414/EOSIO/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lyp830414/eosio.contracts/contracts/eosio.boot/src/eosio.boot.cpp > CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.i

eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.s"
	cd /home/lyp830414/eosio.contracts/build/contracts/eosio.boot && /home/lyp830414/EOSIO/eosio.cdt/build/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lyp830414/eosio.contracts/contracts/eosio.boot/src/eosio.boot.cpp -o CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.s

# Object files for target eosio.boot
eosio_boot_OBJECTS = \
"CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj"

# External object files for target eosio.boot
eosio_boot_EXTERNAL_OBJECTS =

eosio.boot/eosio.boot.wasm: eosio.boot/CMakeFiles/eosio.boot.dir/src/eosio.boot.cpp.obj
eosio.boot/eosio.boot.wasm: eosio.boot/CMakeFiles/eosio.boot.dir/build.make
eosio.boot/eosio.boot.wasm: eosio.boot/CMakeFiles/eosio.boot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lyp830414/eosio.contracts/build/contracts/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable eosio.boot.wasm"
	cd /home/lyp830414/eosio.contracts/build/contracts/eosio.boot && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/eosio.boot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
eosio.boot/CMakeFiles/eosio.boot.dir/build: eosio.boot/eosio.boot.wasm

.PHONY : eosio.boot/CMakeFiles/eosio.boot.dir/build

eosio.boot/CMakeFiles/eosio.boot.dir/clean:
	cd /home/lyp830414/eosio.contracts/build/contracts/eosio.boot && $(CMAKE_COMMAND) -P CMakeFiles/eosio.boot.dir/cmake_clean.cmake
.PHONY : eosio.boot/CMakeFiles/eosio.boot.dir/clean

eosio.boot/CMakeFiles/eosio.boot.dir/depend:
	cd /home/lyp830414/eosio.contracts/build/contracts && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lyp830414/eosio.contracts/contracts /home/lyp830414/eosio.contracts/contracts/eosio.boot /home/lyp830414/eosio.contracts/build/contracts /home/lyp830414/eosio.contracts/build/contracts/eosio.boot /home/lyp830414/eosio.contracts/build/contracts/eosio.boot/CMakeFiles/eosio.boot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : eosio.boot/CMakeFiles/eosio.boot.dir/depend

