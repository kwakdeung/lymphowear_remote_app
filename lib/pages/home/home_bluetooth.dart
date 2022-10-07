import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/home/home_default.dart';
import 'package:lymphowear_remote_app/pages/lymphowear_appbar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: LymphoWearAppbar(),
      body: const HomeBluetoothBody(),
    );
  }
}

class HomeBluetoothBody extends StatelessWidget {
  const HomeBluetoothBody({Key? key}) : super(key: key);

  IconButton bluetoothIcon() {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/ic_bluetooth_off.svg',
        fit: BoxFit.fill,
        width: 32,
        height: 32,
        color: const Color(0xff9E9E9E),
      ),
      onPressed: () {},
    );
  }

  static const title = Text(
    'Not connected',
    style: TextStyle(
      fontSize: 16,
      fontWeight: regular,
      color: Color(0xff9E9E9E),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        child: Container(
          margin: bodyMargin,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 78, 0, 8),
                child: bluetoothIcon(),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: title,
              ),
              const Spacer(),
              Container(
                margin: zeroMargin,
                width: double.infinity,
                child: const HomeBluetoothBottomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBluetoothBottomButton extends StatelessWidget {
  const HomeBluetoothBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        foregroundColor: const Color(0xff008A40),
        backgroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.button,
        side: const BorderSide(color: Color(0xff008A40)),
      ),
      onPressed: () {
        showProgressDialog(context, 'Connecting...');
      },
      child: const Text('Connect'),
    );
  }

  Future showProgressDialog(BuildContext context, String message) async {
    void delay() {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }

    const firstCupertinoactivityindicator = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );
    final firstAlertdialogText = Text(
      message,
      style: Theme.of(context).textTheme.subtitle1,
    );

    var firstAlertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                  child: firstCupertinoactivityindicator,
                ),
                Container(
                  margin: dialogTextMargin,
                  child: firstAlertdialogText,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Text secondAlertdialogTitle = Text(
      'Failed to Connect',
      style: Theme.of(context).textTheme.subtitle1,
    );

    final secondCancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(112, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        side: const BorderSide(width: 1.0, color: Color(0xff757575)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff757575),
        textStyle: dialogButtonText,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );

    final secondTryagainButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(112, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        backgroundColor: const Color(0xff008A40),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: semiBold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomeDefault()),
          ),
        );
      },
      child: Text(
        'Try Again',
        style: dialogButtonText,
      ),
    );

    var secondAlertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          child: secondAlertdialogTitle,
        ),
      ),
      actions: [
        Container(
          margin: zeroMargin,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 16, 4, 24),
                child: secondCancelButton,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                child: secondTryagainButton,
              ),
            ],
          ),
        ),
      ],
    );
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        delay();
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(59, 246, 59, 246),
            child: firstAlertdialog,
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
          child: secondAlertdialog,
        );
      },
    );
  }
}
