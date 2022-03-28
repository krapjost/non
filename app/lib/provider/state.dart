import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageProvider = StateProvider((ref) => 0);
final isOnInputProvider = StateProvider((ref) => false);
final todayOrTomorrowSelectProvider = StateProvider((ref) => [true, false]);
