import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lymphowear_remote_app/pages/my_none.dart';
import 'package:lymphowear_remote_app/pages/setting/alarm/alarm01_1.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Setting',
          style: TextStyle(
              fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        margin: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset(
                    "assets/icons/ic_my_device.svg",
                  ),
                ),
                title: const Text(
                  'My Device',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                tileColor: Colors.white,
                trailing: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:
                        SvgPicture.asset("assets/icons/ic_chevron_right.svg")),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const MyNone())));
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset("assets/icons/ic_timer.svg"),
                ),
                title: const Text(
                  'Alarm',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset("assets/icons/ic_chevron_right.svg"),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AlarmPage())));
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset("assets/icons/ic_info.svg"),
                ),
                title: const Text('User Guide',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400)),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset("assets/icons/ic_chevron_right.svg"),
                ),
                onTap: () {},
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Container(
                    margin: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset("assets/icons/ic_help.svg")),
                title: const Text('FAQ',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400)),
                tileColor: Colors.white,
                trailing: Container(
                  margin: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset("assets/icons/ic_chevron_right.svg"),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
