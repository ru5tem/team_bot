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

    QSettings settings;
    userName = settings.value("lastUserName").toString();
    emit loadLastUserName(userName);
}

AppCore::~AppCore()
{
    delete nam;
}

void AppCore::loginUser(QString _userName)
{
    userName = _userName;

    QSettings settings;
    settings.setValue("lastUserName" , userName);
    settings.sync();
    emit openDialog();
}

void AppCore::sendMessage(QString _message)
{
    //Отправка сообщения в чат
    emit addMessage(userName +": "+_message);
    //Отправка сообщения на сервер
    sendMessageToServer(userName, _message);
}

void AppCore::readMessageFromServer()
{
    QString botName, message;
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());

    if (reply->error())
    {
        emit addMessage(reply->errorString());
        emit addMessage(reply->request().url().toString());
        return;
    }

    /*Обработка сообщения*/
    QByteArray response = reply->readAll();
    QXmlStreamReader reader(response);
    while (!reader.atEnd() && !reader.hasError())
    {
        QXmlStreamReader::TokenType token = reader.readNext();
        if (token == QXmlStreamReader::StartDocument)
            continue;
        if (token == QXmlStreamReader::StartElement)
        {
            if (reader.name() == "bot_name")
            {
                reader.readNext();
                botName = reader.text().toString();
            }
            if (reader.name() == "response")
            {
                reader.readNext();
                message = reader.text().toString();
            }
        }
    }

    emit addMessage(botName +": "+message);
}

void AppCore::sendMessageToServer(QString _userName, QString _message)
{
    QString botServer = "http://host1.demoproject2f.techcd.ru/chatbot/conversation_start.php?bot_id=2&say="+_message+"&format=xml&Name="+_userName;

    QUrl url = QUrl(botServer);
    QNetworkRequest request(url);

    request.setRawHeader("User-Agent", "Mozilla/5.0 (compatible; Rigor/1.0.0; http://rigor.com)");
    request.setRawHeader("Accept", "*/*");


    QNetworkReply* reply = nam->get(request);
    connect(reply, SIGNAL(finished()),this, SLOT(readMessageFromServer()));
}
