import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/utils/task_categories.dart';

final categoryProvider =
    StateProvider<TaskCategories>((ref) => TaskCategories.others);
