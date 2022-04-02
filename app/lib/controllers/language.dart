import 'package:flutter/material.dart';
import 'package:gaji/db/local.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/common/language.dart';

//** LANGUAGE CONTROLLER */
final languageController = ChangeNotifierProvider<LanguageController>(
  (ref) {
    final _hiveDB = ref.watch(hiveDB);
    return LanguageController(_hiveDB);
  },
);

class LanguageController with ChangeNotifier {
  LanguageController(this._hiveDB);
  late final HiveDB _hiveDB;

  String get language => _hiveDB.savedLanguage;

  void save(String lang) {
    _hiveDB.saveLanguage(lang);
    notifyListeners();
  }
}

final StateProvider<Map<String, dynamic>> languageDataProvider = StateProvider(
  (ref) {
    final lang = ref.watch(languageController).language;
    switch (lang) {
      case "english":
        return Language.en();
      case "korean":
        return Language.ko();
      case "chinese":
        return Language.ch();
      default:
        return Language.jp();
    }
  },
);
