#ifndef LOCALE_H
#define LOCALE_H

#include <QTranslator>

class QString;

class Locale
{
public:
    Locale();
    ~Locale();
    void changeLocale(const QString &locale);

private:
    QTranslator translator;
};


#endif // LOCALE_H
