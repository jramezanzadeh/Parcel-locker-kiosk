#ifndef BACKEND_H
#define BACKEND_H

#pragma once
#include <QObject>
#include <QJsonArray>
#include <QJsonObject>

    class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool online READ online WRITE setOnline NOTIFY onlineChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE void validateCode(const QString &pin);

    bool online() const { return m_online; }
    void setOnline(bool value);

signals:
    void validationResult(bool success, QString message, QString lockerId);
    void onlineChanged();

private:
    bool m_online = true;
    QJsonArray m_codes;
};


#endif // BACKEND_H
