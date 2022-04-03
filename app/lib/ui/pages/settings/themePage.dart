import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:non/controllers/theme.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

List<String> themes = ["dark", "light", "blue", "red"];
List<Color> themeColors = [Colors.black, Colors.white, Colors.blue, Colors.red];

class ThemePage extends HookConsumerWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<int> currentIndex = useState(0);
    final Size size = MediaQuery.of(context).size;
    final t = Translations.of(context);

    void saveTheme(String theme) {
      ref.watch(themeController.notifier).save(theme);
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(t.theme),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveTheme(themes[currentIndex.value]);
        },
        child: const Icon(LineIcons.saveAlt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: themeColors[currentIndex.value].withOpacity(0.5),
        child: ListWheelScrollView(
          itemExtent: size.width / 2,
          physics: const FixedExtentScrollPhysics(),
          controller: FixedExtentScrollController(),
          onSelectedItemChanged: (index) {
            currentIndex.value = index;
          },
          children: List.generate(
            themes.length,
            (index) => ThemePreview(
                index: index, shouldAnimate: currentIndex.value == index),
          ).toList(),
        ),
      ),
    );
  }
}

class ThemePreview extends ConsumerWidget {
  const ThemePreview(
      {Key? key, required this.index, required this.shouldAnimate})
      : super(key: key);
  final bool shouldAnimate;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final String mode = ref.watch(themeController).theme; */
    /* final Size size = MediaQuery.of(context).size; */

    return AnimatedContainer(
      key: ValueKey(index),
      duration: const Duration(milliseconds: 300),
      transform: shouldAnimate
          ? (Matrix4.identity()..scale(1.0, 1.0))
          : (Matrix4.identity()..scale(0.8, 0.8)),
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeColors[index], borderRadius: BorderRadius.circular(8.0)),
      child: Center(child: Text(themes[index])),
    );
  }
}
