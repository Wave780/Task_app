import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/config/routes/routes.dart';
import 'package:task_app/screen/create_task_screen.dart';
import 'package:task_app/screen/home_screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  )
];
