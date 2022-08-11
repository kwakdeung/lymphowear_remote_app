import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_loading.dart';
import 'package:lymphowear_remote_app/ui/responsive/responsive_builder.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  bool isButtonActive = true;
  late PageController pageController;
  int pageIndex = 0;
  int curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                exit(0);
              },
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
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
                  margin: const EdgeInsets.fromLTRB(60, 56, 60, 24),
                  padding: const EdgeInsets.all(0.0),
                  width: 240, // log
                  height: 160,
                  child: Image.asset(
                    'assets/images/Pairing01_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(43, 0, 42, 8),
                  padding: const EdgeInsets.all(0.0),
                  width: 275, // log
                  height: 20,
                  child: Image.asset(
                    'assets/images/Pairing01_title.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(45, 0, 44, 0),
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                    width: 271, // log
                    height: 60,
                    'assets/images/Pairing01_content.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 104, 20, 80),
                  padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(320, 48),
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const PairingLoading()),
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
        );
      },
    );
  }
}
