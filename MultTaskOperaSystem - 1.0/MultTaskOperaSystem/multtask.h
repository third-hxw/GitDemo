#ifndef MULTTASK_H
#define MULTTASK_H

#include <QObject>

class MultTask : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString str READ getStr WRITE setStr NOTIFY strChanged)

public:
    explicit MultTask(QObject *parent = 0);

    Q_INVOKABLE void sendSignal();

    void setStr(QString &str);
    QString getStr() const;
    //void ReturnCateStr(char &_str);
signals:
    //发送截取后的字符串
    void cppSendMsg(const QString &msg);

    void strChanged(QString str);
public slots:
    //接收QML端输入的字符串
    void cppRecvMsg(const QString &msg);
private:
    QString qmlStr;
};

#endif // MULTTASK_H
