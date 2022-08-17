import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/widgets/home/home_bluetooth.dart';
import 'package:lymphowear_remote_app/widgets/home/home_refresh.dart';

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
                  'assets/images/ic_setting.svg',
                  fit: BoxFit.fill,
                ),
                color: Colors.grey[700],
                onPressed: () {}),
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
                  child: SvgPicture.asset(
                    'assets/images/Home_none_title.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: SvgPicture.asset(
                    'assets/images/Home_none_content.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/Home_none_image.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder:
                      //         ((context, animation, secondaryAnimation) =>
                      //             const HomeRefresh()),
                      //     transitionDuration: const Duration(seconds: 0),
                      //   ),
                      // ); // Home_BT연결 / 전원이 꺼진 경우
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              ((context, animation, secondaryAnimation) =>
                                  const HomeBluetooth()),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      ); // Home_BT연결이 끊어진 경우
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
