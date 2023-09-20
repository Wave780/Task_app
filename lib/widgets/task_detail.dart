import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_app/data/model/task.dart';
import 'package:task_app/utils/extension.dart';
import 'package:task_app/widgets/widgets.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(26),
          Text(task.title,
              style: style.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
              visible: !task.isComplete,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task to do on ${task.date}'),
                  Icon(
                    Icons.check_box,
                    color: task.category.color,
                  )
                ],
              )),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(task.note.isEmpty
              ? 'There is no additional note for this task'
              : task.note),
          const Gap(16),
          Visibility(
              visible: task.isComplete,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task completed'),
                  Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
