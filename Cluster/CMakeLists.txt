
cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" OFF)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(ClusterApp LANGUAGES CXX)

# Remote Squish Testing
# setting squish package
set(SQUISH_BUILTIN_PATH "/Applications/Squish/9.0.1/squish-9.0.1-qt69x-android-arm64-v8a")
list(APPEND CMAKE_FIND_ROOT_PATH "${SQUISH_BUILTIN_PATH}")
list(APPEND CMAKE_PREFIX_PATH "${SQUISH_BUILTIN_PATH}")
set(SquishQtBuiltinHook_DIR "${SQUISH_BUILTIN_PATH}/lib/cmake/SquishQtBuiltinHook")
set(SquishQtBuiltinHook_ROOT "${SQUISH_BUILTIN_PATH}")

find_package(SquishQtBuiltinHook)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick Multimedia SerialBus)

# Include common library
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../common ${CMAKE_BINARY_DIR}/common)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

qt_add_executable(${CMAKE_PROJECT_NAME} App/main.cpp)
qt_add_resources(${CMAKE_PROJECT_NAME} "configuration"
    PREFIX "/"
    FILES
		qtquickcontrols2.conf)
		
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Multimedia
    Qt6::SerialBus
    antares_common
)

# Add Squish to application target if found
if(SquishQtBuiltinHook_FOUND)
   squish_qt_add_builtin_hook(ClusterApp ATTACH_PORT 4711)
endif()

include(qds)

if (BUILD_QDS_COMPONENTS)
    include(qmlcomponents OPTIONAL)
endif()

if (LINK_INSIGHT)
    include(insight OPTIONAL)
endif ()

include(GNUInstallDirs)
install(TARGETS ${CMAKE_PROJECT_NAME}
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
