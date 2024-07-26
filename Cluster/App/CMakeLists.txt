find_package(Qt6 COMPONENTS SerialBus REQUIRED)

target_sources(${CMAKE_PROJECT_NAME} PUBLIC
	"main.cpp"
)

qt_add_library(VehicleDataInterfaceImpl STATIC)
qt6_add_qml_module(VehicleDataInterfaceImpl
    URI "VehicleDataInterfacImpl"
    VERSION 1.0
        SOURCES
            "../../src/VehicleData.cpp"
            "../../src/VehicleData.h"
            "../../src/VehicleDataInterface.h"
            "../../src/VehicleCanInterface.cpp"
            "../../src/VehicleCanInterface.h"
        )

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    VehicleDataInterfaceImpl
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
    Qt${QT_VERSION_MAJOR}::Multimedia
    Qt${QT_VERSION_MAJOR}::SerialBus)

