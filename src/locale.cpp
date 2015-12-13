#include "locale.h"
#include "QTranslator"
#include "QApplication"
#include <cassert>

Locale::Locale()
{

}

Locale::~Locale()
{

}

// Locale switcher
void Locale::changeLocale(const QString &locale){


  if (locale == "pl_PL")
  {
    const bool load = translator.load("avoider_pl", ":/tr");    // Loading polish translation
    const bool install = QApplication::installTranslator(&translator);
        assert(load && install);    // Assert for loading translation
  }else if (locale == "de_DE")
  {
    const bool load = translator.load("avoider_de", ":/tr");    // Loading german translation
    const bool install = QApplication::installTranslator(&translator);
        assert(load && install);    // Assert for loading translation
  }else if (locale == "fr_FR")
  {
    const bool load = translator.load("avoider_fr", ":/tr");    // Loading french translation
    const bool install = QApplication::installTranslator(&translator);
        assert(load && install);    // Assert for loading translation
  }else
  {
    const bool load = true;
    const bool install = true;
        assert(load && install);    // Assert for loading translation
  }
}
