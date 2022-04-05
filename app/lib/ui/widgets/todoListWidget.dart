import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:non/controllers/todo.dart';
import 'package:non/models/todo.dart';
import 'package:non/ui/widgets/addTodoInputWidget.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({Key? key, required this.todoFor}) : super(key: key);
  final String todoFor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int todoLen =
        ref.watch(todoControllerProvider).getUncompletedFor(todoFor).length;

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
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1,
        child: ListTile(
          onTap: () {
            context.push('/timer/${todo.id}');
          },
          title: Text(
            todo.description,
          ),
        ),
      ),
    );
  }
}

class TodoListWidget extends HookConsumerWidget {
  const TodoListWidget({
    Key? key,
    required this.todoFor,
  }) : super(key: key);

  final String todoFor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final TodoController todoController = ref.watch(todoControllerProvider);
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    final List<Todo?> todos = todoController.getUncompletedFor(todoFor);

    final List<Widget> todoItems = todos.isEmpty
        ? [const Text("Empty")]
        : todos
            .map(
              (todo) => Dismissible(
                secondaryBackground: Container(color: Colors.red),
                background: Container(color: Colors.blue),
                resizeDuration: const Duration(milliseconds: 100),
                key: ValueKey(todo!.id),
                onDismissed: (direction) {
                  if (todo.date.day == DateTime.now().day) {
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
      bottom: 0,
      width: size.width,
      /* height: size.height - 200, */
      child: Column(
        children: [
          Container(
              constraints:
                  BoxConstraints.loose(Size(size.width, size.height - 200)),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(children: todoItems))),
          /* if (todos.isNotEmpty) const Divider(), */
          /* Toolbar(todoFor: todoFor), */
          /* const Divider(), */
          AddTodoInput(addTodoFor: todoFor),
        ],
      ),
    );
  }
}
