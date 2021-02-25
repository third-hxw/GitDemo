#ifndef CPPOBJ_H
#define CPPOBJ_H

#include <QObject>

class CppObj : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
public:
    explicit CppObj(QObject *parent = 0);

    Q_INVOKABLE void sendSignal();

    void setName(QString &name);
    QString getName() const;

signals:

    void cppSignal(const QString &msg);
    void nameChanged(const QString name);

public slots:
    void cppRecvMsg(QString msg);

private:

    QString myName;
};

#endif // CPPOBJ_H
