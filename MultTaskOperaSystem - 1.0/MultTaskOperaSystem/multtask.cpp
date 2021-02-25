#include "multtask.h"
#include <QDebug>
#include <QByteArray>
MultTask::MultTask(QObject *parent) : QObject(parent),qmlStr("none")
{

}

void MultTask::sendSignal()
{
    emit cppSendMsg(qmlStr);
}

void MultTask::setStr(QString &str)
{

    if(str.length() >= 3)
    {
        qmlStr = str.mid(str.length()-3);
        str = qmlStr;
        emit strChanged(str);
    }
    else
    {       
        emit strChanged(str);
    }
}

QString MultTask::getStr() const
{
    return qmlStr;
}

void MultTask::cppRecvMsg(const QString &msg)
{
    qDebug()<<"----recved-----"<< msg;

}





