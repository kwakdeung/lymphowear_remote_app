import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_loading.dart';

class PairingFailed extends StatefulWidget {
  const PairingFailed({Key? key}) : super(key: key);

  @override
  State<PairingFailed> createState() => _PairingFailedState();
}

class _PairingFailedState extends State<PairingFailed> {
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
    pageController = PageController();
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
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(156, 80, 156, 16),
              child: Image.asset(
                'assets/images/Pairing02_2_alert.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(115, 0, 114, 8),
              child: Image.asset(
                'assets/images/Pairing02_2_title.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(76, 0, 76, 0),
              child: Image.asset(
                'assets/images/Pairing02_2_content.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 220, 20, 80),
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 48),
                  primary: Colors.white,
                  onPrimary: Colors.green[500],
                  surfaceTintColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const PairingLoading()),
                      ));
                },
                child: const Text('Try Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
