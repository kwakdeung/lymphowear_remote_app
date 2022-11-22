import 'package:flutter/material.dart';
import '../../constants.dart';
import '../orange_bottom_button.dart';
import '../home/custom_mode_view.dart';

class PairingComplete extends StatefulWidget {
  const PairingComplete({Key? key}) : super(key: key);

  @override
  State<PairingComplete> createState() => _PairingCompleteState();
}

class _PairingCompleteState extends State<PairingComplete> {
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
      appBar: const PairingCompleteAppbar(),
      body: PairingCompleteBody(),
    );
  }
}

class PairingCompleteAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const PairingCompleteAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

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

class PairingCompleteBody extends StatelessWidget {
  PairingCompleteBody({Key? key}) : super(key: key);

  final image = Image.asset(
    'assets/images/pairing_complete_image.png',
    fit: BoxFit.fill,
  );

  static const title = Text(
    'Pairing is complete',
    style: TextStyle(
      color: Color(0xffED711A),
      fontSize: 20,
      fontWeight: semiBold,
    ),
  );

  Text content(context) {
    return Text(
      "Let's start LymphoWear",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: bodyMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
              child: image,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: title,
            ),
            Container(
              margin: zeroMargin,
              child: content(context),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: OrangeBottomButton(
                buttonText: 'Start',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const CustomModeView()), (route) => false);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
