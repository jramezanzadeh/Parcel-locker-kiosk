#include "doorcontroller.h"
#include <QRandomGenerator>
#include <QTimer>

DoorController::DoorController(QObject *parent) : QObject(parent) {}

void DoorController::open()
{
    setStatus("Opening...");
    QTimer::singleShot(1000, this, [this]() {
        if (QRandomGenerator::global()->bounded(100) < 80) {
            setStatus("Open");
        } else {
            setStatus("Error: failed to open");
        }
    });
}

void DoorController::close()
{
    setStatus("Closing...");
    QTimer::singleShot(1000, this, [this]() {
        if (QRandomGenerator::global()->bounded(100) < 80) {
            setStatus("Closed");
        } else {
            setStatus("Error: failed to close");
        }
    });
}

void DoorController::setStatus(const QString &newStatus)
{
    if (m_status != newStatus) {
        m_status = newStatus;
        emit statusChanged();
    }
}
