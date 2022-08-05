import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/widgets/home/home_bluetooth.dart';

class HomeNone extends StatelessWidget {
  const HomeNone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
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
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Image.asset(
              'assets/images/Home_none.png',
              fit: BoxFit.fill,
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 40),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          const HomeBluetooth()),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.green,
                ),
                label: const Text(
                  'Add Device',
                  style: TextStyle(color: Colors.green),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: Size(pageSize.width * 0.87, 50),
                  side: const BorderSide(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
