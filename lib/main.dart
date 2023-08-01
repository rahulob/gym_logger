import 'package:flutter/material.dart';
import 'package:gym_logger/models/preferences_model.dart';
import 'package:gym_logger/screens/home_screen.dart';
import 'package:gym_logger/theme/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Create hive box
  await Hive.initFlutter();
  await Hive.openBox('settings');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _prefs = Preferences();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _prefs.listenable(),
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: _getTheme(_prefs.getTheme()),
        darkTheme: darkTheme,
        theme: lightTheme,
        home: const HomeScreen(),
      ),
    );
  }

  ThemeMode _getTheme(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
