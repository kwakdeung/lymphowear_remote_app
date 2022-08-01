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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Timer(const Duration(milliseconds: 3700), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    var pageSize = MediaQuery.of(context).size;
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
