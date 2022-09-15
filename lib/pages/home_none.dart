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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: HomeNoneAppbar(),
      body: HomeNoneBody(),
    );
  }
}

class HomeNoneAppbar extends StatelessWidget implements PreferredSizeWidget {
  HomeNoneAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  final appbarlogo = SvgPicture.asset(
    'assets/images/lymphowear.svg',
    fit: BoxFit.fill,
  );

  IconButton appbariconbutton(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(
          'assets/icons/ic_setting.svg',
          fit: BoxFit.fill,
        ),
        color: Colors.grey[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SettingPage())));
        });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: appbarlogo,
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 4),
          child: appbariconbutton(context),
        ),
      ],
    );
  }
}

class HomeNoneBody extends StatelessWidget {
  HomeNoneBody({Key? key}) : super(key: key);

  Text title(context) {
    return Text(
      "There’s no device connected.",
      style: Theme.of(context).textTheme.headline2,
    );
  }

  static const content = Text(
    "Press the button and\nconnect to the device.",
    textAlign: TextAlign.center,
    style: TextStyle(
        color: Color(0xff757575),
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  );

  final image = SvgPicture.asset(
    'assets/images/none_image.svg',
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
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
                child: title(context),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: content,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: image,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: const HomeNoneBottomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createroute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const PairingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
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

class HomeNoneBottomButton extends StatelessWidget {
  const HomeNoneBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
  }
}
