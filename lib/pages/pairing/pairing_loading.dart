import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_connect.dart';

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
    Timer(const Duration(milliseconds: 3700), () {
      // 시간 제한
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const PairingConnect(), // Pairing 연결
        // builder: (context) => const PairingFailed(), // Pairing 실패
        // builder: (context) => const PairingComplete(), // Pairing 성공
      ));
    });
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Add Device',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[200],
              height: 2.0,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(160, 80, 160, 16),
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.green[50],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(93, 0, 92, 0),
              child: const Center(
                  child: Text(
                'Searching for device...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 276, 20, 80),
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 48),
                  primary: Colors.grey[200],
                  onPrimary: Colors.grey,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Stop'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
