import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants.dart';
import 'pairing/pairing_failed.dart';
import 'pairing/pairing_loading.dart';
import 'orange_bottom_button.dart';
import 'setting_page.dart';
import 'no_device_page.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.contacts.request().isGranted) {}

      await [
        Permission.location,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
      ].request();
    }
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
      appBar: const PairingPageAppbar(),
      body: PairingPageBody(),
    );
  }
}

class PairingPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PairingPageAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: const Color(0xff616161),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NoDevicePage(
              logoTitle: SvgPicture.asset(
                'assets/images/lymphowear.svg',
                fit: BoxFit.fill,
              ),
              appbarIcon: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/ic_setting.svg',
                  fit: BoxFit.fill,
                ),
                color: const Color(0xff616161),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SettingPage()),
                    ),
                  );
                },
              ),
              leadingButton: Container(),
              routePairing: const PairingPage(),
            ),
          ),
        );
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
      leading: appbarIconButton(context),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      title: appbarTitle(context),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class PairingPageBody extends StatelessWidget {
  PairingPageBody({Key? key}) : super(key: key);

  final image = Image.asset(
    'assets/images/pairing_page_image.png',
    fit: BoxFit.fill,
  );

  Text description(context) {
    return Text(
      'Turn on the main unit and press\nthe “Start” button to make\nthe Bluetooth connection.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: bodyMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 59, 0, 32),
              child: image,
            ),
            description(context),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: OrangeBottomButton(
                buttonText: 'Start',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PairingLoading(
                            navigator: PairingPage(),
                            routePairing: PairingFailed(),
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
