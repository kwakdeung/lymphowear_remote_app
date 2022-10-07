import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';

class PairingLoading extends StatefulWidget {
  const PairingLoading({
    Key? key,
    required this.routePairing,
    required this.navigator,
  }) : super(key: key);
  final Widget routePairing, navigator;
  @override
  State<PairingLoading> createState() => _PairingLoadingState();
}

class _PairingLoadingState extends State<PairingLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PairingLoadingAppbar(
        navigator: widget.navigator,
      ),
      body: PairingLoadingBody(
        routePairing: widget.routePairing,
      ),
    );
  }
}

class PairingLoadingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingLoadingAppbar({
    Key? key,
    required this.navigator,
  }) : super(key: key);
  final Widget navigator;
  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: const Color(0xff616161),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigator,
          ),
        );
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
        margin: appbarleadingMargin,
        child: appbarIconButton(context),
      ),
      backgroundColor: Colors.white,
      title: appbarTitle(context),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class PairingLoadingBody extends StatefulWidget {
  const PairingLoadingBody({Key? key, required this.routePairing})
      : super(key: key);

  final Widget routePairing;
  @override
  State<PairingLoadingBody> createState() => _PairingLoadingBodyState();
}

class _PairingLoadingBodyState extends State<PairingLoadingBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  double maxValue = 1.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        loadPage();
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

  void loadPage() {
    if (controller.value == maxValue) {
      controller.stop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget.routePairing,
        ),
      );
    }
  }

  CircularProgressIndicator circularprogressIndicator() {
    return CircularProgressIndicator(
      value: controller.value,
      color: const Color(0xff0BB15D),
      backgroundColor: const Color(0xff0BB15D).withOpacity(0.16),
    );
  }

  Center loadingText(context) {
    return Center(
      child: Text(
        'Searching for device...',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: bodyMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: circularprogressIndicator(),
            ),
            Container(
              margin: zeroMargin,
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
        padding: buttonPadding,
        backgroundColor: const Color(0xffE0E0E0),
        foregroundColor: const Color(0xff757575),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: semiBold,
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const PairingPage()),
          ),
        );
      },
      child: const Text('Stop'),
    );
  }
}
