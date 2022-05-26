TEMPLATE = app

QT += qml quick widgets sql

SOURCES += main.cpp \
    basketmodel.cpp \
    database.cpp \
    databasemodel.cpp \
    selector.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    basketmodel.h \
    data.h \
    database.h \
    databasemodel.h \
    selector.h

DISTFILES += \
    resources/basket.png
