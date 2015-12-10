
#include <cassert>

#include <QApplication>
#include <QPainter>
#include <QQuickWidget>
#include <QScreen>
#include <QSplashScreen>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickWidget view;

    QTranslator translator;

    const bool load = translator.load("avoider_pl", ":/tr");
    const bool install = app.installTranslator(&translator);

    assert(load && install);

#if defined(Q_OS_ANDROID)

    QScreen* screen = app.primaryScreen();
    QRect geometry = screen->geometry();

    QPixmap pixmap(geometry.size());
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

    view.setResizeMode(QQuickWidget::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/qml/avoider.qml"));
    view.show();

    return app.exec();
}
