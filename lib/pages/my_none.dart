import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';
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
    return Scaffold(
      appBar: const MyNoneAppbar(),
      body: MyNoneBody(),
    );
  }
}

class MyNoneAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyNoneAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'My Device',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: appbarleadingMargin,
        child: appbarIconButton(context),
      ),
      title: appbarTitle(context),
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
  MyNoneBody({Key? key}) : super(key: key);

  Text title(context) {
    return Text(
      "There’s no device connected.",
      textAlign: TextAlign.center,
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
    return Container(
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
              child: const MyNoneBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         const MyNotConnected(),
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

class MyNoneBottomButton extends StatelessWidget {
  const MyNoneBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Navigator.pushReplacement(
        //   context,
        //   _createRoute(),
        // );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const MyNotConnected()),
          ),
        );
      },
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: Color(0xff008A40),
      ),
      label: Text(
        'Add Device',
        style: Theme.of(context).textTheme.button,
      ),
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xff008A40),
        ),
      ),
    );
  }
}
