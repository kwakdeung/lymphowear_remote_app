import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const AddDeviceAppbar(),
      body: PairingConnectBody(),
    );
  }
}

class PairingConnectBody extends StatelessWidget {
  PairingConnectBody({Key? key}) : super(key: key);

  static const title = Text(
    'Confirm on the device',
    style: TextStyle(
      color: Color(0xff006E33),
      fontSize: 16,
      fontWeight: regular,
    ),
  );
  final image = Image.asset(
    'assets/images/pairing_connect_image.png',
    fit: BoxFit.fill,
  );

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
            Container(
              margin: zeroMargin,
              child: image,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: GreenBottomButton(
                buttonText: 'Connect',
                onPressed: () {
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
