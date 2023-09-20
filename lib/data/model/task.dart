import 'package:equatable/equatable.dart';

import 'package:task_app/utils/task_categories.dart';
import 'package:task_app/utils/task_keys.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category;
  final bool isComplete;
  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isComplete,
  });

  @override
  List<Object> get props {
    return [
      title,
      note,
      time,
      date,
      isComplete,
    ];
  }

 

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.category: category.name,
      TaskKeys.isComplete: isComplete ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      note: map[TaskKeys.note],
      time: map[TaskKeys.time],
      date: map[TaskKeys.category],
      category: TaskCategories.stringToCategory(map[TaskKeys.category]),
      isComplete: map['isComplete'] == 1 ? true : false,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? note,
    String? time,
    String? date,
    TaskCategories? category,
    bool? isComplete,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
