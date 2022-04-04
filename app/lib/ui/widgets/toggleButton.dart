import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:non/provider/state.dart';

class ToggleButton extends ConsumerWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return ToggleButtons(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 8.0),
            child: Text(t.today),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 13.0),
            child: Text(t.tomorrow),
          ),
        ],
        onPressed: (index) {
          final isSelected = ref.watch(todayOrTomorrowSelectProvider.notifier);

          for (int buttonIndex = 0;
              buttonIndex < isSelected.state.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected.state = [false, true];
            } else {
              isSelected.state = [true, false];
            }
          }
        },
        isSelected: ref.watch(todayOrTomorrowSelectProvider));
  }
}
