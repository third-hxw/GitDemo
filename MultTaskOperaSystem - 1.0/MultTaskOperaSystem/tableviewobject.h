#ifndef TABLEVIEWOBJECT_H
#define TABLEVIEWOBJECT_H

#include <QObject>
#include <QtCore>

#include<QFile>

class TableViewObject : public QObject
{
    Q_OBJECT
    //Q_DISABLE_COPY(FileIo)

    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

public:
    explicit TableViewObject(QObject *parent = 0);

    void readFile();

   // Q_INVOKABLE void sendSignal();
    void setLine(QString &line);
    QString getLine() const;

signals:
    void tableViewSendMsg(const QString &msg);

    void lineChanged(QString line);
public slots:

   // void tableViewRecvMsg(const QString &msg);

private:
    QString myLine;

};

#endif // TABLEVIEWOBJECT_H
