import 'package:flutter/cupertino.dart';
import 'package:gaji/db/local.dart';
import 'package:gaji/models/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoController with ChangeNotifier {
  TodoController(this._hiveDB);

  late final HiveDB _hiveDB;

  List<Todo> get all => _hiveDB.allTodo;

  void put(String description, bool isToday) {
    final DateTime date =
        isToday ? DateTime.now() : DateTime.now().add(const Duration(days: 1));
    final Todo todo = Todo()
      ..id = _uuid.v4()
      ..date = date
      ..description = description;

    _hiveDB.putTodo(todo);
    notifyListeners();
  }

  void get(String id) => _hiveDB.getTodo(id);

  List<Todo?> getUncompleted() => _hiveDB.getUncompletedTodo();

  List<Todo?> getUncompletedForDate(bool isToday) {
    return _hiveDB.getUncompletedTodo().where((todo) {
      if (isToday) {
        return todo?.date.day == DateTime.now().day;
      } else {
        return todo?.date.day ==
            DateTime.now().add(const Duration(days: 1)).day;
      }
    }).toList();
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
