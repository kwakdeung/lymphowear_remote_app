import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/none.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class OnboardingContents extends StatefulWidget {
  final String image, description;
  final double marginTop;
  final int pageIndex;

  const OnboardingContents({
    Key? key,
    required this.image,
    required this.marginTop,
    required this.description,
    required this.pageIndex,
  }) : super(key: key);

  @override
  State<OnboardingContents> createState() => _OnboardingContentsState();
}

class _OnboardingContentsState extends State<OnboardingContents> {
  get image => Image.asset(
        widget.image,
        width: double.infinity,
        fit: BoxFit.fill,
      );

  get description => Text(
        widget.description,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff005784),
            fontSize: 18),
        // style: Theme.of(context).textTheme.bodyText2,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: zeroMargin,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: image,
              ),
              widget.pageIndex == 2
                  ? Container()
                  : Positioned(
                      top: 42,
                      right: 35,
                      child: TextButton(
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontWeight: semiBold,
                              fontSize: 16,
                              color: Color(0xffED711A)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => None(
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
                                            builder: ((context) =>
                                                const SettingPage()),
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
                    ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, widget.marginTop, 20, 10),
            child: description,
          ),
        ],
      ),
    );
  }
}
