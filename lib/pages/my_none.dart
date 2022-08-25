import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/setting/my/my_not_connected.dart';

class MyNone extends StatelessWidget {
  const MyNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text('My Device',
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
                  textAlign: TextAlign.center,
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
                  )),
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
                                const MyNotConnected()),
                        transitionDuration: const Duration(seconds: 0),
                      ),
                    ); // Home_BT연결 / 전원이 꺼진 경우
                    // Navigator.pushReplacement(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder:
                    //         ((context, animation, secondaryAnimation) =>
                    //             const MyNotConnected()),
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
                    // fixedSize: const Size(320, 48),
                    side: const BorderSide(color: Color(0xff008A40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
