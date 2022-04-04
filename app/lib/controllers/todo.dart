import 'package:flutter/material.dart';
import 'package:non/db/local.dart';
import 'package:non/models/todo.dart';
import 'package:uuid/uuid.dart';
import 'package:non/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _now = DateTime.now();
const _day = Duration(days: 1);
const _uuid = Uuid();

final todoControllerProvider = ChangeNotifierProvider<TodoController>((ref) {
  final _hiveDB = ref.watch(hiveDB);
  return TodoController(_hiveDB);
});

class TodoController with ChangeNotifier {
  TodoController(this._hiveDB);
  late final HiveDB _hiveDB;

  List<Todo> get all => _hiveDB.allTodo;

  void put(String description, String whenTodo) {
    DateTime date = kLater;
    switch (whenTodo) {
      case "today":
        date = DateTime.now();
        break;
      case "tomorrow":
        date = DateTime.now().add(const Duration(days: 1));
        break;
    }
    final Todo todo = Todo()
      ..id = _uuid.v4()
      ..date = date
      ..description = description;

    _hiveDB.putTodo(todo);
    notifyListeners();
  }

  void get(String id) => _hiveDB.getTodo(id);

  List<Todo?> getUncompleted() => _hiveDB.getUncompletedTodo();

  List<Todo?> getUncompletedFor(String whenTodo) {
    switch (whenTodo) {
      case "today":
        return getUncompleted()
            .where((todo) => todo?.date.day == _now.day)
            .toList();
      case "tomorrow":
        return getUncompleted()
            .where((todo) => todo?.date.day == _now.add(_day).day)
            .toList();
      default:
        return getUncompleted()
            .where((todo) => todo?.date.day == kLater.day)
            .toList();
    }
  }

  void toggle(String id) {
    _hiveDB.toggleTodo(id);
    notifyListeners();
  }

  void update(
      {required String id,
      required String description,
      required DateTime date}) {
    _hiveDB.getTodo(id)
      ?..description = description
      ..date = date;
    notifyListeners();
  }

  void delete(String id) {
    _hiveDB.deleteTodo(id);
    notifyListeners();
  }

  void clear() {
    _hiveDB.clearTodo();
    notifyListeners();
  }
}
