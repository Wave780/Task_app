// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
