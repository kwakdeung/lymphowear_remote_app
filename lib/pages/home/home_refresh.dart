import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/home/home_bluetooth.dart';
import 'package:lymphowear_remote_app/pages/lymphowear_appbar.dart';

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
      appBar: LymphoWearAppbar(),
      body: HomeRefreshBody(),
    );
  }
}

class HomeRefreshBody extends StatelessWidget {
  HomeRefreshBody({Key? key}) : super(key: key);

  final image = Image.asset(
    'assets/images/home_refresh_image.png',
    fit: BoxFit.fill,
  );

  Text title(context) {
    return Text(
      'LymphoWear is turned off.\nTurn on LymphoWear',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        width: double.infinity,
        child: Container(
          margin: bodyMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
                child: image,
              ),
              Container(
                margin: zeroMargin,
                child: title(context),
              ),
              const Spacer(),
              Container(
                margin: zeroMargin,
                width: double.infinity,
                child: const HomeRefleshBottomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeRefleshBottomButton extends StatelessWidget {
  const HomeRefleshBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.cached,
        color: Color(0xff008A40),
      ),
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff008A40),
        side: const BorderSide(color: Color(0xff008A40)),
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: () {
        showProgressDialog(context, 'Loading...');
      },
      label: const Text('Refresh'),
    );
  }

  Future showProgressDialog(BuildContext context, String message) async {
    void delay() {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomeBluetooth()),
          ),
        );
      });
    }

    const cupertinoactivityIndicator = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );

    final alertdialogText = Text(
      message,
      style: Theme.of(context).textTheme.subtitle1,
    );

    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Container(
        margin: zeroMargin,
        height: 62,
        child: Center(
          child: Container(
            margin: dialogMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: cupertinoIndicatorMargin,
                  child: cupertinoactivityIndicator,
                ),
                Container(
                  margin: dialogTextMargin,
                  child: alertdialogText,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        delay();
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(70, 246, 70, 246),
            child: alertDialog,
          ),
        );
      },
    );
  }
}
