import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/components/armpit.dart';
import 'package:lymphowear_remote_app/components/collarbone.dart';
import 'package:lymphowear_remote_app/components/heating_option.dart';
import 'package:lymphowear_remote_app/components/lymphowear_state.dart';
import 'package:lymphowear_remote_app/components/shoulder.dart';
import 'package:lymphowear_remote_app/constants.dart';

class HomeDefault extends StatelessWidget {
  const HomeDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(
              Icons.power_settings_new_outlined,
              color: Colors.red,
            ),
            onPressed: () {}),
        title: const Text(
          'LymphoWear',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[300],
              height: 2.0,
            )),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: Container(
        color: const Color(0xffDCDCDC),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isMobileWidth(context))
                  if (isMobileHeight(context))
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), //모서리를 둥글게
                        border: Border.all(color: Colors.black12, width: 0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 4.0,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ), //테두리
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    debugPrint("Vital mode 홈페이지로 이동");
                                  },
                                  child: Container(
                                    width: 107.0,
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 0, 10.0, 0),
                                    color: Colors.transparent,
                                    child: Column(children: const [
                                      Icon(
                                        Icons.abc,
                                        size: 14,
                                      ),
                                      Text(
                                        "Vital\n Mode",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ]),
                                  )),
                            ],
                          ),
                          verticalDivider(),
                          GestureDetector(
                              onTap: () {
                                debugPrint("Relaxing mode 홈페이지로 이동");
                              },
                              child: Container(
                                width: 104.0,
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                color: Colors.transparent,
                                child: Column(children: const [
                                  Icon(
                                    Icons.abc,
                                    size: 14,
                                  ),
                                  Text(
                                    "Relaxingn\n Mode",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ]),
                              )),
                          verticalDivider(),
                          GestureDetector(
                              onTap: () {
                                debugPrint("Slepping mode 홈페이지로 이동");
                              },
                              child: Container(
                                width: 107.0,
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                color: Colors.transparent,
                                child: Column(children: const [
                                  Icon(
                                    Icons.abc,
                                    size: 14,
                                  ),
                                  Text(
                                    "Slepping\n Mode",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ]),
                              )),
                        ],
                      ),
                    ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  // width: 320,
                  // height: 604, // 원래 height: 504
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), //모서리를 둥글게
                    border: Border.all(color: Colors.black12, width: 0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 4.0,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        20, 16, 20, 90), // 하단 container // 원래 B: 112
                    padding: const EdgeInsets.all(0.0),
                    // log 여기 마진 조절 하기 height: 704,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                          padding: const EdgeInsets.all(0.0),
                          color: Colors.white,
                          child: const LymphoWearState(),
                        ),
                        // heating option SwitchButton 추가 - Container로
                        Container(
                          // container BoxDecoration margin 적용 안됨
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20), //모서리를 둥글게
                              border: Border.all(
                                  color: Colors.black12, width: 2)), //테두리

                          child: Column(
                            children: const [
                              Collarbone(),
                              Armpit(),
                              Shoulder(),
                              HeatingOption(),
                            ],
                          ),
                        ),
                      ],
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

  Widget verticalDivider() {
    return const VerticalDivider(
        thickness: 1, width: 1, color: Color(0xffEEEEEE));
  }
}
