import 'package:flutter/material.dart';
import 'package:gaji/db/local.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//** LOCALE CONTROLLER */
final localeController = ChangeNotifierProvider<LocaleController>(
  (ref) {
    final _hiveDB = ref.watch(hiveDB);
    return LocaleController(_hiveDB);
  },
);

class LocaleController with ChangeNotifier {
  LocaleController(this._hiveDB);
  late final HiveDB _hiveDB;

  String get locale => _hiveDB.savedLocale;

  void save(String locale) {
    _hiveDB.saveLocale(locale);
    notifyListeners();
  }
}
