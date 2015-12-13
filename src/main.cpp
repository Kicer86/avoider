
#include <cassert>

#include <QApplication>
#include <QPainter>
#include <QQuickWidget>
#include <QScreen>
#include <QSplashScreen>
#include <QTranslator>
#include <QString>
#include <QQmlContext>

class TranslationChange : public QObject{
 Q_OBJECT
 Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

   QString getEmptyString() {
   return "";
  }



   Q_INVOKABLE void selectLanguage(QString language) {
       QTranslator translator;

       if(language == QString("fr")) {
      translator.load("avoider_fr", ":/tr");    // Loading french translation
      qApp->installTranslator(&translator);
     }

     if(language == QString("de")) {
      translator.load("avoider_de", ":/tr");    // Loading german translation
      qApp->installTranslator(&translator);
     }

     if(language == QString("en")) {
      qApp->removeTranslator(&translator);
     }

     emit languageChanged();
    }

    signals:
     void languageChanged();
};


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickWidget view;


    TranslationChange myObj;
//    QTranslator translator;

//    const bool load = translator.load("avoider_pl", ":/tr");    // Loading polish translation
//    const bool load2 = translator.load("avoider_de", ":/tr");    // Loading german translation
//    const bool load3 = translator.load("avoider_fr", ":/tr");    // Loading french translation

//    const bool install = app.installTranslator(&translator);

//    assert(load && install);

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
    view.rootContext()->setContextProperty("rootItem", (QObject*)&myObj); //tr
    view.setResizeMode(QQuickWidget::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/qml/avoider.qml"));
    view.show();

    return app.exec();
}
