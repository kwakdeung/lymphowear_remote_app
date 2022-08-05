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

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Add Device',
          style: TextStyle(
            fontSize: 20,
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
              margin: const EdgeInsets.only(top: 100, bottom: 25),
              padding: const EdgeInsets.all(0.0),
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.green[50],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3, bottom: 275),
              padding: const EdgeInsets.all(0.0),
              child: const Center(
                  child: Text(
                'Searching for device...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              padding: const EdgeInsets.all(0.0),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(pageSize.width * 0.87, 50),
                  primary: Colors.grey[200],
                  onPrimary: Colors.grey,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
