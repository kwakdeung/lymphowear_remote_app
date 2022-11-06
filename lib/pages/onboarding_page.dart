import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'no_device_page.dart';
import 'onboarding/onboarding_contents.dart';
import 'orange_bottom_button.dart';
import '../components/onboarding/dotindicator.dart';
import '../constants.dart';
import '../models/onboarding_model.dart';
import 'pairing_page.dart';
import 'setting_page.dart';

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
    pageController = PageController(
      initialPage: 0,
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
          description: onboardingData[index].description,
          marginTop: onboardingData[index].marginTop,
          pageIndex: pageIndex,
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

    final nextButton = OrangeBottomButton(
      buttonText: 'Next',
      onPressed: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );

    final startButton = OrangeBottomButton(
      buttonText: 'Get Started',
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => NoDevicePage(
                  logoTitle: SvgPicture.asset(
                    'assets/images/lymphowear.svg',
                    fit: BoxFit.fill,
                  ),
                  appbarIcon: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/ic_setting.svg',
                      fit: BoxFit.fill,
                    ),
                    color: const Color(0xff616161),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const SettingPage()),
                        ),
                      );
                    },
                  ),
                  leadingButton: Container(),
                  routePairing: const PairingPage(),
                )),
          ),
        );
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
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
                  margin: const EdgeInsets.only(top: 54),
                  child: dotIndicator(),
                ),
                Container(
                  color: const Color.fromARGB(0, 231, 174, 174),
                  margin: const EdgeInsets.fromLTRB(20, 24, 20, 80),
                  width: double.infinity,
                  child: pageIndex == 2 ? startButton : nextButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
