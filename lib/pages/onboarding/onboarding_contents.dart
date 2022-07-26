import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

import 'package:lymphowear_remote_app/pages/pairing_page.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

import '../no_device_page.dart';

class OnboardingContents extends StatefulWidget {
  final String bgImage, image, description, title;
  final double marginTop;
  final int pageIndex;

  const OnboardingContents({
    Key? key,
    required this.bgImage,
    required this.image,
    required this.marginTop,
    required this.description,
    required this.pageIndex,
    required this.title,
  }) : super(key: key);

  @override
  State<OnboardingContents> createState() => _OnboardingContentsState();
}

class _OnboardingContentsState extends State<OnboardingContents> {
  get bgImage => Image.asset(
        widget.bgImage,
        width: double.infinity,
        fit: BoxFit.fill,
      );
  get image => Image.asset(
        widget.image,
        width: double.infinity,
        fit: BoxFit.fill,
      );

  get title => widget.pageIndex == 0
      ? Image.asset('assets/images/onboarding_01_01.png')
      : Text(widget.title,
          style: const TextStyle(
              fontSize: 20, fontWeight: semiBold, color: Color(0xff005784)));

  get description => Text(
        widget.description,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff005784),
            fontSize: 18),
      );

  get skipButton => Positioned(
        top: 42,
        right: 35,
        child: TextButton(
          child: const Text(
            'Skip',
            style: TextStyle(
              fontWeight: semiBold,
              fontSize: 16,
              color: Color(0xffED711A),
            ),
          ),
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
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: zeroMargin,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                bgImage,
                widget.pageIndex == 2
                    ? Container(
                        margin: const EdgeInsets.fromLTRB(50, 96, 50, 0),
                        child: image)
                    : image,
                widget.pageIndex == 2 ? Container() : skipButton,
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: widget.marginTop),
            child: title,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: description,
          ),
        ],
      ),
    );
  }
}
