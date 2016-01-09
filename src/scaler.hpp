#ifndef SCALER_HPP
#define SCALER_HPP


class QSize;


struct Scaler
{
        static void setup(const QSize& base, const QSize& real);

        static void updateRealWidth(int);
        static void updateRealHeight(int);

    private:
        static void recalculate();
};

#endif // SCALER_HPP
