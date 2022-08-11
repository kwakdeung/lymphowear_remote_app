import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/dotindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/contents/onboarding_contents.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

import '../models/onboarding_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // 위젯 생성 시
    super.initState();
  }

  @override
  void dispose() {
    // 위젯 종료 시
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController = PageController(
        initialPage: 0,
        viewportFraction:
            0.65); // viewportFraction - PageView 이전, 다음 페이지 약간 보이게 하는 효과

    var bottombuttonmargin;
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // A RenderFlex overflowed by xx pixels on the bottom 해결
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: const EdgeInsets.all(0.0),
                width: double.infinity, // 크기를 지정하지 않으면 부모의 크기
                height: 432, // Log - media 크기 맞추기
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                ),
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      OnboardingContents(
                    image: onboardingData[index].image,
                    title: onboardingData[index].title,
                    description: onboardingData[index].description,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    onboardingData.length,
                    ((index) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: DotIndicator(isActive: index == pageIndex),
                        ))),
              ),
              Container(
                // Log
                margin: bottombuttonmargin,
                padding: bottombuttonpadding,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 48),
                    primary: Colors.green[500],
                    onPrimary: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      // onboarding의 Button이 Skip이기 때문에 back이 안되게 하고 종료 시키기 위해 Navigator.pushReplacement()를 사용
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const PairingPage(),
                      ),
                    );
                  },
                  child: const Text('Skip'), // 함수 호출
                ),
              ),
            ],
          ),
        ));
  }
}
