import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';

import 'package:lymphowear_remote_app/pages/pairing/pairing_complete.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

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
      appBar: const PairingConnectAppbar(),
      body: PairingConnectBody(),
    );
  }
}

class PairingConnectAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingConnectAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PairingPage(),
        ));
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'Add Device',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: appbarleadingMargin,
        child: appbarIconButton(context),
      ),
      backgroundColor: Colors.white,
      title: appbarTitle(context),
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      centerTitle: true,
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
      fontWeight: FontWeight.w400,
    ),
  );
  final image = Image.asset('assets/images/pairing_connect_image.png');

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
              child: const PairingConnectBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingConnectBottomButton extends StatelessWidget {
  const PairingConnectBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: const Color(0xff008A40),
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: () => showProgressDialog(context, 'Pairing...'),
      child: const Text(
        'Connect',
      ),
    );
  }

  Future showProgressDialog(BuildContext context, String message) async {
    const cupertinoactivityIndicator = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );

    final alertdialogText = Text(
      message,
      style: Theme.of(context).textTheme.subtitle1,
    );

    var alertDialog = AlertDialog(
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
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PairingComplete()));
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(70, 246, 70, 246),
            child: alertDialog,
          ),
        );
      },
    );
  }
}
