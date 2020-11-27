TEMPLATE = app

QT += quick qml
SOURCES += main.cpp \
   room_item.cpp

RESOURCES += dynamicscene.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/qml/dynamicscene
INSTALLS += target

HEADERS += \
   room_item.h
