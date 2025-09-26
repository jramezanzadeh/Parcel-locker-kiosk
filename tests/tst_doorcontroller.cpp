#include <QtTest>
#include "../cpp/doorcontroller.h"

class DoorControllerTest : public QObject
{
    Q_OBJECT
private slots:
    void testOpen();
    void testClose();
};

void DoorControllerTest::testOpen()
{
    DoorController door;

    QSignalSpy spy(&door, &DoorController::statusChanged);

    door.open();

    // Wait a bit longer than the timer delay
    QTest::qWait(1500);

    // Make sure the signal was emitted at least twice ("Opening..." and final status)
    QCOMPARE(spy.count() >= 2, true);

    QString finalStatus = door.status();
    QVERIFY(finalStatus == "Open" || finalStatus == "Error: failed to open");
}

void DoorControllerTest::testClose()
{
    DoorController door;

    QSignalSpy spy(&door, &DoorController::statusChanged);

    door.close();

    QTest::qWait(1500);

    QCOMPARE(spy.count() >= 2, true);

    QString finalStatus = door.status();
    QVERIFY(finalStatus == "Closed" || finalStatus == "Error: failed to close");
}

QTEST_MAIN(DoorControllerTest)
#include "tst_doorcontroller.moc"
