
#include "scaler.hpp"

#include <QtQml>


namespace
{
    QRect g_base;
    QRect g_real;

    double g_xScale;
    double g_yScale;

    QJSValue scaleProvider(QQmlEngine *, QJSEngine *scriptEngine)
    {
        QJSValue value = scriptEngine->newObject();
        value.setProperty("xScale", g_xScale);
        value.setProperty("yScale", g_yScale);

        return value;
    }
}


void setup(const QRect& base, const QRect& real)
{
    g_base = base;
    g_real = real;
    g_xScale = base.width() / real.width();
    g_yScale = base.height() / real.height();

    qmlRegisterSingletonType("avoider.scaler", 1, 0, "AvoiderApi", scaleProvider);
}
