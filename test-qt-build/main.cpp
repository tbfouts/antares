#include <QCoreApplication>
#include <QDebug>
#include <QString>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    
    qDebug() << "Hello from Qt!" << QT_VERSION_STR;
    qDebug() << "Qt installation working correctly!";
    
    return 0;
}