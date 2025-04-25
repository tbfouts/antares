# Project Antares


## Description
Musically inspired, project Antares demonstrates the latest technologies from Qt, combining photorealistic realtime 3D with 2D shader effects imported directly from Figma. The project includes both a cluster (GLO) and an IVI (QtMediaSwipe) interface that communicate with each other.

## Visuals
![Cluster](screenshots/cluster.png)

![IVI](screenshots/ivi.png)

This project was demoed on Panasonic's virtual SkipGen platform, an AWS Graviton based Android Automotive OS:

![vSkipGen](screenshots/skipgen.png)

## Vehicle Control WebSocket API Documentation

### Connection Details

- **Host**: `websocketHost` in App.qml (127.0.0.1 by default)
- **Port**: `websocketPort` in App.qml (8080 by default)
- **Protocol**: WebSocket (ws:// or wss://)

### Overview

This WebSocket API allows clients to control various aspects of a vehicle's dashboard and systems. Communication is done through text messages in a simple `command:value` format.

### Message Format
Messages should be sent as strings in the following format:
```
command:value
```
- `command` is the property to modify
- `value` is the new value for the property

### Notes

- Boolean values must be specified as string literals: `"true"` or `"false"`
- Numeric values should be sent as strings that can be parsed as numbers
- The server logs received messages for debugging purposes
- Invalid commands will be logged with a "Warning: message went unhandled" message

### Available Commands

| Command | Value Type | Description | Possible Values |
|---------|------------|-------------|----------------|
| `theme` | String | Sets the theme/appearance | Any valid theme state |
| `doorLeft` | Boolean | Controls the driver's door status | `"true"` (open), `"false"` (closed) |
| `doorRight` | Boolean | Controls the passenger's door status | `"true"` (open), `"false"` (closed) |
| `turnSignalLeft` | Boolean | Controls the left turn signal | `"true"` (on), `"false"` (off) |
| `turnSignalRight` | Boolean | Controls the right turn signal | `"true"` (on), `"false"` (off) |
| `qsrIcons` | Boolean | Controls QSR icons display | `"true"` (show), `"false"` (hide) |
| `gear` | Boolean | Controls gear status | `"true"`, `"false"` |
| `lamps` | Boolean | Controls vehicle lights | `"true"` (on), `"false"` (off) |
| `adasEnabled` | Boolean | Controls drive mode | `"true"` (ADAS mode), `"false"` (SPORT mode) |
| `speed` | Number | Sets the vehicle speed | Any valid number |
| `fuel` | Number | Sets the fuel level | Any valid number (likely a percentage) |
| `battery` | Number | Sets the battery level | Any valid number (likely a percentage) |
| `adasRot` | Number | Sets the ADAS rotation value | Any valid number |
| `units` | String | Sets the measurement units | Valid unit identifier string |

### Example Messages
```
theme:dark
doorLeft:true
doorRight:false
speed:65
fuel:75
battery:80
adasEnabled:true
turnSignalLeft:true
```
## Project Structure
The project is divided into two main components:

* **Cluster** - Digital instrument cluster with QML-based UI showcasing Qt Safe Renderer integration
* **IVI** - In-Vehicle Infotainment system featuring media player, navigation and 3D car view

Both components share vehicle data and can be run independently or together.

## Installation
In order to successfully run this demo, the following is required:

* Installation of Qt 6.7.X or later
* Installation of Qt Creator
* Installation of Qt Design Studio
* Build/Install Qt Designer Components 
```
git clone https://code.qt.io/qt-labs/qtquickdesigner-components.git
mkdir buildDScomponents
cd buildDScomponents
cmake -GNinja -DCMAKE_INSTALL_PREFIX=<path_to_qt_install_directory> <path_to_qtquickdesigner-components>
cmake --buildDScomponents .
cmake --install .
```
* Build/Install Qt Safe Renderer (source code requires DCE license)
```
git clone "https://codereview.qt-project.org/tqtc-boot2qt/qtsaferenderer-runtime"
mkdir buildQsrRuntime
cd buildQsrRuntime
cmake -GNinja -DCMAKE_INSTALL_PREFIX=<path_to_qt_install_directory> <path_to_qtsaferenderer-runtime>
cmake --buildQsrRuntime .
cmake --install .
```
```
git clone "https://codereview.qt-project.org/tqtc-boot2qt/qtsaferenderer"
mkdir buildQsr
cd buildQsr
cmake -GNinja -DCMAKE_INSTALL_PREFIX=<path_to_qt_install_directory> <path_to_qtsaferenderer
cmake --buildQsr .
cmake --install .
```
## Running the Application
To run the application:

1. Open each project in Qt Creator or Qt Design Studio:
   - For the cluster interface: Open `Cluster/GLO.qmlproject`
   - For the IVI interface: Open `IVI/QtMediaSwipe.qmlproject`

2. Build and run each project separately

3. The applications will automatically connect via the WebSocket API

## Development and Testing
The project includes Squish test suites located in `suite_squish/` for automated UI testing.

## Authors and acknowledgment
Design/Visuals: Shawn Dorsey

Development/Coding: Taylor Fouts

## License
In order to build this project a Qt Device Creation License is required.
