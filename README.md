# Parcel Locker Mini-Kiosk  

An interactive kiosk-style application built with **Qt 6 (QML + C++)**.  
This project was developed as part of a technical assessment to demonstrate GUI development, state management, and backend/device simulation in Qt.  


## Overview  

The app simulates a **parcel pickup flow** for a smart locker:  

- Welcome screen with network status (online/offline)  
- Code entry screen with numeric keypad  
- Validation flow with async backend check (`mock_api.json`)  
- Door control with simulated open/close logic  
- Result screen with success/error messages  
- Automatic return to welcome screen  

The project uses a **QML-based UI** with **C++ backend mocks** for backend API and door controller.  


##  Requirements  

- macOS or Linux (tested on Ubuntu 22.04, because I don't have macOS :) )  
- Qt **6.5+** (Core + Quick + QML + Test)
- CMake **3.16+**  
 

Install Qt (example on macOS with Homebrew):  

```bash
brew install qt
```

Or on Ubuntu:  

```bash
sudo apt install qt6-base-dev qt6-declarative-dev qt6-tools-dev cmake g++
```
> **NOTE**: I have not tested these installation methods, since I installed Qt6 using the [Qt Installer](https://www.qt.io/download-qt-installer-oss).

> **TBD**: Verify and test the required Qt installation commands.   


## Build & Run  

Clone the repo:  

```bash
git clone git@github.com:jramezanzadeh/Parcel-locker-kiosk.git
cd Parcel-locker-kiosk/
```

Configure & build:  

```bash
mkdir build
cmake -S ./ -B build
cd build/
make
```
**Note**: If you installed Qt using the Qt installer in a non-default location, you must set the `CMAKE_PREFIX_PATH` environment variable:
```bash
export CMAKE_PREFIX_PATH=/path/to/qt6/6.9.2/gcc_64
```

Run the app:  

```bash
./appParcelLockerKiosk         # windowed
./appParcelLockerKiosk --fullscreen   # fullscreen mode
```

Run the tests:  

```bash
./tests/testParcelLockerKiosk
```


## Demo of the app flow

[📹 Watch Demo Video](./DemoFlow.mp4) - Complete walkthrough of the parcel pickup process

The video demonstrates:
- Welcome screen and network status(toggled by double clicking on cloud icon)
- Code entry with numeric keypad
- Backend validation process
- Door control simulation
- Success/error handling
- Running tests


