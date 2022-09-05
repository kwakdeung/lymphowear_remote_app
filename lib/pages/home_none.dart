import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lymphowear_remote_app/pages/pairing_page.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class HomeNone extends StatefulWidget {
  const HomeNone({Key? key}) : super(key: key);

  @override
  State<HomeNone> createState() => _HomeNoneState();
}

class _HomeNoneState extends State<HomeNone> {
  Route _createroute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const PairingPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        // const curve = Curves.ease;

        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child);
      },
    );
  }

  AppBar homenoneappbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: SvgPicture.asset(
          'assets/images/lymphowear.svg',
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
                'assets/icons/ic_setting.svg',
                fit: BoxFit.fill,
              ),
              color: Colors.grey[700],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SettingPage())));
              }),
        ),
      ],
    );
  }

  Center homenonebody() {
    const homenonetitle = Text(
      "There’s no device connected.",
      style: TextStyle(
          color: Color(0xff212121),
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    const homenonecontent = Text(
      "Press the button and\nconnect to the device.",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color(0xff757575),
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    final homenoneimage = SvgPicture.asset(
      'assets/images/none_image.svg',
      fit: BoxFit.fill,
    );

    final homenonebottombutton = ElevatedButton.icon(
      onPressed: () {
        Navigator.pushReplacement(context, _createroute());
      },
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: Color(0xff008A40),
      ),
      label: const Text(
        'Add Device',
        style: TextStyle(
          color: Color(0xff008A40),
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: Colors.white,
        side: const BorderSide(color: Color(0xff008A40)),
      ),
    );

    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
                child: homenonetitle,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: homenonecontent,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: homenoneimage,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: homenonebottombutton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: homenoneappbar(),
      body: homenonebody(),
    );
  }
}
