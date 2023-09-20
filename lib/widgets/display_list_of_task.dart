import 'package:flutter/material.dart';

import 'package:task_app/data/model/model.dart';
import 'package:task_app/utils/utils.dart';
import 'package:task_app/widgets/task_detail.dart';
import 'package:task_app/widgets/task_tile.dart';

import 'common_container.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTask = false,
  });

  final List<Task> tasks;
  final bool isCompletedTask;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final emptyTaskMessage =
        isCompletedTask ? 'There is no complete Task' : 'There is no task todo';
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (cxt, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {},
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (cxt) {
                          return TaskDetail(task: task);
                        });
                  },
                  child: TaskTile(
                    task: task,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
