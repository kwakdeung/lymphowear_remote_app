import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/home/home_default.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class HomeBluetooth extends StatefulWidget {
  const HomeBluetooth({Key? key}) : super(key: key);

  @override
  State<HomeBluetooth> createState() => _HomeBluetoothState();
}

class _HomeBluetoothState extends State<HomeBluetooth> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  AppBar homebluetoothappbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: SvgPicture.asset(
          'assets/images/lymphowear.svg',
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SettingPage())));
              }),
        ),
      ],
    );
  }

  Center homebluetoothbody() {
    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 78, 0, 8),
                child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/ic_bluetooth_off.svg',
                      fit: BoxFit.fill,
                      width: 32,
                      height: 32,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {}),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: const Text(
                  'Not connected',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    primary: Colors.white,
                    side: const BorderSide(color: Color(0xff008A40)),
                  ),
                  onPressed: () {
                    showProgressDialog('Connecting...');
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
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: homebluetoothappbar(),
      body: homebluetoothbody(),
    );
  }

  Future showProgressDialog(String message) async {
    const firstcupertinaactivityindicator = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );
    final firstalertdialogtextstyle = Text(
      message,
      style: const TextStyle(
          fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w400),
    );

    var firstalertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      content: Container(
        margin: const EdgeInsets.all(0.0),
        height: 62,
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: firstcupertinaactivityindicator,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: firstalertdialogtextstyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    const secondalertdialogtitle = Text(
      'Failed to Connect',
      style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
    );

    final secondcanclebutton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(112, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        side: const BorderSide(width: 1.0, color: Colors.grey),
        primary: Colors.white,
        onPrimary: const Color(0xff757575),
        textStyle: const TextStyle(
            fontSize: 14, fontFamily: "Poppins", fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeNone()),
        );
      },
      child: const Text('Cancel'),
    );

    final secondtryagainbutton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(112, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        primary: const Color(0xff008A40),
        onPrimary: Colors.white,
        textStyle: const TextStyle(
            fontSize: 14, fontFamily: "Poppins", fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeDefault()),
            ));
      },
      child: const Text('Try Again'),
    );

    var secondalertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: secondalertdialogtitle,
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
                child: secondcanclebutton,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                child: secondtryagainbutton,
              ),
            ],
          ),
        ),
      ],
    );
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(59, 246, 59, 246),
            child: firstalertdialog,
          ),
        );
      },
    );
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: secondalertdialog,
        );
      },
    );
  }
}
