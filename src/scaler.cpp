
#include "scaler.hpp"

#include <QtQml>


namespace
{
    QSize g_base;
    QSize g_real;

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


void Scaler::setup(const QSize& base, const QSize& real)
{
    g_base = base;
    g_real = real;

    recalculate();

    qmlRegisterSingletonType("avoider.scaler", 1, 0, "AvoiderApi", scaleProvider);
}


void Scaler::updateRealWidth(int w)
{
    g_real.setWidth(w);

    recalculate();
}


void Scaler::updateRealHeight(int h)
{
    g_real.setHeight(h);

    recalculate();
}


void Scaler::recalculate()
{
    if (g_real.isEmpty() == false)
    {
        g_xScale = g_base.width()  / g_real.width();
        g_yScale = g_base.height() / g_real.height();
    }
}
