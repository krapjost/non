import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/provider/provider.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> completedList = ref
        .watch(todoListProvider)
        .where((todo) => todo.completed)
        .map(
          (todo) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(4),
            color: Colors.white,
            child: Text(
              todo.description,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        )
        .toList();
    return Column(
      children: completedList,
    );
  }
}
