import 'package:flutter/material.dart';
import 'package:mindflow_frontend/routing/app_router.dart';
import 'package:mindflow_frontend/theme.dart';

bool USER_AUTHENTICATED = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MindFlow',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      routerConfig: router,
    );
  }
}
