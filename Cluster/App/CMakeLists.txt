find_package(Qt6 COMPONENTS SerialBus REQUIRED)

target_sources(${CMAKE_PROJECT_NAME} PUBLIC
	"main.cpp"
)

# Using the common library instead of defining VehicleDataInterfaceImpl here
# This is now defined in the common directory

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    antares_common
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
    Qt${QT_VERSION_MAJOR}::Multimedia
    Qt${QT_VERSION_MAJOR}::SerialBus)

