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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.13.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.13.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build

# Include any dependencies generated for this target.
include ext/nanogui/CMakeFiles/nanogui.dir/depend.make

# Include the progress variables for this target.
include ext/nanogui/CMakeFiles/nanogui.dir/progress.make

# Include the compile flags for this target's objects.
include ext/nanogui/CMakeFiles/nanogui.dir/flags.make

# Object files for target nanogui
nanogui_OBJECTS =

# External object files for target nanogui
nanogui_EXTERNAL_OBJECTS = \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/ext/nanovg/src/nanovg.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/ext/glad/src/glad.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/darwin.mm.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/nanogui_resources.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/glutil.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/common.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/widget.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/theme.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/layout.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/screen.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/label.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/window.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/popup.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/checkbox.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/button.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/popupbutton.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/combobox.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/progressbar.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/slider.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/messagedialog.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/textbox.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/imagepanel.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/imageview.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/vscrollpanel.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/colorwheel.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/colorpicker.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/graph.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/stackedwidget.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/tabheader.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/tabwidget.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/glcanvas.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui-obj.dir/src/serializer.cpp.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/context.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/init.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/input.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/monitor.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/vulkan.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/window.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_init.m.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_joystick.m.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_monitor.m.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_window.m.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_time.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/posix_tls.c.o" \
"/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/nsgl_context.m.o"

ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/ext/nanovg/src/nanovg.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/ext/glad/src/glad.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/darwin.mm.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/nanogui_resources.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/glutil.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/common.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/widget.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/theme.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/layout.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/screen.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/label.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/window.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/popup.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/checkbox.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/button.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/popupbutton.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/combobox.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/progressbar.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/slider.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/messagedialog.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/textbox.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/imagepanel.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/imageview.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/vscrollpanel.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/colorwheel.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/colorpicker.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/graph.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/stackedwidget.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/tabheader.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/tabwidget.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/glcanvas.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui-obj.dir/src/serializer.cpp.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/context.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/init.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/input.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/monitor.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/vulkan.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/window.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_init.m.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_joystick.m.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_monitor.m.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_window.m.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_time.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/posix_tls.c.o
ext/nanogui/libnanogui.dylib: ext/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/nsgl_context.m.o
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui.dir/build.make
ext/nanogui/libnanogui.dylib: ext/nanogui/CMakeFiles/nanogui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX shared library libnanogui.dylib"
	cd /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nanogui.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ext/nanogui/CMakeFiles/nanogui.dir/build: ext/nanogui/libnanogui.dylib

.PHONY : ext/nanogui/CMakeFiles/nanogui.dir/build

ext/nanogui/CMakeFiles/nanogui.dir/clean:
	cd /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui && $(CMAKE_COMMAND) -P CMakeFiles/nanogui.dir/cmake_clean.cmake
.PHONY : ext/nanogui/CMakeFiles/nanogui.dir/clean

ext/nanogui/CMakeFiles/nanogui.dir/depend:
	cd /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/ext/nanogui /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui /Users/ashnachoudhury/cs184/finalProject_waterCelShader/finalProject/build/ext/nanogui/CMakeFiles/nanogui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ext/nanogui/CMakeFiles/nanogui.dir/depend

