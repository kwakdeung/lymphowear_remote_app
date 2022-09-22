import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/onboarding/dotindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';
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

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const HomeNone(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return FadeTransition(
  //         opacity: animation,
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.65,
    );

    PageView pageView() {
      return PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() => pageIndex = index);
        },
        itemBuilder: (
          BuildContext context,
          int index,
        ) =>
            OnboardingContents(
          image: onboardingData[index].image,
          title: onboardingData[index].title,
          description: onboardingData[index].description,
        ),
      );
    }

    Row dotIndicator() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
          ((index) => Padding(
                padding: const EdgeInsets.all(4),
                child: DotIndicator(isActive: index == pageIndex),
              )),
        ),
      );
    }

    ElevatedButton onboardingPageBottomButton() {
      return ElevatedButton(
        onPressed: () {
          // Navigator.of(context).push(_createRoute());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeNone()),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: buttonPadding,
          backgroundColor: const Color(0xff008A40),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        child: const Text('Skip'),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Center(
          child: Container(
            color: Colors.transparent,
            margin: zeroMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: pageView(),
                ),
                Container(
                  margin: const EdgeInsets.all(32),
                  child: dotIndicator(),
                ),
                Container(
                  color: const Color.fromARGB(0, 231, 174, 174),
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 80),
                  width: double.infinity,
                  child: onboardingPageBottomButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
