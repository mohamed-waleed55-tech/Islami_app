import 'package:flutter/material.dart';
import 'package:islam/config/app_theme/app_theme.dart';

import '../../core/navigation/routes.dart';

class IslamApp extends StatelessWidget {
  const IslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark ,
      routes:AppRoutes.routes ,
      initialRoute: AppRoutes.splash,
    );
  }
}
