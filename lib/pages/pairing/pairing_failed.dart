import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lymphowear_remote_app/pages/pairing/pairing_reloading.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

class PairingFailed extends StatefulWidget {
  const PairingFailed({Key? key}) : super(key: key);

  @override
  State<PairingFailed> createState() => _PairingFailedState();
}

class _PairingFailedState extends State<PairingFailed> {
  bool isButtonActive = true;
  late PageController pageController;
  int pageIndex = 0;
  int curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const PairingFailedAppbar(),
      body: PairingFailedBody(),
    );
  }
}

class PairingFailedAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingFailedAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbariconbutton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PairingPage(),
        ));
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'Add Device',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: appbariconbutton(context)),
      backgroundColor: Colors.white,
      title: appbarTitle(context),
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      centerTitle: true,
    );
  }
}

class PairingFailedBody extends StatelessWidget {
  PairingFailedBody({Key? key}) : super(key: key);

  final image = SvgPicture.asset(
    'assets/images/pairing02_2_alert.svg',
  );

  Text title(context) {
    return Text(
      "No device found",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Text content(context) {
    return Text(
      "Make sure device is turned on\nand in range.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: image,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: title(context),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              child: content(context),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 156, 0, 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const PairingFailedBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingFailedBottomButton extends StatelessWidget {
  const PairingFailedBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: Colors.white,
        onPrimary: const Color(0xff008A40),
        surfaceTintColor: Colors.white,
        textStyle: const TextStyle(
            fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 16),
        side: const BorderSide(color: Color(0xff008A40)),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PairingReloading(),
        ));
      },
      child: const Text(
        'Try Again',
      ),
    );
  }
}
