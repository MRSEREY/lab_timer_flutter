import 'package:flutter/material.dart';
import 'package:lap_timer/screens/home_screen.dart';
import 'package:lap_timer/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
