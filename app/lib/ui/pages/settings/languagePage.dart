import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show kMaterialSupportedLanguages;
import 'package:non/controllers/locale.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const Map<String, String> localeMap = {
  "en": "English",
  "es": "Espanol",
  "ko": "gksrnrdj",
};

getLocalLangName(String locale) {
  return localeMap[locale];
}

class LanguagePage extends ConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    const List<AppLocale> l = AppLocale.values;

    return Scaffold(
      appBar: AppBar(title: Text(t.language)),
      body: ListView.builder(
        itemCount: l.length,
        itemBuilder: (BuildContext context, int index) {
          final String n = l[index].languageTag;
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      ref.read(localeController.notifier).save(n);
                    },
                    child: Text(getLocalLangName(n))),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}


/**/
/* class Locales { */
/* af */
/* /* - Afrikaans */ */
/* am  */
/* /* Amharic */ */
/* ar  */
/* /* - Arabic */ */
/* as  */
/* /* - Assamese */ */
/* az  */
/* /* - Azerbaijani */ */
/* be  */
/* /* - Belarusian */ */
/* bg  */
/* /* - Bulgarian */ */
/* bn  */
/* /* - Bengali Bangla */ */
/* bs  */
/* /* - Bosnian */ */
/* ca  */
/* /* - Catalan Valencian */ */
/* cs  */
/* /* - Czech */ */
/* da  */
/* /* - Danish */ */
/* de  */
/* /* - German (plus one country variation) */ */
/* el  */
/* /* - Modern Greek */ */
/* en  */
/* /* - English (plus 8 country variations) */ */
/* es  */
/* /* - Spanish Castilian (plus 20 country variations) */ */
/* et  */
/* /* - Estonian */ */
/* eu  */
/* /* - Basque */ */
/* fa  */
/* /* - Persian */ */
/* fi  */
/* /* - Finnish */ */
/* fil  */
/* /* - Filipino Pilipino */ */
/* fr  */
/* /* - French (plus one country variation) */ */
/* gl  */
/* /* - Galician */ */
/* gsw  */
/* /* - Swiss German Alemannic Alsatian */ */
/* gu  */
/* /* - Gujarati */ */
/* he  */
/* /* - Hebrew */ */
/* hi  */
/* /* - Hindi */ */
/* hr  */
/* /* - Croatian */ */
/* hu  */
/* /* - Hungarian */ */
/* hy  */
/* /* - Armenian */ */
/* id  */
/* /* - Indonesian */ */
/* is  */
/* /* - Icelandic */ */
/* it  */
/* /* - Italian */ */
/* ja  */
/* /* - Japanese */ */
/* ka  */
/* /* - Georgian */ */
/* kk  */
/* /* - Kazakh */ */
/* km  */
/* /* - Khmer Central Khmer */ */
/* kn  */
/* /* - Kannada */ */
/* ko  */
/* /* - Korean */ */
/* ky  */
/* /* - Kirghiz Kyrgyz */ */
/* lo  */
/* /* - Lao */ */
/* lt  */
/* /* - Lithuanian */ */
/* lv  */
/* /* - Latvian */ */
/* mk  */
/* /* - Macedonian */ */
/* ml  */
/* /* - Malayalam */ */
/* mn  */
/* /* - Mongolian */ */
/* mr  */
/* /* - Marathi */ */
/* ms  */
/* /* - Malay */ */
/* my  */
/* /* - Burmese */ */
/* nb  */
/* /* - Norwegian Bokmål */ */
/* ne  */
/* /* - Nepali */ */
/* nl  */
/* /* - Dutch Flemish */ */
/* no  */
/* /* - Norwegian */ */
/* or  */
/* /* - Oriya */ */
/* pa  */
/* /* - Panjabi Punjabi */ */
/* pl  */
/* /* - Polish */ */
/* ps  */
/* /* - Pushto Pashto */ */
/* pt  */
/* /* - Portuguese (plus one country variation) */ */
/* ro  */
/* /* - Romanian Moldavian Moldovan */ */
/* ru  */
/* /* - Russian */ */
/* si  */
/* /* - Sinhala Sinhalese */ */
/* sk  */
/* /* - Slovak */ */
/* sl  */
/* /* - Slovenian */ */
/* sq  */
/* /* - Albanian */ */
/* sr  */
/* /* - Serbian (plus 2 scripts) */ */
/* sv  */
/* /* - Swedish */ */
/* sw  */
/* /* - Swahili */ */
/* ta  */
/* /* - Tamil */ */
/* te  */
/* /* - Telugu */ */
/* th  */
/* /* - Thai */ */
/* tl  */
/* /* - Tagalog */ */
/* tr  */
/* /* - Turkish */ */
/* uk  */
/* /* - Ukrainian */ */
/* ur  */
/* /* - Urdu */ */
/* uz  */
/* /* - Uzbek */ */
/* vi  */
/* /* - Vietnamese */ */
/* zh  */
/* /* - Chinese (plus 2 country variations and 2 scripts) */ */
/* zu  */
/* /* - Zulu */ */
/*   } */
/*    */
