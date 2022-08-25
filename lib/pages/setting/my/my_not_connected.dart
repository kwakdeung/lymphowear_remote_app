import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNotConnected extends StatefulWidget {
  const MyNotConnected({Key? key}) : super(key: key);

  @override
  State<MyNotConnected> createState() => _MyNotConnectedState();
}

class _MyNotConnectedState extends State<MyNotConnected> {
  bool _isConnecting = true;
  bool _isStarting = true;

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

                  _isConnecting // 삼항연산자1 처음
                      ? Column(
                          children: [
                            const Text(
                              "Not connected",
                              style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 8),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 10, 24, 10),
                                  primary: Colors.white,
                                  side: const BorderSide(
                                      color: Color(0xff008A40)),
                                ),
                                onPressed: () {
                                  _isConnecting
                                      ? Container(
                                          margin: const EdgeInsets.all(0.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 14, top: 8),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        24, 10, 24, 10),
                                                    primary: Colors.white,
                                                    side: const BorderSide(
                                                        color:
                                                            Color(0xff008A40)),
                                                  ),
                                                  onPressed: () {
                                                    _isConnecting
                                                        ? Container()
                                                        : Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0, 0, 0, 4),
                                                            child:
                                                                const CupertinoActivityIndicator(
                                                              radius: 12,
                                                              animating: true,
                                                            ),
                                                          );
                                                  },
                                                  child: const Text(
                                                    'Connect',
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff008A40)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))
                                      : Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 4),
                                          child:
                                              const CupertinoActivityIndicator(
                                            radius: 12,
                                            animating: true,
                                          ),
                                        );
                                  setState(() {
                                    _isConnecting = false;
                                  });
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
                        )
                      : Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: const CupertinoActivityIndicator(
                                radius: 12,
                                animating: true,
                              ),
                            ),
                            Text(
                              _isConnecting ? "Not connected" : "Connecting...",
                              style: const TextStyle(
                                color: Color(0xff616161),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // Timer(const Duration(milliseconds: 3700), () {}),
                            // Timer(const Duration(milliseconds: 3700), () => ),
                          ],
                        ), // 삼항연산자1 끝
                ],
              ),
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
                  showProgressDialog();
                },
                icon: Image.asset(
                  "assets/icons/2.0x/ic_trash.png",
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

  Future showProgressDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const Text(
                  'Delete to this device',
                  style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
                ),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(0.0),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 16, 4, 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          side:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          primary: Colors.white,
                          onPrimary: const Color(0xff757575),
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                      child: ElevatedButton.icon(
                        icon: SvgPicture.asset("assets/icons/ic_delete.svg"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          side: const BorderSide(
                              width: 1.0, color: Color(0xffBB0000)),
                          primary: Colors.white,
                          onPrimary: const Color(0xffBB0000),
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                        // onPressed: () {
                        //   // Navigator.pushReplacement(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //       builder: (context) => const HomeNone()),
                        //   // );
                        // },
                        onPressed: () {},
                        label: const Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
