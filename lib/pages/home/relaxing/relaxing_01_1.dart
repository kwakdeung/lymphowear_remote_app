import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';

class RelaxingMode extends StatefulWidget {
  const RelaxingMode({Key? key}) : super(key: key);

  @override
  State<RelaxingMode> createState() => _RelaxingModeState();
}

class _RelaxingModeState extends State<RelaxingMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          'Relaxing Mode',
          style: TextStyle(
              fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 56, 16, 32),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(999.0)),
                    border: Border.all(
                      color: const Color(0xffE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: const CircularIndicator(),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 112),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xffEEEEEE), width: 1),
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
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset(
                                'assets/icons/ic_relaxing2.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(0.0),
                              child: const Text(
                                'Relaxing Mode',
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
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12, width: 0),
                        ),
                        child: const Text(
                            'A mode that relieves fatigue and restores energy by removing toxins that are piled up late in the afternoon. A mode that relieves fatigue and restores energy by removing toxins that are piled up late in the afternoon.',
                            style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 96),
                          width: double.infinity,
                          child: SvgPicture.asset(
                            'assets/images/mode_image.svg',
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
