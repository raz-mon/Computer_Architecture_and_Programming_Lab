# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /snap/clion/129/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/129/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/spl211/CLionProjects/splHW1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/spl211/CLionProjects/splHW1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/splHW1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/splHW1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/splHW1.dir/flags.make

CMakeFiles/splHW1.dir/src/main.cpp.o: CMakeFiles/splHW1.dir/flags.make
CMakeFiles/splHW1.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/splHW1.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/splHW1.dir/src/main.cpp.o -c /home/spl211/CLionProjects/splHW1/src/main.cpp

CMakeFiles/splHW1.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/splHW1.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/spl211/CLionProjects/splHW1/src/main.cpp > CMakeFiles/splHW1.dir/src/main.cpp.i

CMakeFiles/splHW1.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/splHW1.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/spl211/CLionProjects/splHW1/src/main.cpp -o CMakeFiles/splHW1.dir/src/main.cpp.s

CMakeFiles/splHW1.dir/src/Tree.cpp.o: CMakeFiles/splHW1.dir/flags.make
CMakeFiles/splHW1.dir/src/Tree.cpp.o: ../src/Tree.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/splHW1.dir/src/Tree.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/splHW1.dir/src/Tree.cpp.o -c /home/spl211/CLionProjects/splHW1/src/Tree.cpp

CMakeFiles/splHW1.dir/src/Tree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/splHW1.dir/src/Tree.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/spl211/CLionProjects/splHW1/src/Tree.cpp > CMakeFiles/splHW1.dir/src/Tree.cpp.i

CMakeFiles/splHW1.dir/src/Tree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/splHW1.dir/src/Tree.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/spl211/CLionProjects/splHW1/src/Tree.cpp -o CMakeFiles/splHW1.dir/src/Tree.cpp.s

CMakeFiles/splHW1.dir/src/Session.cpp.o: CMakeFiles/splHW1.dir/flags.make
CMakeFiles/splHW1.dir/src/Session.cpp.o: ../src/Session.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/splHW1.dir/src/Session.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/splHW1.dir/src/Session.cpp.o -c /home/spl211/CLionProjects/splHW1/src/Session.cpp

CMakeFiles/splHW1.dir/src/Session.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/splHW1.dir/src/Session.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/spl211/CLionProjects/splHW1/src/Session.cpp > CMakeFiles/splHW1.dir/src/Session.cpp.i

CMakeFiles/splHW1.dir/src/Session.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/splHW1.dir/src/Session.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/spl211/CLionProjects/splHW1/src/Session.cpp -o CMakeFiles/splHW1.dir/src/Session.cpp.s

CMakeFiles/splHW1.dir/src/Graph.cpp.o: CMakeFiles/splHW1.dir/flags.make
CMakeFiles/splHW1.dir/src/Graph.cpp.o: ../src/Graph.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/splHW1.dir/src/Graph.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/splHW1.dir/src/Graph.cpp.o -c /home/spl211/CLionProjects/splHW1/src/Graph.cpp

CMakeFiles/splHW1.dir/src/Graph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/splHW1.dir/src/Graph.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/spl211/CLionProjects/splHW1/src/Graph.cpp > CMakeFiles/splHW1.dir/src/Graph.cpp.i

CMakeFiles/splHW1.dir/src/Graph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/splHW1.dir/src/Graph.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/spl211/CLionProjects/splHW1/src/Graph.cpp -o CMakeFiles/splHW1.dir/src/Graph.cpp.s

CMakeFiles/splHW1.dir/src/Agent.cpp.o: CMakeFiles/splHW1.dir/flags.make
CMakeFiles/splHW1.dir/src/Agent.cpp.o: ../src/Agent.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/splHW1.dir/src/Agent.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/splHW1.dir/src/Agent.cpp.o -c /home/spl211/CLionProjects/splHW1/src/Agent.cpp

CMakeFiles/splHW1.dir/src/Agent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/splHW1.dir/src/Agent.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/spl211/CLionProjects/splHW1/src/Agent.cpp > CMakeFiles/splHW1.dir/src/Agent.cpp.i

CMakeFiles/splHW1.dir/src/Agent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/splHW1.dir/src/Agent.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/spl211/CLionProjects/splHW1/src/Agent.cpp -o CMakeFiles/splHW1.dir/src/Agent.cpp.s

# Object files for target splHW1
splHW1_OBJECTS = \
"CMakeFiles/splHW1.dir/src/main.cpp.o" \
"CMakeFiles/splHW1.dir/src/Tree.cpp.o" \
"CMakeFiles/splHW1.dir/src/Session.cpp.o" \
"CMakeFiles/splHW1.dir/src/Graph.cpp.o" \
"CMakeFiles/splHW1.dir/src/Agent.cpp.o"

# External object files for target splHW1
splHW1_EXTERNAL_OBJECTS =

splHW1: CMakeFiles/splHW1.dir/src/main.cpp.o
splHW1: CMakeFiles/splHW1.dir/src/Tree.cpp.o
splHW1: CMakeFiles/splHW1.dir/src/Session.cpp.o
splHW1: CMakeFiles/splHW1.dir/src/Graph.cpp.o
splHW1: CMakeFiles/splHW1.dir/src/Agent.cpp.o
splHW1: CMakeFiles/splHW1.dir/build.make
splHW1: CMakeFiles/splHW1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable splHW1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/splHW1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/splHW1.dir/build: splHW1

.PHONY : CMakeFiles/splHW1.dir/build

CMakeFiles/splHW1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/splHW1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/splHW1.dir/clean

CMakeFiles/splHW1.dir/depend:
	cd /home/spl211/CLionProjects/splHW1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/spl211/CLionProjects/splHW1 /home/spl211/CLionProjects/splHW1 /home/spl211/CLionProjects/splHW1/cmake-build-debug /home/spl211/CLionProjects/splHW1/cmake-build-debug /home/spl211/CLionProjects/splHW1/cmake-build-debug/CMakeFiles/splHW1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/splHW1.dir/depend

