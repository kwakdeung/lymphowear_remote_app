import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

import 'package:lymphowear_remote_app/pages/pairing_page.dart';

class None extends StatefulWidget {
  const None(
      {Key? key,
      required this.appbarIcon,
      required this.logoTitle,
      required this.leadingButton})
      : super(key: key);
  final Widget logoTitle, appbarIcon, leadingButton;

  @override
  State<None> createState() => _NoneState();
}

class _NoneState extends State<None> {
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
      appBar: NoneAppbar(
        logoTitle: widget.logoTitle,
        appbarIcon: widget.appbarIcon,
        leadingButton: widget.leadingButton,
      ),
      body: NoneBody(),
    );
  }
}

class NoneAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NoneAppbar(
      {Key? key,
      required this.appbarIcon,
      required this.logoTitle,
      required this.leadingButton})
      : super(key: key);
  final Widget logoTitle, appbarIcon, leadingButton;
  @override
  Size get preferredSize => const Size.fromHeight(56);

  // final appbarLogo = SvgPicture.asset(
  //   'assets/images/lymphowear.svg',
  //   fit: BoxFit.fill,
  // );

  // IconButton appbarIconButton(BuildContext context) {
  //   return IconButton(
  //     icon: SvgPicture.asset(
  //       appbarIcon,
  //       fit: BoxFit.fill,
  //     ),
  //     color: const Color(0xff616161),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: ((context) => const SettingPage()),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: appbarleadingMargin,
        child: leadingButton,
      ),
      automaticallyImplyLeading: false,
      title: Container(
        margin: logoMargin,
        child: logoTitle,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: appbarIconbuttonMargin,
          child: appbarIcon,
        ),
      ],
    );
  }
}

class NoneBody extends StatelessWidget {
  NoneBody({Key? key}) : super(key: key);

  Text title(context) {
    return Text(
      "There’s no device connected.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Text content(context) {
    return Text(
      "Press the button and\nconnect to the device.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

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
          margin: bodyMargin,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
                child: title(context),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: content(context),
              ),
              Container(
                margin: zeroMargin,
                child: image,
              ),
              const Spacer(),
              Container(
                margin: zeroMargin,
                width: double.infinity,
                child: const NoneBottomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Route _createroute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         const PairingPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return ScaleTransition(
//           scale: Tween<double>(
//             begin: 0.0,
//             end: 1.0,
//           ).animate(
//             CurvedAnimation(
//               parent: animation,
//               curve: Curves.fastOutSlowIn,
//             ),
//           ),
//           child: child);
//     },
//   );
// }

class NoneBottomButton extends StatelessWidget {
  const NoneBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: Color(0xff008A40),
      ),
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff008A40),
        side: const BorderSide(color: Color(0xff008A40)),
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const PairingPage()),
          ),
        );
        // Navigator.pushReplacement(context, _createroute());
      },
      label: const Text('Add Device'),
    );
  }
}
