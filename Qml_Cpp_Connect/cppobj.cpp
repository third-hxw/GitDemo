#include "cppobj.h"
#include<QDebug>

CppObj::CppObj(QObject *parent) : QObject(parent),myName("")
{

}

void CppObj::sendSignal()
{

}

void CppObj::setName( QString &name)
{
    static int i = 0;
    myName = name.append("%1").arg(++i);
    emit cppSignal(myName);


}

QString CppObj::getName() const
{

    return myName ;
}

void CppObj::cppRecvMsg(QString msg)
{


}

