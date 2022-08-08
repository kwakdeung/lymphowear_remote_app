import 'package:flutter/material.dart';

class HomeRefresh extends StatefulWidget {
  const HomeRefresh({Key? key}) : super(key: key);

  @override
  State<HomeRefresh> createState() => _HomeRefreshState();
}

class _HomeRefreshState extends State<HomeRefresh> {
  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.all(0.0),
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/Home_refresh.png',
              fit: BoxFit.fill,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(119, 16, 119, 200),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.cached),
                label: const Text(
                  'Refresh',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: const Size(122, 40),
                    side: const BorderSide(color: Colors.green)),
                onPressed: () => showProgressDialog('Loading...'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showProgressDialog(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
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
