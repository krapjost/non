import 'package:flutter/material.dart';
import 'package:gaji/provider/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<Color> bnwColorProvider = StateProvider((ref) {
  final mode = ref.watch(themeController).theme;
  if (mode == "dark") {
    return Colors.white;
  } else {
    return Colors.black;
  }
});

final StateProvider<Color> bnwInverseColorProvider = StateProvider((ref) {
  final mode = ref.watch(themeController).theme;
  if (mode == "dark") {
    return Colors.black;
  } else {
    return Colors.white;
  }
});

final StateProvider<Color> brownPrimaryColorProvider = StateProvider((ref) {
  final mode = ref.watch(themeController).theme;
  if (mode == "dark") {
    return Colors.brown.shade400;
  } else {
    return Colors.brown.shade600;
  }
});
