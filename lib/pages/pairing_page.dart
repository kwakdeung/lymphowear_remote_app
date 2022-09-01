import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_loading.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
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
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.grey[700],
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeNone(),
            ));
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 59, 0, 32),
                  child: SvgPicture.asset(
                    'assets/images/Pairing01_image.svg',
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: const Text(
                  'Turn on the power of LymphoWear',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const Text(
                  "전원을 켜지 않으면 기기를 연결할 수 없습니다.\n만약 전원이 켜지지 않는다면,\n기기를 충전하고 다시 시도해주세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
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
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PairingLoading()),
                        ));
                  },
                  child: const Text(
                    'Start',
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
