import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:task_app/config/config.dart';
import 'package:task_app/data/model/task.dart';
import 'package:task_app/providers/provider.dart';
import 'package:task_app/utils/helper.dart';
import 'package:task_app/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleControler.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task title',
                hintText: 'Task title',
                controller: _titleControler,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                title: 'Note',
                hintText: 'Task Note',
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(16),
              ElevatedButton(
                  onPressed: _createTask,
                  child: const DisplayWhiteText(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleControler.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        time: Helper.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        category: category,
        isComplete: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        context.go(RouteLocation.home);
      });
    }
  }
}
