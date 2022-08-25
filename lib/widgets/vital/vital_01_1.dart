import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VitalMode extends StatefulWidget {
  const VitalMode({Key? key}) : super(key: key);

  @override
  State<VitalMode> createState() => _VitalModeState();
}

class _VitalModeState extends State<VitalMode> {
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
          'Vital Mode',
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
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 32, 20, 112),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12, width: 0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(0.0),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          'assets/icons/ic_vital2.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: const Text(
                          'Vital Mode',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
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
                    'Mode to start the day lightly after waking up to reduce swelling. Mode to start the day lightly after waking up to reduce swelling.',
                    style: TextStyle(
                        color: Color(0xff616161),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 128),
                    child: SvgPicture.asset('assets/images/Mode_image.svg')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
