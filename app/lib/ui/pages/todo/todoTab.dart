import 'dart:ui';
import 'package:non/provider/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:non/ui/widgets/todoListWidget.dart';

class TodoTab extends ConsumerWidget {
  const TodoTab({Key? key, required this.todoFor}) : super(key: key);
  final String todoFor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasFocus = ref.watch(focustStateControllerProvider.state).state;
    final Color filterColor =
        Theme.of(context).colorScheme.onPrimary.withOpacity(0.2);

    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned.fill(child: SizedBox()),
        TodoListWidget(
          todoFor: todoFor,
        ),
        /* hasFocus */
        /*     ? BackdropFilter( */
        /*         filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), */
        /*         child: Container( */
        /*           color: filterColor, */
        /*         ), */
        /*       ) */
        /*     : const SizedBox(), */
      ],
    );
  }
}
