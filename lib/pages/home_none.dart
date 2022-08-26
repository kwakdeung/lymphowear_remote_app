import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/home/home_refresh.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class HomeNone extends StatelessWidget {
  const HomeNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: SvgPicture.asset(
            'assets/images/LymphoWear.svg',
            fit: BoxFit.fill,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[200],
              height: 2.0,
            )),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/ic_setting.svg',
                  fit: BoxFit.fill,
                ),
                color: Colors.grey[700],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SettingPage())));
                }),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color(0xffF3F3F3),
          child: Container(
            margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
                  child: const Text(
                    "There’s no device connected.",
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: const Text(
                    "Press the button and\nconnect to the device.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/none_image.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              ((context, animation, secondaryAnimation) =>
                                  const PairingPage()),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      ); // Home_BT연결 / 전원이 꺼진 경우
                      // Navigator.pushReplacement(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder:
                      //         ((context, animation, secondaryAnimation) =>
                      //             const HomeBluetooth()),
                      //     transitionDuration: const Duration(seconds: 0),
                      //   ),
                      // ); // Home_BT연결이 끊어진 경우
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: Color(0xff008A40),
                    ),
                    label: const Text(
                      'Add Device',
                      style: TextStyle(
                        color: Color(0xff008A40),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      primary: Colors.white,
                      side: const BorderSide(color: Color(0xff008A40)),
                    ),
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
