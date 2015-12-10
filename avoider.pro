#-------------------------------------------------
#
# Project created by QtCreator 2015-11-05T21:16:07
#
#-------------------------------------------------

QT       += core quick quickwidgets

TARGET = avoider
TEMPLATE = app


SOURCES += src/main.cpp

HEADERS  +=

FORMS    +=

CONFIG += mobility
MOBILITY = 

DISTFILES += \
    android/AndroidManifest.xml


OTHER_FILES+=

RESOURCES += \
    rc/img.qrc  \
    rc/tr.qrc    \
    rc/qml.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

qtPrepareTool(LRELEASE, lrelease)

TRANSLATIONS += rc/tr/avoider_pl.ts

QMAKE_EXTRA_COMPILERS += lrelease
lrelease.input         = TRANSLATIONS
lrelease.output        = ${QMAKE_FILE_BASE}.qm
lrelease.commands      = $$LRELEASE ${QMAKE_FILE_IN} -qm $$PWD/rc/tr/qm/${QMAKE_FILE_BASE}.qm
lrelease.CONFIG       += no_link target_predeps
