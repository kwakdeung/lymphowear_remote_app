import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/setting/my/my_not_connected.dart';

class MyNone extends StatefulWidget {
  const MyNone({Key? key}) : super(key: key);

  @override
  State<MyNone> createState() => _MyNoneState();
}

class _MyNoneState extends State<MyNone> {
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
    return const Scaffold(
      appBar: MyNoneAppbar(),
      body: MyNoneBody(),
    );
  }
}

class MyNoneAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyNoneAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbariconbutton(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  static const title = Text('My Device',
      style: TextStyle(
          fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: appbariconbutton(context),
      ),
      title: title,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Colors.grey[200],
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class MyNoneBody extends StatelessWidget {
  const MyNoneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F3F3),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
              child: const Text(
                "There’s no device connected.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: const Text(
                  "Press the button and\nconnect to the device.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SvgPicture.asset(
                'assets/images/none_image.svg',
                fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: double.infinity,
              child: const MyNoneBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MyNotConnected(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
              .animate(animation),
          child: child);
    },
  );
}

class MyNoneBottomButton extends StatelessWidget {
  const MyNoneBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          _createRoute(),
        );
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
  }
}
