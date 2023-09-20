import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/config/config.dart';

import 'package:task_app/providers/provider.dart';

import 'package:task_app/utils/utils.dart';

import 'package:task_app/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                          text: 'Aug 7, 2023',
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      DisplayWhiteText(
                        text: 'My Todo List',
                        fontSize: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DisplayListOfTask(tasks: taskState.tasks),
                      const Gap(20),
                      Text(
                        'Completed!',
                        style: context.textTheme.headlineMedium,
                      ),
                      DisplayListOfTask(
                          tasks: taskState.tasks, isCompletedTask: true),
                      const Gap(20),
                      ElevatedButton(
                          onPressed: () =>
                              context.push(RouteLocation.createTask),
                          child: const DisplayWhiteText(text: 'Add New Task'))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
