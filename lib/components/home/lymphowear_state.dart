import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';

class LymphoWearState extends StatefulWidget {
  const LymphoWearState({Key? key}) : super(key: key);

  @override
  State<LymphoWearState> createState() => _LymphoWearStateState();
}

class _LymphoWearStateState extends State<LymphoWearState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(53, 20, 53, 20),
          child: const FittedBox(
            child: Text(
              'Manual Mode',
              style:
                  TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
            ),
          ),
        ),
        FittedBox(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("-1분");
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff212121), width: 2),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                        surfaceTintColor: Colors.white),
                    child: SvgPicture.asset(
                      'assets/icons/ic_minus.svg',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("+1분");
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xff212121), width: 2),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                        surfaceTintColor: Colors.white),
                    child: SvgPicture.asset(
                      'assets/icons/ic_plus.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
