import 'package:l/l.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:non/controllers/todo.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:non/models/todo.dart';
import 'package:non/ui/widgets/addTodoInputWidget.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekTab extends HookConsumerWidget {
  const WeekTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final todoController = ref.watch(todoControllerProvider);

    final _startingDayOfWeek =
        StartingDayOfWeek.values[DateTime.now().weekday - 1];

    final _calendarFormatState = useState(CalendarFormat.week);
    final _focusedDayState = useState(now);

    final todos = todoController.all
        .where((todo) => todo.date.day == _focusedDayState.value.day)
        .toList();

    return Stack(
      children: [
        Column(
          children: [
            TableCalendar(
              onHeaderTapped: (date) {
                l.i("header tapped $date ${DateTime.now().add(const Duration(days: 1)).weekday}");
              },
              onDaySelected: (selectedDay, focusedDay) {
                l.i("onday selected $selectedDay, focused $focusedDay");
                l.i("state = ${_focusedDayState.value}");
                _focusedDayState.value = focusedDay;
              },
              onFormatChanged: (format) {
                l.i("format ? $format");
                _calendarFormatState.value = format;
              },
              locale: LocaleSettings.currentLocale.languageTag,
              calendarFormat: _calendarFormatState.value,
              startingDayOfWeek: _startingDayOfWeek,
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 3, 14),
              selectedDayPredicate: (day) =>
                  _focusedDayState.value.day == day.day,
              focusedDay: _focusedDayState.value,
              /* currentDay: now, */
            ),
            const Divider(),
            CalenderTodoList(todos: todos),
          ],
        ),
        const Positioned(
            right: 16,
            bottom: 16,
            child: AddTodoInput(
              addTodoFor: "asdas",
            )),
      ],
    );
  }
}

class CalenderTodoList extends StatelessWidget {
  const CalenderTodoList({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: UniqueKey(),
            title: Text(todos[index].description),
          );
        },
      ),
    );
  }
}
