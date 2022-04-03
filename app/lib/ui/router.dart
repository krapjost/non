import 'package:non/ui/pages/settingPage.dart';
import 'package:non/ui/pages/settings/languagePage.dart';
import 'package:non/ui/pages/settings/themePage.dart';
import 'package:go_router/go_router.dart';
import 'package:non/ui/pages/homePage.dart';
import 'package:non/ui/pages/loginPage.dart';
import 'package:non/ui/pages/timerPage.dart';
import 'package:non/ui/pages/todoPage.dart';

class AppRouter {
  get router => _router;
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/theme',
        builder: (context, state) => const ThemePage(),
      ),
      GoRoute(
        path: '/language',
        builder: (context, state) => const LanguagePage(),
      ),
      GoRoute(
        path: '/todo',
        builder: (context, state) {
          return const TodoPage();
        },
      ),
      GoRoute(
        path: '/timer/:pid',
        builder: (context, state) {
          final String todoId = state.params['pid']!;
          return TimerPage(todoId: todoId);
        },
      )
    ],
  );
}
