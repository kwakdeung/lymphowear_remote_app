import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/screens/onboarding_contents.dart';

import '../components/dotindicator.dart';
import '../models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: screenSize.height,
            child: Column(
              children: [
                Expanded(
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
                Expanded(
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              onboardingData.length,
                              ((index) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: DotIndicator(
                                        isActive: index == pageIndex),
                                  ))),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(microseconds: 1000),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
