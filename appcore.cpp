#include "appcore.h"
#include <QNetworkRequest>
#include <QNetworkReply>

#include <QUrl>
#include <QString>
#include <QXmlStreamReader>
#include <QTextCodec>

AppCore::AppCore(QObject *parent) : QObject(parent)
{

}

void AppCore::init()
{
    nam = new QNetworkAccessManager(this);
    botName = "Bot";
}

void AppCore::loginUser(QString _userName)
{
    userName = _userName;
    emit openDialog();
}

void AppCore::sendMessage(QString _message)
{
    //Отправка сообщения в чат
    emit addMessage(userName +": "+_message);
    //Отправка сообщения на сервер
    sendMessageToServer(userName, _message);
}

void AppCore::readMessageFromServer(/*QNetworkReply *reply*/)
{
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());

    if (reply->error())
    {
        qDebug() << reply->errorString();
        qDebug() << reply->error();
        emit addMessage(reply->errorString());
        emit addMessage(reply->request().url().toString());
        return;
    }

    emit addMessage("Сообщение получено");
    QByteArray response = reply->readAll();

    /*Обработка сообщения*/
    //QXmlStreamReader reader(response);
    //QString botName =
    //QString message =
    //emit addMessage(botName +": "+message);

}

void AppCore::sendMessageToServer(QString _userName, QString _message)
{
    QString botServer = "http://host1.demoproject2f.techcd.ru/chatbot/conversation_start.php?bot_id=2&say="+_message+"&format=xml&Name="+_userName;

    QUrl url = QUrl(botServer);
    QNetworkRequest request(url);
    request.setRawHeader("Nokia5250/10.0.011 (SymbianOS/9.4; U; Series60/5.0 Mozilla/5.0; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/525 (KHTML, like Gecko) Safari/525 3gpp-gba", "MyApp 1.0");
    request.setRawHeader("Cache-Control", "no-cache");
    request.setRawHeader("Content-Type", "text/html");
    request.setRawHeader("Accept", "*/*");

    QNetworkReply* reply = nam->get(request);
    connect(reply, SIGNAL(finished()),this, SLOT(readMessageFromServer()));
}
