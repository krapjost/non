import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gaji/controllers/todo.dart';
import 'package:gaji/models/todo.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({Key? key, required this.isTodayWidget}) : super(key: key);
  final bool isTodayWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int todoLen = ref
        .watch(todoControllerProvider)
        .getUncompletedForDate(isTodayWidget)
        .length;

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                ' $todoLen left',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: ListTile(
        onTap: () {
          context.push('/timer/${todo.id}');
        },
        title: Text(
          todo.description,
        ),
      ),
    );
  }
}

class TodoListWidget extends HookConsumerWidget {
  const TodoListWidget({
    Key? key,
    required this.isTodayWidget,
  }) : super(key: key);

  final bool isTodayWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final TodoController todoController = ref.watch(todoControllerProvider);
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    final List<Todo> todos = todoController.all;

    final List<Widget> todoItems = todos
        .where((todo) {
          final bool isTodayTodo = isTodayWidget
              ? todo.date.day == DateTime.now().day
              : todo.date.day ==
                  DateTime.now().add(const Duration(days: 1)).day;

          return !todo.completed && isTodayTodo;
        })
        .map(
          (todo) => Dismissible(
            resizeDuration: const Duration(milliseconds: 100),
            key: ValueKey(todo.id),
            onDismissed: (direction) {
              if (isTodayWidget) {
                if (direction == DismissDirection.startToEnd) {
                  todoController.update(
                    id: todo.id,
                    description: todo.description,
                    date: todo.date.add(const Duration(days: 1)),
                  );
                } else {
                  todoController.delete(todo.id);
                }
              } else {
                if (direction == DismissDirection.startToEnd) {
                  todoController.delete(todo.id);
                } else {
                  todoController.update(
                    id: todo.id,
                    description: todo.description,
                    date: todo.date.subtract(const Duration(days: 1)),
                  );
                }
              }
            },
            child: TodoItem(todo: todo),
          ),
        )
        .toList();

    return Positioned(
      top: 0,
      width: size.width,
      child: Column(
        children: [
          Toolbar(isTodayWidget: isTodayWidget),
          if (todos.isNotEmpty)
            Divider(
              height: 1,
              color: themeColors.onPrimary.withOpacity(0.5),
            ),
          Container(
            constraints: BoxConstraints(maxHeight: size.height / 2),
            child: SingleChildScrollView(
              child: Column(children: [
                ...todoItems,
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
