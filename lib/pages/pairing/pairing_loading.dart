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
    Timer(const Duration(seconds: 1), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const PairingFailed())));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  AppBar pairingloadingappbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey[700],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      title: const Text(
        'Add Device',
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      centerTitle: true,
    );
  }

  Center pairingloadingbody() {
    var circularprogressindicator = CircularProgressIndicator(
      color: Colors.green,
      backgroundColor: Colors.green[50],
    );

    Center pairingcontent = const Center(
        child: Text(
      'Searching for device...',
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ));

    final pairingloadingbottombutton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        // fixedSize: const Size(320, 48),
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
              child: pairingcontent,
            ),
            const Spacer(),
            Container(
              // margin: const EdgeInsets.fromLTRB(0, 156, 0, 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: pairingloadingbottombutton,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: pairingloadingappbar(),
      body: pairingloadingbody(),
    );
  }
}
