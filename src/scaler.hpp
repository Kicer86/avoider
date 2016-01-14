#ifndef SCALER_HPP
#define SCALER_HPP

#include <QObject>
#include <QSize>

class QWindow;

class ScalerObject: public QObject
{
        friend class Scaler;
        Q_OBJECT

    public:
        Q_PROPERTY (double scale READ scale NOTIFY scaleChanged)

    private:
        QSize m_base;
        QSize m_real;
        double m_xScale;
        double m_yScale;
        QWindow* m_window;

        ScalerObject(const QSize &, QWindow *);

        void updateRealWidth(int);
        void updateRealHeight(int);
        void recalculate();

        double scale() const;

    signals:
        void scaleChanged(double newValue);
};


struct Scaler
{
    Scaler(const QSize& base, QWindow* window);
    ~Scaler();
};

#endif // SCALER_HPP
