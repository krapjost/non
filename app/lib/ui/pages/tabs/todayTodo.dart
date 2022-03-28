import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:gaji/controllers/todo.dart';
import 'package:gaji/provider/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaji/ui/widgets/todoListWidget.dart';
import 'package:gaji/ui/widgets/addTodoInputWidget.dart';
import 'package:line_icons/line_icons.dart';

class TodayTodo extends HookConsumerWidget {
  const TodayTodo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier isOnEditing = useState(false);

    return Stack(
      alignment: Alignment.center,
      children: [
        const TodoListWidget(
          isTodayWidget: true,
        ),
        isOnEditing.value
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white10,
                ),
              )
            : const SizedBox(),
        if (kDebugMode) const DeleteAllButton(), //for debug
        AddTodoInput(
          isOnEditing: isOnEditing,
        ),
      ],
    );
  }
}

//for debug
class DeleteAllButton extends ConsumerWidget {
  const DeleteAllButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TodoController todoController = ref.watch(todoControllerProvider);
    return Positioned(
      bottom: 80,
      right: 20,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            todoController.clear();
          },
          child: const Icon(
            LineIcons.times,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
