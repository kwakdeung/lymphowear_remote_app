import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/ble_singleton.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/add_device_appbar.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_complete.dart';
import 'package:lymphowear_remote_app/pages/orange_bottom_button.dart';

class PairingConnect extends StatefulWidget {
  const PairingConnect({Key? key}) : super(key: key);

  @override
  State<PairingConnect> createState() => _PairingConnectState();
}

class _PairingConnectState extends State<PairingConnect> {
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
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AddDeviceAppbar(),
      body: PairingConnectBody(),
    );
  }
}

class PairingConnectBody extends StatelessWidget {
  const PairingConnectBody({Key? key}) : super(key: key);

  static const title = Text(
    'Confirm on the device',
    style: TextStyle(
      color: Color(0xffED711A),
      fontSize: 16,
      fontWeight: semiBold,
    ),
  );
  Container pairingDevice() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffF9F9F9),
        border: Border.all(
          color: const Color(0xffEEEEEE),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/pairing_connect_image.png',
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 4),
            child: const Text(
              'LymphoWear (LW-100)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: semiBold),
            ),
          ),
          Text(
            'Serial number. ${BleSingleton().serialNumber()}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: regular),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: bodyMargin,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 56, 0, 16),
              child: title,
            ),
            pairingDevice(),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: OrangeBottomButton(
                buttonText: 'Connect',
                onPressed: () {
                  var ble = BleSingleton();
                  ble.onSuccessConnect = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PairingComplete(),
                      ),
                    );
                  };

                  ble.onFailedConnect = (message) {};
                  ble.connect();

                  showProgressDialog(
                    context,
                    'Pairing...',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showProgressDialog(BuildContext context, String message) async {
    void delay() {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PairingComplete(),
          ),
        );
      });
    }

    const activityIndicator = CupertinoActivityIndicator(
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
                  child: activityIndicator,
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
