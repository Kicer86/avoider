#-------------------------------------------------
#
# Project created by QtCreator 2015-11-05T21:16:07
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets quick

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
    rc/resources.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
