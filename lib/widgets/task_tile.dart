import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_app/data/model/task.dart';
import 'package:task_app/utils/extension.dart';
import 'package:task_app/widgets/widgets.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    //final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = task.isComplete ? 0.5 : 0.3;
    final double backgroundOpacity = task.isComplete ? 0.1 : 0.3;
    final textDecoration =
        task.isComplete ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isComplete ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withOpacity(iconOpacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 20,
                      fontWeight: fontWeight),
                ),
                Text(
                  task.time,
                  style:
                      style.titleMedium?.copyWith(decoration: textDecoration),
                )
              ],
            ),
          ),
          Checkbox(
              value: task.isComplete,
              onChanged: (value) {
                onCompleted;
              })
        ],
      ),
    );
  }
}
