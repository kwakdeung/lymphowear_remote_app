import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_connect.dart';

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

  AppBar pairingfailedappbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey[700],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PairingFailed())));
          },
        ),
      ),
      backgroundColor: Colors.white,
      title: const Text(
        'Add Device',
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      centerTitle: true,
    );
  }

  Center pairingfailedbody() {
    final pairingfailedimage = SvgPicture.asset(
      'assets/images/pairing02_2_alert.svg',
    );

    const pairingfailedtitle = Text(
      "No device found",
      style: TextStyle(
          color: Color(0xff212121),
          fontSize: 16,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    const pairingfailedcontent = Text(
      "Make sure device is turned on\nand in range.",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color(0xff757575),
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    final pairingfailedbottombutton = ElevatedButton(
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
          builder: (context) => const PairingConnect(),
        ));
      },
      child: const Text(
        'Try Again',
      ),
    );

    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
              child: pairingfailedimage,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: pairingfailedtitle),
            Container(
                margin: const EdgeInsets.all(0.0), child: pairingfailedcontent),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 156, 0, 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: pairingfailedbottombutton,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: pairingfailedappbar(),
      body: pairingfailedbody(),
    );
  }
}
