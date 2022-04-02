import 'package:flutter/material.dart';
import 'package:gaji/ui/pages/historyPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:gaji/ui/pages/todoPage.dart';
import 'package:gaji/ui/pages/calenderPage.dart';
import 'package:gaji/provider/state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int page = ref.watch(pageProvider.state).state;
    final bool hasFocus = ref.watch(focustStateControllerProvider.state).state;

    final pages = [
      const TodoPage(),
      const CalenderPage(),
      const HistoryPage(),
    ];

    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: hasFocus ? 0 : 55,
        child: hasFocus
            ? SizedBox(width: MediaQuery.of(context).size.width)
            : BottomNavigationBar(
                currentIndex: page,
                onTap: (index) {
                  ref.read(pageProvider.state).state = index % pages.length;
                },
                items: const [
                  BottomNavigationBarItem(
                      tooltip: "todo",
                      label: "todo",
                      icon: Icon(LineIcons.tasks)),
                  BottomNavigationBarItem(
                      tooltip: "calender",
                      label: "calender",
                      icon: Icon(LineIcons.calendarCheck)),
                  BottomNavigationBarItem(
                      tooltip: "history",
                      label: "history",
                      icon: Icon(LineIcons.history)),
                ],
              ),
      ),
      body: pages[page],
    );
  }
}
