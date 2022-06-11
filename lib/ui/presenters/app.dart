import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/ui/theme/theme.dart';
import 'package:task_manager/ui/touter/router.dart';

import '../../../main.dart';

class TaskManagerApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Center(
      child: Container(
        width: kIsWeb ? 428 : double.infinity,
        height: kIsWeb ? 926 : double.infinity,
        child: ScreenUtilInit(
          designSize: const Size(360, 640),
          builder: (context, child) => MaterialApp(
            navigatorKey: _navigatorKey,
            // locale: Locale('fa'),
            // localizationsDelegates:
            // AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            title: 'TaskManager',
            theme: theme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AppRoutes.initialRoute,
          ),
        ),
      ),
    );
  }
}
