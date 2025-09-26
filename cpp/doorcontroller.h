#ifndef DOORCONTROLLER_H
#define DOORCONTROLLER_H

#pragma once
#include <QObject>
#include <QTimer>

class DoorController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString status READ status NOTIFY statusChanged)

public:
    explicit DoorController(QObject *parent = nullptr);

    Q_INVOKABLE void open();
    Q_INVOKABLE void close();
    QString status() const { return m_status; }

signals:
    void statusChanged();

private:
    QString m_status = "Closed";
    void setStatus(const QString &newStatus);
};

#endif // DOORCONTROLLER_H
