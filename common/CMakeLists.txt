cmake_minimum_required(VERSION 3.16)

# Add policy for Qt6 QML modules
if(POLICY CMP0071)
  cmake_policy(SET CMP0071 NEW)
endif()

project(AntaresCommon LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Make Vulkan optional 
option(ENABLE_VULKAN "Enable Vulkan support" OFF)

# Find required Qt packages
find_package(Qt6 REQUIRED COMPONENTS Core Qml SerialBus Mqtt Network)

# Vulkan is not required for the common library
set(CMAKE_POLICY_DEFAULT_CMP0074 NEW) # Use <PackageName>_ROOT variables
find_package(Vulkan QUIET)
if(NOT Vulkan_FOUND)
    message(STATUS "Vulkan not found - some features may be disabled")
endif()

add_library(antares_common STATIC
    src/VehicleDataInterface.h
    src/VehicleData.h
    src/VehicleData.cpp
    src/VehicleCanInterface.h
    src/VehicleCanInterface.cpp
    src/MqttClient.h
    src/MqttClient.cpp
    src/VehicleMqttInterface.h
    src/VehicleMqttInterface.cpp
)

target_include_directories(antares_common PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_link_libraries(antares_common PUBLIC
    Qt6::Core
    Qt6::Qml
    Qt6::SerialBus
    Qt6::Mqtt
    Qt6::Network
)

# Instead of creating a QML module, just make the library available for QML registration
# This will be simpler and more reliable, as the QML types are registered in C++ code

# Make the library exportable to QML
target_compile_definitions(antares_common PRIVATE QT_QML_EXPORT)

# Add QML module for Design Studio support
add_subdirectory(qml/VehicleData)

# Add installation rules if needed
# install(TARGETS antares_common DESTINATION lib)
# install(DIRECTORY src/ DESTINATION include FILES_MATCHING PATTERN "*.h")