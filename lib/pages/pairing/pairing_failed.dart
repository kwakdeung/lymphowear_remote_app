import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/add_device_appbar.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_connect.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_loading.dart';
import 'package:lymphowear_remote_app/pages/pairing_page.dart';
import 'package:lymphowear_remote_app/pages/white_bottom_button.dart';

class PairingFailed extends StatefulWidget {
  const PairingFailed({Key? key}) : super(key: key);

  @override
  State<PairingFailed> createState() => _PairingFailedState();
}

class _PairingFailedState extends State<PairingFailed> {
  bool isButtonActive = true;
  late PageController pageController;

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
      appBar: const AddDeviceAppbar(),
      body: PairingFailedBody(),
    );
  }
}

class PairingFailedBody extends StatelessWidget {
  PairingFailedBody({Key? key}) : super(key: key);

  final image = SvgPicture.asset(
    'assets/images/pairing_failed_alert.svg',
    fit: BoxFit.fill,
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
        margin: bodyMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: image,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: title(context),
            ),
            Container(
              margin: zeroMargin,
              child: content(context),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 156),
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: WhiteBottomButton(
                buttonText: 'Try Again',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const PairingLoading(
                        navigator: PairingPage(),
                        routePairing: PairingConnect(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
