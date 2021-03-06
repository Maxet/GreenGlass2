TEMPLATE = app

QT += qml quick positioning location

CONFIG += c++11

SOURCES += main.cpp \
    datasnapshot.cpp \
    firebase.cpp \
    json.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    datasnapshot.h \
    firebase.h \
    json.h
