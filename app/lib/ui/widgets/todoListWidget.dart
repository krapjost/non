import 'package:flutter/material.dart';
import 'package:gaji/provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                ' ${ref.watch(uncompletedTodosCount).toString()} left',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.brown.shade300, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem extends HookConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);
    return Material(
      color: Colors.black,
      shadowColor: Colors.brown,
      elevation: 2,
      child: ListTile(
        onTap: () {
          context.push('/timer/${todo.id}');
        },
        title: Text(
          todo.description,
          style: const TextStyle(color: Colors.white),
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
    final todos = ref.watch(filteredTodos);

    final List<Widget> todoItems = ref
        .watch(todoListProvider)
        .where((todo) {
          final doDate = DateTime.parse(todo.date).day;
          final bool isTodayTodo = isTodayWidget
              ? doDate == DateTime.now().day
              : doDate == DateTime.now().add(const Duration(days: 1)).day;

          return !todo.completed && isTodayTodo;
        })
        .map(
          (todo) => Dismissible(
            resizeDuration: const Duration(milliseconds: 100),
            key: ValueKey(todo.id),
            onDismissed: (direction) {
              if (isTodayWidget) {
                if (direction == DismissDirection.startToEnd) {
                  ref.read(todoListProvider.notifier).edit(
                        id: todo.id,
                        description: todo.description,
                        date: DateTime.parse(todo.date)
                            .add(const Duration(days: 1))
                            .toString(),
                      );
                } else {
                  ref.read(todoListProvider.notifier).remove(todo);
                }
              } else {
                if (direction == DismissDirection.startToEnd) {
                  ref.read(todoListProvider.notifier).remove(todo);
                } else {
                  ref.read(todoListProvider.notifier).edit(
                        id: todo.id,
                        description: todo.description,
                        date: DateTime.parse(todo.date)
                            .subtract(const Duration(days: 1))
                            .toString(),
                      );
                }
              }
            },
            child: ProviderScope(
              overrides: [
                currentTodo.overrideWithValue(todo),
              ],
              child: const TodoItem(),
            ),
          ),
        )
        .toList();

    return Positioned(
      top: 0,
      width: size.width,
      child: Column(
        children: [
          const Toolbar(),
          if (todos.isNotEmpty)
            const Divider(
              height: 1,
              color: Colors.white54,
            ),
          Container(
            constraints: BoxConstraints(maxHeight: size.height * 0.4),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                color: Colors.brown.shade500,
                axisDirection: AxisDirection.down,
                child: SingleChildScrollView(
                  child: Column(children: todoItems),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
