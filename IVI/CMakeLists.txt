cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(QtMediaSwipeApp LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick Multimedia SerialBus)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

qt_add_executable(QtMediaSwipeApp src/main.cpp
    ../src/VehicleDataInterface.h
    ../src/VehicleCanInterface.h
    ../src/VehicleCanInterface.cpp)

qt_add_resources(QtMediaSwipeApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
        sounds/electric.wav
        sounds/luna.wav
        sounds/stardust.wav
        sounds/pixel.wav
        sounds/crystal.wav
        sounds/sonic.wav
        sounds/ethereal.wav
        sounds/mind.wav
        sounds/gravity.wav
        sounds/zen.wav
        sounds/ultraviolet.wav
        sounds/velvet.wav
)

target_link_libraries(QtMediaSwipeApp PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Multimedia
    Qt6::SerialBus
)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

if (BUILD_QDS_COMPONENTS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

include(GNUInstallDirs)
install(TARGETS QtMediaSwipeApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# make IDEs aware of the QML import path
set(QML_IMPORT_PATH ${PROJECT_BINARY_DIR}/qml CACHE PATH
    "Path to the custom QML components defined by the project")
