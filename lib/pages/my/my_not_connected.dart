import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNotConnected extends StatefulWidget {
  const MyNotConnected({Key? key}) : super(key: key);

  @override
  State<MyNotConnected> createState() => _MyNotConnectedState();
}

class _MyNotConnectedState extends State<MyNotConnected> {
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
        title: const Text(
          'My Device',
          style: TextStyle(
              fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: const Color(0xffF3F3F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 24, 16),
                    child: Image.asset(
                      "assets/images/2.0x/LymphoWear_image.png",
                      fit: BoxFit.fill,
                      width: 137,
                      height: 128,
                    ),
                  ),
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Not connected",
                        style: TextStyle(
                          color: const Color(0xff616161),
                          fontSize: 12,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 14, top: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                            primary: Colors.white,
                            side: const BorderSide(color: Color(0xff008A40)),
                          ),
                          onPressed: () {
                            // showProgressDialog('Connecting...');
                          },
                          child: const Text(
                            'Connect',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                color: Color(0xff008A40)),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              // onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  child: const Text('Model name',
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: const Text("LymphoWear",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
              ),
              // onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  child: const Text('Model number',
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: const Text("LW-100",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
              ),
              // onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  child: const Text('Serial number',
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: const Text("ABCDEFG1234",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
              ),
              // onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 14),
                  child: const Text('Version',
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: const Text("1.1.1",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400)),
                ),
              ),
              // onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
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
                icon: Image.asset(
                  "assets/images/2.0x/ic_trash.png",
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  'Delete device',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  primary: const Color(0xffE0E0E0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
