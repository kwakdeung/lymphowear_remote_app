import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphowear_remote_app/lib_color_schemes.g.dart';
import 'package:lymphowear_remote_app/pages/splash_screen_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
  ));
  runApp((const MyApp()));
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
        themeMode: ThemeMode.system,
        home: const SplashScreenPage());
  }
}
