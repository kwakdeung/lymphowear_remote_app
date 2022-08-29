import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SleepingMode extends StatefulWidget {
  const SleepingMode({Key? key}) : super(key: key);

  @override
  State<SleepingMode> createState() => _SleepingModeState();
}

class _SleepingModeState extends State<SleepingMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        title: const Text('Sleeping Mode',
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 32, 20, 112),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffEEEEEE), width: 1),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                  spreadRadius: 0,
                  offset: Offset(4, 1),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(
                            "assets/icons/ic_sleeping2.svg",
                            width: 24,
                            height: 24,
                          )),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: const Text(
                          'Sleeping Mode',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: const Text(
                          'Total Time : 15 mins',
                          style: TextStyle(
                              color: Color(0xff9E9E9E),
                              fontSize: 10,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12, width: 0),
                    color: const Color(0xffEEEEEE),
                  ),
                  child: const Text(
                    "A mode that helps you sleep well by lowering your body's tension through gentle lymph stimulation before going to bed. A mode that helps you sleep well by lowering your body's tension through gentle lymph stimulation before going to bed.",
                    style: TextStyle(
                        color: Color(0xff616161),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/images/Mode_image.svg',
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
