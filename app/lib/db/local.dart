import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gaji/models/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final hiveDB = Provider<HiveDB>((_) => HiveDB());

class HiveDB {
  // TODODB
  late final Box<Todo> todoBox;

  List<Todo> get allTodo => todoBox.values.toList();

  Todo? getTodo(String id) => todoBox.get(id);

  List<Todo?> getUncompletedTodo() =>
      allTodo.where((todo) => todo.completed == false).toList();

  Future<void> putTodo(Todo todo) async {
    await todoBox.put(todo.id, todo);
  }

  Future<void> toggleTodo(String id) async {
    Todo? todo = todoBox.get(id);
    todo?.completed = !todo.completed;
  }

  Future<void> deleteTodo(String id) async {
    await todoBox.delete(id);
  }

  Future<void> clearTodo() async {
    await todoBox.clear();
  }

  Future<void> initTodoBox() async {
    await Hive.openBox<Todo>('todo').then((value) => todoBox = value);

    if (todoBox.values.isEmpty) {
      final Todo initialTodo = Todo()
        ..id = _uuid.v4()
        ..description = "hello, welcome to Gaji Todo"
        ..date = DateTime.now();

      await todoBox.put(initialTodo.id, initialTodo);
    }
  }

  // THEMEDB
  late final Box<String> themeBox;

  String get savedTheme => themeBox.values.first;

  Future<void> initThemeBox() async {
    await Hive.openBox<String>('theme').then((value) => themeBox = value);

    if (themeBox.values.isEmpty) {
      themeBox.add('light');
    }
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await themeBox.put(0, mode);
}
