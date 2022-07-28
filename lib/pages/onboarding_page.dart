import 'package:flutter/material.dart';

import '../components/dotindicator.dart';
import '../models/onboarding_model.dart';
import '../pages/onboarding_contents.dart';

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
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: pageSize.height,
            child: Column(
              children: [
                SizedBox(height: pageSize.height * 0.2),
                SizedBox(
                  width: double.infinity * 0.5,
                  height: pageSize.height * 0.5,
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
                  // Column delete
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              // Legible 하게 고친다.
                              onboardingData.length,
                              ((index) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: DotIndicator(
                                        isActive: index == pageIndex),
                                  ))),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 50,
                          width: pageSize.width * 0.8,
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
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
