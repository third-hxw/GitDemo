#ifndef GOODSINFO_H
#define GOODSINFO_H

#include <QObject>
#include<QByteArray>
#include<QList>
#include<QVariant>

class GoodsInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString goodsId READ getGoodsId WRITE setGoodsId NOTIFY goodsIdChanged)
    Q_PROPERTY (QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY (int price READ getPrice WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY (QString time READ getTime WRITE setTime NOTIFY timeChanged)

public:

    explicit GoodsInfo(QObject *parent = 0);
    GoodsInfo (const QString &goodsId,
               const QString &name,
               const int &price,
               const QString &time,
               QObject *parent=nullptr);

    QString getGoodsId() const;
    void setGoodsId(const QString &goodsId);

    QString getName() const;
    void setName(const QString &name);

    int getPrice() const;
    void setPrice(int prcie);

    QString getTime() const;
    void setTime(const QString &time);

    //QList<QObject *> openFile();

   //QList<QObject *>goodsList;
signals:
    void goodsIdChanged();
    void nameChanged();
    void priceChanged();
    void timeChanged();

    //QList<QObject *>cppSendMsg(const QList<QObject *> &msg);

public slots:

private:
    QString _goodsId;
    QString _name;
    int _price;
    QString _time;

    QByteArray array;
};

#endif // GOODSINFO_H
