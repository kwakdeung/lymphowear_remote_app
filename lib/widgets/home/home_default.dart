import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/armpit.dart';
import 'package:lymphowear_remote_app/components/collarbone.dart';
import 'package:lymphowear_remote_app/components/heat.dart';
import 'package:lymphowear_remote_app/components/lymphowear_state.dart';
import 'package:lymphowear_remote_app/components/shoulder.dart';

class HomeDefault extends StatelessWidget {
  const HomeDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/ic_power.svg',
                fit: BoxFit.fill,
              ),
              onPressed: () {
                debugPrint('기기 전원 OFF');
              }),
        ),
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
              color: Colors.grey[300],
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
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF3F3F3),
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 4.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 92,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint("Vital mode 홈페이지로 이동");
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 4),
                                        child: SvgPicture.asset(
                                          'assets/images/ic_vital2.svg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Vital\n Mode",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: const VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: Colors.black,
                              // color: Color(0xffEEEEEE),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint("Relaxing mode 홈페이지로 이동");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 4),
                                        child: SvgPicture.asset(
                                          'assets/images/ic_relaxing2.svg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Relaxing\n Mode",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: const VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: Colors.black,
                              // color: Color(0xffEEEEEE),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint("Sleeping mode 홈페이지로 이동");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 4),
                                        child: SvgPicture.asset(
                                          'assets/images/ic_sleeping2.svg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "Sleeping\n Mode",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 4.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.white,
                            child: const LymphoWearState(),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 24, 20, 68),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.black12, width: 2)),
                            child: Column(
                              children: const [
                                Collarbone(),
                                Armpit(),
                                Shoulder(),
                                Heat(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
