#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "firebase.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);


    Firebase *firebase=new Firebase("https://firexample.firebaseio.com/");
     firebase->setToken("AIzaSyCwoHVYS_N5ktPsd-yyMKvrU8YDCw-AtVU");


    QQmlApplicationEngine engine;
//    QQmlContext* rcontext =  engine.rootContext();
//    engine.rootContext()->setContextProperty("firebase",firebase);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));



    return app.exec();
}
