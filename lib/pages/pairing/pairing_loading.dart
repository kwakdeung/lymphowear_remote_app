import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/pages/pairing/pairing_connect.dart';
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
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
                child: CircularProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.green[50],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0.0),
                child: const Center(
                    child: Text(
                  'Searching for device...',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )),
              ),
              const Spacer(),
              Container(
                // margin: const EdgeInsets.fromLTRB(0, 156, 0, 0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: ElevatedButton(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
