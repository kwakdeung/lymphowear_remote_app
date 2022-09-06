import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/pages/pairing/pairing_failed.dart';

class PairingLoading extends StatefulWidget {
  const PairingLoading({
    Key? key,
  }) : super(key: key);

  @override
  State<PairingLoading> createState() => _PairingLoadingState();
}

class _PairingLoadingState extends State<PairingLoading> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const PairingFailed())));
    });

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
      appBar: PairingLoadingAppbar(),
      body: PairingLoadingBody(),
    );
  }
}

class PairingLoadingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingLoadingAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbariconbutton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  static const appbartitle = Text(
    'Add Device',
    style: TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: appbariconbutton(context)),
      backgroundColor: Colors.white,
      title: appbartitle,
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

class PairingLoadingBody extends StatefulWidget {
  const PairingLoadingBody({Key? key}) : super(key: key);

  @override
  State<PairingLoadingBody> createState() => _PairingLoadingBodyState();
}

class _PairingLoadingBodyState extends State<PairingLoadingBody> {
  var circularprogressindicator = CircularProgressIndicator(
    color: Colors.green,
    backgroundColor: Colors.green[50],
  );

  static const loadingtext = Center(
      child: Text(
    'Searching for device...',
    style: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: circularprogressindicator,
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              child: loadingtext,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const PairingLodingBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingLodingBottomButton extends StatelessWidget {
  const PairingLodingBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: const Color(0xffE0E0E0),
        onPrimary: const Color(0xff757575),
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Stop',
      ),
    );
  }
}
