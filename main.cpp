#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QTextCodec>
#include "appcore.h"

int main(int argc, char *argv[])
{
    //QTextCodec::setCodecForCStrings(QTextCodec::codecForName("UTF8"));
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("Test");
    QCoreApplication::setApplicationName("TeamBot");


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    AppCore appCore;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("appCore", &appCore);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    appCore.init();
    return app.exec();
}
