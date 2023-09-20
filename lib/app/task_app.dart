import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:task_app/config/config.dart';

class TaskApp extends ConsumerWidget {
  const TaskApp({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig =  ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
