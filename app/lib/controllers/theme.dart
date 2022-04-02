import 'package:flutter/material.dart';
import 'package:gaji/db/local.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/common/theme.dart';

//** THEME CONTROLLER */
final themeController = ChangeNotifierProvider<ThemeController>(
  (ref) {
    final _hiveDB = ref.watch(hiveDB);
    return ThemeController(_hiveDB);
  },
);

class ThemeController with ChangeNotifier {
  ThemeController(this._hiveDB);
  late final HiveDB _hiveDB;

  String get theme => _hiveDB.savedTheme;

  void save(String mode) {
    _hiveDB.saveTheme(mode);
    notifyListeners();
  }
}

final StateProvider<ThemeData> themeDataProvider = StateProvider(
  (ref) {
    final mode = ref.watch(themeController).theme;
    switch (mode) {
      case "dark":
        return AppTheme.dark();
      case "light":
        return AppTheme.light();
      case "blue":
        return AppTheme.blue();
      default:
        return AppTheme.red();
    }
  },
);
