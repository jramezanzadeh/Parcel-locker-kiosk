cmake_minimum_required(VERSION 3.16)

set(QT_CREATOR_SKIP_MAINTENANCE_TOOL_PROVIDER ON)
project(ParcelLockerKiosk VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)

set(SOURCES
    "cpp/main.cpp"
    "cpp/doorcontroller.cpp"
    "cpp/backend.cpp"
)

set(HEADERS
    "cpp/doorcontroller.h"
    "cpp/backend.h"
)

qt_add_executable(appParcelLockerKiosk
    ${SOURCES}
    ${HEADERS}
)

qt_add_qml_module(appParcelLockerKiosk
    URI ParcelLockerKiosk
    VERSION 1.0

    QML_FILES
        "qml/Main.qml"
        "qml/WelcomeScreen.qml"
        "qml/CodeEntryScreen.qml"
        "qml/ValidatingScreen.qml"
        "qml/ResultScreen.qml"
        "qml/DoorControlScreen.qml"
    RESOURCES
        images/backspace.svg
        images/backspace_fill.svg
        images/cloud.png
        data/mock_api.json
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appParcelLockerKiosk PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appParcelLockerKiosk
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appParcelLockerKiosk
    PRIVATE Qt6::Quick
)
target_link_libraries(appParcelLockerKiosk PRIVATE
    Qt6::Core
)

include(GNUInstallDirs)
install(TARGETS appParcelLockerKiosk
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_subdirectory(tests)
