import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/onboarding_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // 부분 세로모드 고정하기 - SystemChrome.setPreferredOrientations를 initState에 세로고정 모드 삽입과 dispose에 원 상태 복귀 삽입
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Timer(const Duration(seconds: 1), () {
      // 시간 제한
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      )); // Navigator.of(context).pushReplacement(): 다음페이지인 onboarding page에서 back 버튼을 눌렀을 때 SplashScreen에 못넘어오게 제한
    });
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  final splashscreen = Container(
    margin: const EdgeInsets.all(0.0),
    child: SvgPicture.asset(
      alignment: Alignment.center,
      'assets/images/splash_screen_logo.svg',
      fit: BoxFit.fill,
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              splashscreen,
            ],
          ),
        ),
      ),
    );
  }
}
