import 'package:flutter/material.dart';
import 'package:task_manager/ui/presenters/add_task/add_task.dart';
import 'package:task_manager/ui/presenters/login/login.dart';
import 'package:task_manager/ui/presenters/splash.dart';
import 'package:task_manager/ui/presenters/task_list/task_list.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case SPLASH:
        return _createRoute(
          const SplashScreen(),
        );
      case LOGIN:
        return _createRoute(
          Login(),
        );
      case TASK_LIST:
        return _createRoute(
          const TaskList(),
        );
      case ADD_TASK:
        return _createRoute(
          AddTaskPage(),
        );
    }
  }

  static String initialRoute = SPLASH;
  static const String SPLASH = '/Splash';
  static const String LOGIN = SPLASH + '/login';
  static const String TASK_LIST = LOGIN + '/task_list';
  static const String ADD_TASK = TASK_LIST + '/add_task';

  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation1, animation2, child) =>
          FadeTransition(opacity: animation1, child: child),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
