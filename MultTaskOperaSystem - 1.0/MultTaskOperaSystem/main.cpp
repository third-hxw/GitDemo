#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQuickItem>
#include<QFile>
#include<QList>
#include<QByteArray>
#include<QObject>
#include<QJsonDocument>
#include <QQmlContext>
#include <QtQml>
#include<QDebug>

#include"multtask.h"
#include"fileio.h"
#include"goodsinfo.h"
#include "datamodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<MultTask>("MyMultTask",1,0,"MultTask");
    qmlRegisterType<FileIO>("MyFileIO", 1, 0, "FileIO");
    qmlRegisterType<DataModel>("MyDataModel",1,0,"DataModel");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}

