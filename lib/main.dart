import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/lib_color_schemes.g.dart';
import 'package:lymphowear_remote_app/pages/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LymphoWear',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ),
        themeMode: ThemeMode.system,
        home: const SplashScreenPage());
  }
}
