import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'onboarding_page.dart';

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
    Timer(const Duration(milliseconds: 3700), () {
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    var pageSize =
        MediaQuery.of(context).size; // responsibie의 MediaQuery로 Size 적용
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: pageSize.width,
              height: pageSize.height * 0.1,
              child: Text(
                'LymphoWear',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: pageSize.width * 0.095,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
