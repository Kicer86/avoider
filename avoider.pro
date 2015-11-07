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
    rc/qml/avoider.qml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat


OTHER_FILES+=

RESOURCES += \
    rc/resources.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
