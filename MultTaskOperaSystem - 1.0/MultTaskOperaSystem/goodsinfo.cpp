#include "goodsinfo.h"

#include<QFile>
#include<QDebug>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>

GoodsInfo::GoodsInfo(QObject *parent) : QObject(parent)
{

}

GoodsInfo::GoodsInfo(const QString &goodsId,const  QString &name,const int &price,const  QString &time,QObject *parent)
    :QObject(parent),_goodsId(goodsId),_name(name),_price(price),_time(time)
{

}


QString GoodsInfo::getGoodsId() const
{
    return _goodsId;
}

void GoodsInfo::setGoodsId(const QString &goodsId)
{
    _goodsId = goodsId;
    emit goodsIdChanged();
}

QString GoodsInfo::getName() const
{
    return _name;
}

void GoodsInfo::setName(const QString &name)
{
    _name = name;
    emit nameChanged();
}

int GoodsInfo::getPrice() const
{
    return _price;
}

void GoodsInfo::setPrice(int price)
{
    _price = price;
    emit priceChanged();
}

QString GoodsInfo::getTime() const
{
    return _time;

}

void GoodsInfo::setTime(const QString &time)
{
    _time = time;
    emit timeChanged();
}


