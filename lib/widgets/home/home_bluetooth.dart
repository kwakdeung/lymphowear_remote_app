import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/widgets/home/home_default.dart';

class HomeBluetooth extends StatefulWidget {
  const HomeBluetooth({Key? key}) : super(key: key);

  @override
  State<HomeBluetooth> createState() => _HomeBluetoothState();
}

class _HomeBluetoothState extends State<HomeBluetooth> {
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Image.asset('assets/images/Appbar_Text_LymphoWear.png'),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[200],
              height: 2.0,
            )),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings_outlined),
              color: Colors.grey[700],
              onPressed: () {}),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color(0xffF3F3F3),
          child: Container(
            margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 78, 0, 8),
                  child: const Icon(
                    Icons.bluetooth_disabled,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: const Text(
                    'Not connected',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.green)),
                    onPressed: () {
                      showProgressDialog('Connecting...');
                    },
                    child: const FittedBox(
                      child: Text(
                        'Connect',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showProgressDialog(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            content: Container(
              margin: const EdgeInsets.all(0.0),
              width: double.infinity,
              height: 96,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(96, 8, 96, 4),
                        height: 24.0,
                        width: 24.0,
                        child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            strokeWidth: 5.0),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(56, 8, 56, 8),
                        child: Text(
                          message,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            // 너비, 높이 설정
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: const Text(
                  'Failed to Connect',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            actions: [
              Container(
                //weight 없앰
                margin: const EdgeInsets.all(0.0),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 16, 4, 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          side:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeNone()),
                          );
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const HomeDefault()),
                              ));
                        },
                        child: const Text('Try Again'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
