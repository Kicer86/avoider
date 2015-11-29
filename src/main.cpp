
#include <QApplication>
#include <QQuickWidget>

#include <QSplashScreen>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QPixmap pixmap(":/img/background.jpg");
    QSplashScreen splash(pixmap);
    splash.show();
    app.processEvents();

    QQuickWidget view;
    splash.finish(&view);
    view.setResizeMode(QQuickWidget::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/qml/avoider.qml"));
    view.show();

    return app.exec();
}
