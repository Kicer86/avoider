#include <cassert>
#include <QApplication>
#include <QPainter>
#include <QQuickView>
#include <QScreen>
#include <QSplashScreen>
#include <QTranslator>
#include <QString>

#include "locale.h"  // defines Locale class
#include "scaler.hpp"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickView view;

    QString locale = QLocale::system().name();  // Reading locale settings

    Locale trans_change;
    trans_change.changeLocale(locale);

    Scaler scaler(QSize(800, 600), &view);

#if defined(Q_OS_ANDROID)

    // loading screen on Android

    QPixmap pixmap(view.size());
    pixmap.fill(Qt::black);

    QPainter painter(&pixmap);
    painter.setPen(Qt::white);
    painter.setFont(QFont("Arial", 20));
    painter.drawText(geometry, Qt::AlignCenter, QObject::tr("Loading..."));

    QSplashScreen splash(pixmap);
    splash.show();
    app.processEvents();

    splash.finish(&view);

#endif

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/qml/avoider.qml"));
    view.show();

    return app.exec();
}


