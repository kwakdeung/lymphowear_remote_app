import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/ui/responsive/responsive_builder.dart';
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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'LymphoWear',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  icon: const Icon(Icons.settings_outlined), onPressed: () {}),
            ],
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(0),
              color: Colors.grey[100],
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isMobileWidth(context))
                    if (isMobileHeight(context))
                      Container(
                        margin: const EdgeInsets.fromLTRB(164, 80, 164, 8),
                        child: const Icon(
                          Icons.bluetooth_disabled,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(121, 0, 120, 24),
                    child: const Text(
                      'Not connected',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(125.5, 0, 125.5, 352),
                    padding: const EdgeInsets.fromLTRB(10, 24, 10, 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: const Size(109, double.infinity),
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
        );
      },
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
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Center(
                child: Text(
              'Failed to Connect',
              style: TextStyle(fontSize: 15),
            )),
            actions: [
              Container(
                margin: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40),
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
                      margin: const EdgeInsets.only(left: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40),
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
