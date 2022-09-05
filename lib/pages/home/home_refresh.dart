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
  AppBar homerefleshappbar() {
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

  Center homerefleshbody() {
    final homerefleshimage = Image.asset(
      'assets/images/home_refresh_image.png',
      fit: BoxFit.fill,
    );

    const homerefleshcontent = Text(
      'LymphoWear is turned off.\nTurn on LymphoWear',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color(0xff212121),
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    final homerefleshbottombutton = ElevatedButton.icon(
      icon: const Icon(
        Icons.cached,
        color: Color(0xff008A40),
      ),
      label: const Text(
        'Refresh',
        style: TextStyle(
            color: Color(0xff008A40),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          side: const BorderSide(color: Color(0xff008A40))),
      onPressed: () => showProgressDialog('Loading...'),
    );

    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
                child: homerefleshimage,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: homerefleshcontent,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: homerefleshbottombutton,
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
      appBar: homerefleshappbar(),
      body: homerefleshbody(),
    );
  }

  Future showProgressDialog(String message) async {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeBluetooth(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // const begin = Offset(0.0, 1.0);
          // const end = Offset.zero;
          // const curve = Curves.ease;

          // var tween =
          //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child);
        },
      );
    }

    const cupertinoactivityindicator = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );

    final alertdialogtextstyle = Text(
      message,
      style: const TextStyle(
          fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w400),
    );

    var alertdialogloading = AlertDialog(
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
                  child: cupertinoactivityindicator,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: alertdialogtextstyle),
              ],
            ),
          ),
        ),
      ),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            _createRoute(),
          ); // Home_BT연결이 끊어진 경우
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(70, 246, 70, 246),
            child: alertdialogloading,
          ),
        );
      },
    );
  }
}
