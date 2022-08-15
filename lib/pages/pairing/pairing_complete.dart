import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';

class PairingComplete extends StatefulWidget {
  const PairingComplete({Key? key}) : super(key: key);

  @override
  State<PairingComplete> createState() => _PairingCompleteState();
}

class _PairingCompleteState extends State<PairingComplete> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.grey[700],
          onPressed: () {
            exit(0);
          },
        ),
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
        child: Container(
          margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 24),
                child: Image.asset(
                  'assets/images/Pairing04_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Image.asset(
                  'assets/images/Pairing04_title.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 160),
                child: Image.asset(
                  'assets/images/Pairing04_content.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    primary: const Color(0xff008A40),
                    onPrimary: Colors.white,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomeNone()),
                        ));
                  },
                  child: const Text(
                    'Start',
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
