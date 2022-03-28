import 'package:gaji/provider/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gaji/ui/pages/tabs/todayTodo.dart';
import 'package:gaji/ui/pages/tabs/tomorrowTodo.dart';
import 'package:intl/intl.dart';
import 'package:gaji/ui/widgets/addTodoInputWidget.dart';
import 'package:line_icons/line_icons.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateFormat('EEEE d').format(DateTime.now());

    String mode = ref.watch(themeController).theme;

    void toggleTheme() {
      bool isDark = mode == "light" ? true : false;
      ref.watch(themeController.notifier).toggle(isDark);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: toggleTheme,
                icon: Icon(mode == "light" ? LineIcons.sun : LineIcons.moon))
          ],
          title: Text(today),
          bottom: const TabBar(tabs: [
            Tab(text: "Today"),
            Tab(text: "Tomorrow"),
          ]),
        ),
        body: const TabBarView(
          children: [
            TodayTodo(),
            TomorrowTodo(),
          ],
        ),
        floatingActionButton: const AddTodoInput(),
      ),
    );
  }
}
