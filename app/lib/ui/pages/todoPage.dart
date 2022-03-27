import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gaji/ui/pages/tabs/todayTodo.dart';
import 'package:gaji/ui/pages/tabs/tomorrowTodo.dart';
import 'package:intl/intl.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateFormat('EEEE d').format(DateTime.now());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(today),
          backgroundColor: Colors.transparent,
          bottom: const TabBar(tabs: [
            Tab(text: "Today"),
            Tab(text: "Tomorrow"),
          ]),
        ),
        backgroundColor: Colors.black87,
        body: const TabBarView(
          children: [
            TodayTodo(),
            TomorrowTodo(),
          ],
        ),
      ),
    );
  }
}
