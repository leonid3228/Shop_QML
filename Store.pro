TEMPLATE = app

QT += qml quick widgets sql

SOURCES += main.cpp \
    src/basketmodel.cpp \
    src/database.cpp \
    src/databasemodel.cpp \
   src/selector.cpp

RESOURCES += qml/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
   include/basketmodel.h \
    include/data.h \
    include/database.h \
    include/databasemodel.h \
    include/selector.h

DISTFILES += \
    resources/basket.png
