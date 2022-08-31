import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/onboarding/dotindicator.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/pages/onboarding/onboarding_contents.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeNone(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    pageController = PageController(initialPage: 0, viewportFraction: 0.65);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
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
                Container(
                  margin: const EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        onboardingData.length,
                        ((index) => Padding(
                              padding: const EdgeInsets.all(4),
                              child: DotIndicator(isActive: index == pageIndex),
                            ))),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(0, 231, 174, 174),
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 80),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      primary: const Color(0xff008A40),
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    child: const Text('Skip'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
