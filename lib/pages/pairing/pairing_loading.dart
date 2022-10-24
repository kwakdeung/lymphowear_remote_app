import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/add_device_appbar.dart';
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
      appBar: const AddDeviceAppbar(),
      body: PairingLoadingBody(
        routePairing: widget.routePairing,
      ),
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

  loadingImage() {
    return Lottie.asset(
      "assets/images/searching.json",
      width: 300,
      height: 300,
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
              margin: const EdgeInsets.fromLTRB(0, 45, 0, 16),
              child: loadingImage(),
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
