import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_connect.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

class PairingReloading extends StatefulWidget {
  const PairingReloading({
    Key? key,
  }) : super(key: key);

  @override
  State<PairingReloading> createState() => _PairingReloadingState();
}

class _PairingReloadingState extends State<PairingReloading> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PairingReloadingAppbar(),
      body: PairingReloadingBody(),
    );
  }
}

class PairingReloadingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingReloadingAppbar({Key? key}) : super(key: key);

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
      style: Theme.of(context).textTheme.headline1,
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

class PairingReloadingBody extends StatefulWidget {
  const PairingReloadingBody({Key? key}) : super(key: key);

  @override
  State<PairingReloadingBody> createState() => _PairingReloadingBodyState();
}

class _PairingReloadingBodyState extends State<PairingReloadingBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        nextpage();
        setState(() {});
      });
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextpage() {
    if (controller.value == 1) {
      controller.stop();
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const PairingConnect())));
    }
  }

  CircularProgressIndicator circularprogressindicator() {
    return CircularProgressIndicator(
      value: controller.value,
      color: Colors.green,
      backgroundColor: Colors.green[50],
    );
  }

  Center loadingText(context) {
    return Center(
        child: Text(
      'Searching for device...',
      style: Theme.of(context).textTheme.headline2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: circularprogressindicator(),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              child: loadingText(context),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const PairingLodingBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingLodingBottomButton extends StatelessWidget {
  const PairingLodingBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: const Color(0xffE0E0E0),
        onPrimary: const Color(0xff757575),
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Stop',
      ),
    );
  }
}
