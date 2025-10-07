#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QString>

#include "doorcontroller.h"
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    bool fullscreen = false;

    //only --fullscreen is important for now
    for (int i = 1; i < argc; ++i) {
        if (QString(argv[i]) == "--fullscreen")
            fullscreen = true;
    }
    // fullscreen = true;

    qmlRegisterType<DoorController>("ParcelLocker", 1, 0, "DoorController");
    qmlRegisterSingletonType<Backend>("ParcelLocker", 1, 0, "Backend",
        [](QQmlEngine*, QJSEngine*) -> QObject* { return new Backend; });

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
            &app, []() { QCoreApplication::exit(-1); },
            Qt::QueuedConnection);
    // engine.loadFromModule("ParcelLockerKiosk", "Main");
    engine.load(QUrl(QStringLiteral("qrc:/ParcelLockerKiosk/qml/Main.qml")));

    // Show the window (fullscreen or normal)
    const auto rootObjects = engine.rootObjects();
    if (!engine.rootObjects().isEmpty()) {
        auto *window = qobject_cast<QQuickWindow *>(rootObjects.first());
        if (window) {
            if (fullscreen)
                window->showFullScreen();
            else
                window->show();
        }
    }

    return app.exec();
}
