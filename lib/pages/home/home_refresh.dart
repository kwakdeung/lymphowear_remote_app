import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/home/home_bluetooth.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class HomeRefresh extends StatefulWidget {
  const HomeRefresh({Key? key}) : super(key: key);

  @override
  State<HomeRefresh> createState() => _HomeRefreshState();
}

class _HomeRefreshState extends State<HomeRefresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
                  child: Image.asset(
                    'assets/images/2.0x/Home_refresh_image.png',
                    width: 240,
                    height: 184,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const Text(
                    'LymphoWear is turned off.\nTurn on LymphoWear',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(84, 0, 84, 0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cached),
                    label: const Text(
                      'Refresh',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        side: const BorderSide(color: Colors.green)),
                    onPressed: () => showProgressDialog('Loading...'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showProgressDialog(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  const HomeBluetooth()),
            ),
          ); // Home_BT연결이 끊어진 경우
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(70, 246, 70, 246),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
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
                          child: const CupertinoActivityIndicator(
                            radius: 12,
                            animating: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Text(
                            message,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
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
      },
    );
  }
}