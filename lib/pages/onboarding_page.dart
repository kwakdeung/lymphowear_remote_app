import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/pages/contents/onboarding_contents.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

import '../components/dotindicator.dart';
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

  @override
  Widget build(BuildContext context) {
    pageController = PageController(initialPage: 0, viewportFraction: 0.6);
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
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                        debugPrint('PageView itemBuilder reload Check');
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
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            onboardingData.length,
                            ((index) => Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: DotIndicator(
                                      isActive: index == pageIndex),
                                ))),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 50,
                          width: pageSize.width * 0.75,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          const PairingPage(),
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                              );
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
