# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rivkaschuss/CLionProjects/OSex2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/OSex2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OSex2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OSex2.dir/flags.make

CMakeFiles/OSex2.dir/ex2.c.o: CMakeFiles/OSex2.dir/flags.make
CMakeFiles/OSex2.dir/ex2.c.o: ../ex2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/OSex2.dir/ex2.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/OSex2.dir/ex2.c.o   -c /Users/rivkaschuss/CLionProjects/OSex2/ex2.c

CMakeFiles/OSex2.dir/ex2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/OSex2.dir/ex2.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/rivkaschuss/CLionProjects/OSex2/ex2.c > CMakeFiles/OSex2.dir/ex2.c.i

CMakeFiles/OSex2.dir/ex2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/OSex2.dir/ex2.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/rivkaschuss/CLionProjects/OSex2/ex2.c -o CMakeFiles/OSex2.dir/ex2.c.s

CMakeFiles/OSex2.dir/ex2.c.o.requires:

.PHONY : CMakeFiles/OSex2.dir/ex2.c.o.requires

CMakeFiles/OSex2.dir/ex2.c.o.provides: CMakeFiles/OSex2.dir/ex2.c.o.requires
	$(MAKE) -f CMakeFiles/OSex2.dir/build.make CMakeFiles/OSex2.dir/ex2.c.o.provides.build
.PHONY : CMakeFiles/OSex2.dir/ex2.c.o.provides

CMakeFiles/OSex2.dir/ex2.c.o.provides.build: CMakeFiles/OSex2.dir/ex2.c.o


# Object files for target OSex2
OSex2_OBJECTS = \
"CMakeFiles/OSex2.dir/ex2.c.o"

# External object files for target OSex2
OSex2_EXTERNAL_OBJECTS =

OSex2: CMakeFiles/OSex2.dir/ex2.c.o
OSex2: CMakeFiles/OSex2.dir/build.make
OSex2: CMakeFiles/OSex2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable OSex2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OSex2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OSex2.dir/build: OSex2

.PHONY : CMakeFiles/OSex2.dir/build

CMakeFiles/OSex2.dir/requires: CMakeFiles/OSex2.dir/ex2.c.o.requires

.PHONY : CMakeFiles/OSex2.dir/requires

CMakeFiles/OSex2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OSex2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OSex2.dir/clean

CMakeFiles/OSex2.dir/depend:
	cd /Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rivkaschuss/CLionProjects/OSex2 /Users/rivkaschuss/CLionProjects/OSex2 /Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug /Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug /Users/rivkaschuss/CLionProjects/OSex2/cmake-build-debug/CMakeFiles/OSex2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OSex2.dir/depend

