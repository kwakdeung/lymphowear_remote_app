import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/home/home_refresh.dart';

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

  IconButton appbariconbutton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  static const appbartitle = Text(
    'Add Device',
    style: TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: appbariconbutton(context),
      ),
      backgroundColor: Colors.white,
      title: appbartitle,
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

class PairingCompleteBody extends StatelessWidget {
  PairingCompleteBody({Key? key}) : super(key: key);

  final image = Image.asset(
    'assets/images/pairing04_image.png',
    fit: BoxFit.fill,
  );

  static const title = Text(
    'Pairing is complete',
    style: TextStyle(
        color: Color(0xff006E33),
        fontSize: 20,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600),
  );

  static const content = Text(
    "Let's start LymphoWear",
    style: TextStyle(
        color: Color(0xff757575),
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 56, 0, 32),
              child: image,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: title,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: content,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const PairingConnectBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingConnectBottomButton extends StatelessWidget {
  const PairingConnectBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: const Color(0xff008A40),
        onPrimary: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const HomeRefresh()),
            ));
      },
      child: const Text(
        'Start',
      ),
    );
  }
}
