
#include <cassert>

#include <QApplication>
#include <QPainter>
#include <QQuickWidget>
#include <QScreen>
#include <QSplashScreen>
#include <QTranslator>
#include <QString>



int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickWidget view;    

    QString locale = QLocale::system().name();  // Reading locale settings

    QTranslator translator;

// Locale switcher

    if (locale == "pl_PL")
    {
      const bool load = translator.load("avoider_pl", ":/tr");    // Loading polish translation
      const bool install = app.installTranslator(&translator);
          assert(load && install);    // Assert for loading translation
    }else if (locale == "de_DE")
    {
      const bool load = translator.load("avoider_de", ":/tr");    // Loading german translation
      const bool install = app.installTranslator(&translator);
          assert(load && install);    // Assert for loading translation
    }else if (locale == "fr_FR")
    {
      const bool load = translator.load("avoider_fr", ":/tr");    // Loading french translation
      const bool install = app.installTranslator(&translator);
          assert(load && install);    // Assert for loading translation
    }else
    {
      const bool load = true;
      const bool install = true;
          assert(load && install);    // Assert for loading translation
    }



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
