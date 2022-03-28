import 'package:flutter/widgets.dart';
import 'package:gaji/db/local.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//** THEME CONTROLLER */
final themeController = ChangeNotifierProvider<ThemeController>((ref) {
  final _hiveDB = ref.watch(hiveDB);

  return ThemeController(_hiveDB);
});

class ThemeController with ChangeNotifier {
  ThemeController(this._hiveDB);

  late final HiveDB _hiveDB;

  String get theme => _hiveDB.savedTheme;

  void toggle(bool mode) {
    (mode) ? _hiveDB.toggleSaveTheme("dark") : _hiveDB.toggleSaveTheme("light");

    notifyListeners();
  }
}
