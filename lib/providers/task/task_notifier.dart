import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/data/data.dart';
import 'package:task_app/providers/provider.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TaskNotifier(this._repository) : super(const TaskState.initial());

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isComplete;
      final updatedTask = task.copyWith(isComplete: isCompleted);

      await _repository.updateTask(updatedTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks(Task task) async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
