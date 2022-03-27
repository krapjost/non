import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaji/ui/widgets/todoListWidget.dart';
import 'package:gaji/ui/widgets/addTodoInputWidget.dart';

class TomorrowTodo extends HookConsumerWidget {
  const TomorrowTodo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier isOnEditing = useState(false);

    return Stack(
      alignment: Alignment.center,
      children: [
        const TodoListWidget(isTodayWidget: false),
        isOnEditing.value
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white10,
                ),
              )
            : const SizedBox(),
        AddTodoInput(
          isOnEditing: isOnEditing,
        ),
      ],
    );
  }
}
