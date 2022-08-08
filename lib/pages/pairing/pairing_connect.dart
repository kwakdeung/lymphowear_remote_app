import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_complete.dart';

class PairingConnect extends StatefulWidget {
  const PairingConnect({Key? key}) : super(key: key);

  @override
  State<PairingConnect> createState() => _PairingConnectState();
}

class _PairingConnectState extends State<PairingConnect> {
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
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 72),
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/Pairing03.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: bottombuttonmargin,
              padding: bottombuttonpadding,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 48), // 왼쪽 width 미디어 쿼리 적용하기
                  primary: Colors.green[500],
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () => showProgressDialog('Pairing...'),

                // 페이지 중 앱바 유지 위젯만 바꾸기
                child: const Text('Connect'),
              ),
            ),
          ],
        ),
      ), // Start Button
    );
  }

  Future showProgressDialog(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const PairingComplete())); // start
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            content: SizedBox(
              height: 90,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          strokeWidth: 5.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
