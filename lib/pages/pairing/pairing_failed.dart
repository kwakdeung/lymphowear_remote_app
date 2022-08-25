import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
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
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(35, 0, 35, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 80, 0, 16),
                child: SvgPicture.asset(
                  'assets/images/Pairing02_2_alert.svg',
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: const Text(
                  "No device found",
                  style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: const Text(
                    "Make sure device is turned on\nand in range.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  )),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 156, 0, 0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    primary: Colors.white,
                    onPrimary: const Color(0xff008A40),
                    surfaceTintColor: Colors.white,
                    textStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    side: const BorderSide(color: Color(0xff008A40)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Try Again',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
