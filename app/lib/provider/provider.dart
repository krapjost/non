import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/model/todo.dart';
import 'package:gaji/model/project.dart';
import 'package:flutter/material.dart';

final addTodoKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

final pageProvider = StateProvider((ref) => 0);
final isOnInputProvider = StateProvider((ref) => false);
final timeProvider = StateProvider((ref) => 0);

final currentTodo = Provider<Todo>((ref) => throw UnimplementedError());

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList(const []);
});

final projectListProvider =
    StateNotifierProvider<ProjectList, List<Project>>((ref) {
  return ProjectList(const []);
});

enum TodoListFilter {
  all,
  active,
  completed,
}

final todoListFilter = StateProvider((_) => TodoListFilter.all);

final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);
  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
      return todos;
  }
});

final todayOrTomorrowSelectProvider = StateProvider((ref) => [true, false]);
