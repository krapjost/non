/* import 'package:firebase_core/firebase_core.dart'; */
import 'package:flutter/material.dart';
import 'package:non/db/local.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:non/models/todo.dart';
import 'package:non/controllers/theme.dart';
import 'package:non/ui/router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AppRouter().router;

    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: LocaleSettings.supportedLocales,
      theme: ref.watch(themeDataProvider.state).state,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  final _hiveDB = HiveDB();
  await _hiveDB.initTodoBox();
  await _hiveDB.initThemeBox();
  await _hiveDB.initLocaleBox();
  /* await Firebase.initializeApp(); */

  runApp(
    ProviderScope(overrides: [
      hiveDB.overrideWithValue(_hiveDB),
    ], child: TranslationProvider(child: const App())),
  );
}
