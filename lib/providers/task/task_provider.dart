// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_app/data/repositories/repositories.dart';
// import 'package:task_app/providers/provider.dart';

// final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
//   final repository = ref.watch(taskRepositoryProvider);
//   return TaskNotifier(repository);
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/data/data.dart';

import 'package:task_app/providers/provider.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
