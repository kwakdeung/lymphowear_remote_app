import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/ui/responsive/responsive_builder.dart';
import 'package:lymphowear_remote_app/widgets/home/home_bluetooth.dart';

class HomeNone extends StatelessWidget {
  const HomeNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'LymphoWear',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  color: Colors.grey[200],
                  height: 2.0,
                )),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.settings_outlined), onPressed: () {}),
            ],
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Column(
              children: [
                Container(
                  // size 맞추기
                  margin: const EdgeInsets.fromLTRB(63, 40, 63, 8),
                  padding: const EdgeInsets.all(0.0),
                  width: 234, // log
                  height: 20,
                  child: Image.asset(
                    'assets/images/Home_none_title.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  // size 맞추기
                  margin: const EdgeInsets.fromLTRB(102, 0, 102, 24),
                  padding: const EdgeInsets.all(0.0),
                  width: 156, // log
                  height: 40,
                  child: Image.asset(
                    'assets/images/Home_none_content.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  // size 맞추기
                  margin: const EdgeInsets.fromLTRB(60, 0, 60, 100),
                  padding: const EdgeInsets.all(0.0),
                  width: 240, // log
                  height: 184,
                  child: Image.asset(
                    'assets/images/Home_none_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 80, 20, 80),
                  padding: const EdgeInsets.fromLTRB(12, 24, 12, 16),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: ((context, animation, secondaryAnimation) =>
                      //         const HomeRefresh()),
                      //     transitionDuration: const Duration(seconds: 0),
                      //   ),
                      // );  // Home_BT연결 / 전원이 꺼진 경우
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
                      color: Colors.green,
                    ),
                    label: const Text(
                      'Add Device',
                      style: TextStyle(color: Colors.green),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(320, 48),
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
