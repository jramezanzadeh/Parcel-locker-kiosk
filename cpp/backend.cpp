#include "backend.h"
#include <QFile>
#include <QJsonDocument>
#include <QTimer>
#include <QDebug>

Backend::Backend(QObject *parent) : QObject(parent)
{
    QString fileName = ":/ParcelLockerKiosk/data/mock_api.json";
    QFile file(fileName);
    if (file.open(QIODevice::ReadOnly)) {
        auto doc = QJsonDocument::fromJson(file.readAll());
        m_codes = doc.object().value("codes").toArray();
        qDebug() << "codes count:" << m_codes.count();
    }else{
        qDebug() << "Failed to open data file " << fileName;
    }
}

void Backend::validateCode(const QString &pin)
{
    if (!m_online) {
        emit validationResult(false, "Offline mode: cannot connect", "");
        return;
    }

    // Simulate async delay
    QTimer::singleShot(1500, this, [=]() {
        for (const auto &c : m_codes) {
            auto obj = c.toObject();
            qDebug() << "PIN value:" << obj.value("pin").toString();
            if (obj.value("pin").toString() == pin) {
                emit validationResult(true, "Valid code", obj.value("lockerId").toString());
                return;
            }
        }
        emit validationResult(false, "Invalid code", "");
    });
}

void Backend::setOnline(bool value)
{
    if (m_online != value) {
        m_online = value;
        emit onlineChanged();
    }
}
