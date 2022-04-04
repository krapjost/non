import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:non/controllers/todo.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthTab extends ConsumerWidget {
  const MonthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoController = ref.watch(todoControllerProvider);

    final todos = todoController.all;

    return Column(
      children: [
        TableCalendar(
          calendarBuilders: CalendarBuilders(todayBuilder: (
            b,
            c,
            f,
          ) {
            return Container(
                width: MediaQuery.of(b).size.width,
                height: MediaQuery.of(b).size.height,
                color: Colors.red,
                child: Center(child: Text('${c.day}')));
          }),
          locale: LocaleSettings.currentLocale.languageTag,
          calendarFormat: CalendarFormat.month,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                key: UniqueKey(),
                title: Text(todos[index].description),
              );
            },
          ),
        ),
      ],
    );
  }
}
