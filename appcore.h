#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QSettings>
#include <QStandardPaths>


class AppCore : public QObject
{
    Q_OBJECT
public:
    explicit AppCore(QObject *parent = nullptr);
    void init();
    ~AppCore();
signals:
    void openDialog();
    void addMessage(QString _message);
    void loadLastUserName(QString _userName);

public slots:
    void loginUser(QString _userName);
    void sendMessage(QString _message);
    void readMessageFromServer();

private:
    QString userName, botName;
    QNetworkAccessManager *nam;
    void sendMessageToServer(QString _userName, QString _message);

};

#endif // APPCORE_H
