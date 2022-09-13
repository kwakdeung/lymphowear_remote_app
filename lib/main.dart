import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lymphowear_remote_app/lib_color_schemes.g.dart';
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
        colorScheme: lightColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreenPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreenPage(),
      //   '/onboarding': (context) => const OnboardingPage(),
      //   '/homenone': (context) => const HomeNone(),
      //   '/pairing': (context) => const PairingPage(),
      //   '/loading': (context) => const PairingLoading(),
      //   '/failed': (context) => const PairingFailed(),
      //   '/reloading': (context) => const PairingReloading(), // settting
      //   '/connect': (context) => const PairingConnect(),
      //   '/complete': (context) => const PairingComplete(),
      //   '/reflesh': (context) => const HomeRefresh(),
      //   '/bluetooth': (context) => const HomeBluetooth(),
      //   '/default': (context) => const HomeDefault(),
      //   '/vital': (context) => const VitalMode(),
      //   '/relaxing': (context) => const RelaxingMode(),
      //   '/sleeping': (context) => const SleepingMode(),
      //   '/setting': (context) => const SettingPage(),
      //   '/mynone': (context) => const MyNone(),
      //   '/mynotconnected': (context) => const MyNotConnected(),
      //   '/alarmpage': (context) => const AlarmPage(),
      //   '/morning': (context) => const Morning(),
      // },
    );
  }
}
