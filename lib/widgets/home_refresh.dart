import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

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
          child: SvgPicture.asset(
            'assets/images/LymphoWear.svg',
            fit: BoxFit.fill,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.grey[200],
              height: 2.0,
            )),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/ic_setting.svg',
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SettingPage())));
                }),
          ),
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
                  margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
                  child: Image.asset(
                    'assets/images/2.0x/Home_refresh_image.png',
                    width: 240,
                    height: 184,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    'assets/images/2.0x/Home_refresh_content.png',
                    width: 209,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(84, 0, 84, 0),
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
                        child: const CupertinoActivityIndicator(
                          animating: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(56, 8, 56, 0),
                        child: Text(
                          message,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "Poppins"),
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
