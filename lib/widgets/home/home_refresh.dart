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
              icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color(0xffF3F3F3),
          child: Container(
            margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 48, 0, 32),
                  child: Image.asset(
                    'assets/images/Home_refresh_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(76, 0, 75, 0),
                  child: Image.asset(
                    'assets/images/Home_refresh_content.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(99, 0, 99, 0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cached),
                    label: const Text(
                      'Refresh',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        side: const BorderSide(color: Colors.green)),
                    onPressed: () => showProgressDialog('Loading...'),
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
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            content: Container(
              margin: const EdgeInsets.all(0.0),
              width: 186,
              height: 96,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(81, 8, 81, 4),
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
  }
}
