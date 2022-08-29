import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/armpit.dart';
import 'package:lymphowear_remote_app/components/home/collarbone.dart';
import 'package:lymphowear_remote_app/components/home/heat.dart';
import 'package:lymphowear_remote_app/components/home/lymphowear_state.dart';
import 'package:lymphowear_remote_app/components/home/shoulder.dart';
import 'package:lymphowear_remote_app/pages/home/relaxing/relaxing_01_1.dart';
import 'package:lymphowear_remote_app/pages/home/sleeping/sleeping_01_1.dart';
import 'package:lymphowear_remote_app/pages/home/vital/vital_01_1.dart';

import 'package:lymphowear_remote_app/pages/setting_page.dart';

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
                'assets/icons/ic_power.svg',
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
      body: Container(
        color: const Color(0xffF3F3F3),
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 68),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xffEEEEEE), width: 1),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            spreadRadius: 0,
                            offset: Offset(4, 1),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      height: 92,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VitalMode()),
                                  );
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
                                          'assets/icons/ic_vital2.svg',
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
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const RelaxingMode())));
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
                                          'assets/icons/ic_relaxing2.svg',
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
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const SleepingMode())));
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
                                          'assets/icons/ic_sleeping2.svg',
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
                        border: Border.all(
                            color: const Color(0xffEEEEEE), width: 1),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            spreadRadius: 0,
                            offset: Offset(4, 1),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.white,
                            child: const LymphoWearState(),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                            width: double.infinity,
                            child: const Collarbone(),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                            width: double.infinity,
                            child: const Armpit(),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                            width: double.infinity,
                            child: const Shoulder(),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                            width: double.infinity,
                            child: const Heat(),
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
