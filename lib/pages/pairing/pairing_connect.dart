import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_complete.dart';

class PairingConnect extends StatefulWidget {
  const PairingConnect({Key? key}) : super(key: key);

  @override
  State<PairingConnect> createState() => _PairingConnectState();
}

class _PairingConnectState extends State<PairingConnect> {
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
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 56, 0, 16),
                  child: SvgPicture.asset(
                    'assets/images/Pairing03_text.svg',
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 234,
                height: 166,
                child: Image.asset('assets/images/2.0x/Pairing03_image.png'),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: ElevatedButton(
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
                  onPressed: () => showProgressDialog('Pairing...'),
                  child: const Text(
                    'Connect',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showProgressDialog(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PairingComplete()));
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: Container(
            margin: const EdgeInsets.fromLTRB(70, 246, 70, 246),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              content: Container(
                margin: const EdgeInsets.all(0.0),
                height: 62,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: const CupertinoActivityIndicator(
                            radius: 12,
                            animating: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Text(
                            message,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
