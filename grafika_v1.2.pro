TEMPLATE = app
TARGET = Grafika v1.0

QT += quick positioning widgets

SOURCES += main.cpp \
    glownaKlasa.cpp

HEADERS += \
    glownaKlasa.h

OTHER_FILES +=

RESOURCES += \
    grafika.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/positioning/satelliteinfo

INSTALLS += target

DISTFILES += \
    ../Qt odrzuty - kawałki kodu.txt



