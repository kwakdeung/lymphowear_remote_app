import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphowear_remote_app/pages/splash_screen_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
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
        brightness: Brightness.light,
        primaryColor: Colors.transparent,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline5: TextStyle(
            color: Color(0xff212121),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          headline6: TextStyle(
            color: Color(0xff212121),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.0,
          ),
          subtitle1: TextStyle(
            color: Color(0xff212121),
            letterSpacing: 0.0,
          ),
          subtitle2: TextStyle(
            color: Color(0xff212121),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.0,
          ),
          bodyText2: TextStyle(
            color: Color(0xff757575),
            letterSpacing: 0.0,
          ),
          button: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.0,
          ),
          caption: TextStyle(
            color: Color(0xff616161),
            letterSpacing: 0.0,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreenPage(),
    );
  }
}
