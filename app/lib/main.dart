import 'package:flutter/material.dart';
import 'package:gaji/db/local.dart';
import 'package:gaji/models/todo.dart';
/* import 'package:home_widget/home_widget.dart'; */
/* import 'package:firebase_core/firebase_core.dart'; */
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/ui/router.dart';

/* Future<void> backgroundCallback(Uri? uri) async { */
/*   if (uri?.host == 'updatecounter') { */
/*     int _counter = 0; */
/*     await HomeWidget.getWidgetData<int>('_counter', defaultValue: 0) */
/*         .then((value) { */
/*       _counter = value!; */
/*       _counter++; */
/*     }); */
/*     await HomeWidget.saveWidgetData<int>('_counter', _counter); */
/*     await HomeWidget.updateWidget( */
/*         name: 'AppWidgetProvider', iOSName: 'AppWidgetProvider'); */
/*   } */
/* } */

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;

    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
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

  /* HomeWidget.registerBackgroundCallback(backgroundCallback); */
  /* await Firebase.initializeApp(); */
  runApp(
    ProviderScope(overrides: [
      hiveDB.overrideWithValue(_hiveDB),
    ], child: const App()),
  );
}
