import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/controllers/todo.dart';
import 'package:gaji/db/local.dart';

final todoControllerProvider = ChangeNotifierProvider<TodoController>((ref) {
  final _hiveDB = ref.watch(hiveDB);
  return TodoController(_hiveDB);
});
