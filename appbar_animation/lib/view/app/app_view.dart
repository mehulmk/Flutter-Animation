import 'package:appbar_animation/core/app_pages.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
      ),
      routes: appRoutes,
    );
  }
}
