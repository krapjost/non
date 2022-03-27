import 'package:go_router/go_router.dart';
import 'package:gaji/ui/pages/homePage.dart';
import 'package:gaji/ui/pages/loginPage.dart';
import 'package:gaji/ui/pages/timerPage.dart';
import 'package:gaji/ui/pages/todoPage.dart';

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
