#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QObject>
#include <QAbstractItemModel>

class DataModel : public QAbstractTableModel
{
    Q_OBJECT
    Q_PROPERTY(QStringList roles READ roles WRITE setRoles)
public:
    explicit DataModel(QObject *parent = 0);
    ~DataModel();

    //继承基类的函数
    QVariant data(const QModelIndex &index, int role) const override;
    int rowCount(const QModelIndex &parent =  QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash <int, QByteArray> roleNames() const override;//重新实现roleNmes()
    QModelIndex index(int row, int column, const QModelIndex &parent) const override;
    Q_INVOKABLE bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;

    QStringList roles()const;
    void setRoles(const QStringList roles);
    void delRow();

signals:

     void dataChanged();

public slots:

private:
    QString getkey(int role) const;
private:
    QList<QMap<QString,QVariant>> m_map;
    QStringList m_roleList;

};

#endif // DATAMODEL_H
