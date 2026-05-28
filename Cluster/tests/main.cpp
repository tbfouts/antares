#include <QtQuickTest>
#include <QCoreApplication>
#include <QObject>

class Setup : public QObject
{
    Q_OBJECT
public slots:
    void applicationAvailable()
    {
        QCoreApplication::setOrganizationName("QtProject");
        QCoreApplication::setOrganizationDomain("qt.io");
        QCoreApplication::setApplicationName("qmltests");
    }
};

QUICK_TEST_MAIN_WITH_SETUP(qmltests, Setup)

#include "main.moc"
