#ifndef FILEIOPLUGIN_H
#define FILEIOPLUGIN_H

#include <QObject>
#include <QQmlExtensionPlugin>

class FileioPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
public:
    explicit FileioPlugin(QObject *parent = 0);
    void registerTypes(const char *uri);

signals:

public slots:
};

#endif // FILEIOPLUGIN_H
