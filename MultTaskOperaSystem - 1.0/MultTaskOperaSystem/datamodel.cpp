#include "datamodel.h"
#include <QAbstractTableModel>
#include<QQuickItem>
#include<QFile>
#include<QList>
#include<QByteArray>
#include<QObject>
#include<QJsonDocument>
#include <QQmlContext>
#include <QtQml>
DataModel::DataModel(QObject *parent) :QAbstractTableModel(parent)
{

    QMap<QString,QVariant> map_1;
    QFile file(":/images/goodsInfo.json");
    bool OK = file.open(QIODevice::ReadOnly);
    qDebug() << "ok :"<< OK;
    QByteArray array = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(array);
    QList<QString>goodsList;
    QJsonObject object = doc.object();
    QJsonArray resultArray = object.value("goodsInfo").toArray();
    for(int i=0;i<resultArray.size();i++)
    {

        QJsonObject arrayObject = resultArray.at(i).toObject();

        map_1.insert("goodsId",arrayObject.value("goodsId").toString());
        map_1.insert("name",arrayObject.value("name").toString());
        map_1.insert ("price","¥" + arrayObject.value("price").toString());
        map_1.insert("time", arrayObject.value("time").toString());
        m_map.push_back(map_1);
    }
}

DataModel::~DataModel()
{

}

QVariant DataModel::data(const QModelIndex &index, int role) const
{
    QString key = getkey(role);
    return m_map[index.row()].value(key,"####");
}

int DataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_map.size();
}

int DataModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    if(m_map.isEmpty())
        return 0;
    return m_map.at(0).size();
}

QHash<int, QByteArray> DataModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i=0;i < m_roleList.size();i++)
    {
        roles[Qt::UserRole + i + 1] = m_roleList.at(i).toLocal8Bit();
    }
    return roles;
}

QModelIndex DataModel::index(int row, int column, const QModelIndex &parent) const
{
    if(row > m_map.size()-1 || row < 0)
        return QModelIndex();
    if(column > 1 || column < 0)
        return QModelIndex();
    return createIndex(row,column);
}

bool DataModel::removeRows(int row, int count, const QModelIndex &parent)
{
    if(row < 0 || count < 1 || row + count > rowCount())
        return false;
    beginRemoveRows(parent,row,row + count - 1);
    for(int i = row + count - 1;i >= row;i--)
    {
        m_map.removeAt(i);
    }
    endRemoveRows();
    return true;
}



Qt::ItemFlags DataModel::flags(const QModelIndex &index) const
{
    if(!index.isValid())
        return Qt::NoItemFlags;
    return Qt::ItemIsEditable | Qt::ItemIsEnabled | Qt::ItemIsSelectable
            | Qt::ItemIsUserCheckable;
}

QStringList DataModel::roles() const
{
    return m_roleList;
}

void DataModel::setRoles(const QStringList roles )
{
    if(!roles.isEmpty())
    {
        m_roleList = roles;
    }
}

QString DataModel::getkey(int role) const
{
    int columnIndex = role - Qt::UserRole - 1;
    return m_roleList.at(columnIndex);
}

