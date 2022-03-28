import 'dart:ui';
import 'package:gaji/provider/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gaji/ui/widgets/todoListWidget.dart';

class TomorrowTodo extends ConsumerWidget {
  const TomorrowTodo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFocus = ref.watch(focustStateControllerProvider.state).state;

    return Stack(
      alignment: Alignment.center,
      children: [
        const TodoListWidget(isTodayWidget: false),
        hasFocus
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white10,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
