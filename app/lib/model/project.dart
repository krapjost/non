import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// A read-only description of a todo-item
@immutable
class Project {
  const Project({
    required this.description,
    required this.id,
    this.completed = false,
  });

  final String id;
  final String description;
  final bool completed;

  @override
  String toString() {
    return 'Project(description: $description, completed: $completed)';
  }
}

/// An object that controls a list of [Todo].
class ProjectList extends StateNotifier<List<Project>> {
  ProjectList([List<Project>? initialProjects]) : super(initialProjects ?? []);

  void add(String description) {
    state = [
      ...state,
      Project(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final project in state)
        if (project.id == id)
          Project(
            id: project.id,
            completed: project.completed,
            description: description,
          )
        else
          project,
    ];
  }

  void remove(Project target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
