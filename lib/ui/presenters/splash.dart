import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_manager/domain/repositories/local/shared_pref.dart';
import 'package:task_manager/ui/touter/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 200),
      () async {
        final st = LocalStorage();
        final token = await st.getToken();

        if (token == null || token.isEmpty) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.TASK_LIST);
        }
      },
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          'Task Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
