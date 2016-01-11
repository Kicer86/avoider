
#include "scaler.hpp"

#include <cassert>

#include <QtQml>
#include <QWindow>


namespace
{
    ScalerObject * g_scaler;

    QObject *scalerProvider(QQmlEngine *, QJSEngine *)
    {
        assert(g_scaler != nullptr);

        return g_scaler;
    }
}


ScalerObject::ScalerObject(const QSize& base, QWindow* window):
    m_base(base),
    m_real(window->size()),
    m_xScale(0.0),
    m_yScale(0.0),
    m_window(window)
{
    QObject::connect(window, &QWindow::widthChanged,  this, &ScalerObject::updateRealWidth);
    QObject::connect(window, &QWindow::heightChanged, this, &ScalerObject::updateRealHeight);
}


void ScalerObject::updateRealWidth(int w)
{
    m_real.setWidth(w);

    recalculate();
}


void ScalerObject::updateRealHeight(int h)
{
    m_real.setHeight(h);

    recalculate();
}


void ScalerObject::recalculate()
{
    if (m_real.isEmpty() == false)
    {
        m_xScale = m_real.width()  / double(m_base.width());
        m_yScale = m_real.height() / double(m_base.height());

        emit scaleChanged(scale());
    }
}


double ScalerObject::scale() const
{
    return m_xScale < m_yScale? m_xScale: m_yScale;
}


Scaler::Scaler(const QSize& base, QWindow* window)
{
    assert(g_scaler == nullptr);
    g_scaler = new ScalerObject(base, window);

    qmlRegisterSingletonType<ScalerObject>("avoider.scaler", 1, 0, "AvoiderApi", &scalerProvider);
}


Scaler::~Scaler()
{
    g_scaler = nullptr;
}
