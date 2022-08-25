import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/circularindicator.dart';

class LymphoWearState extends StatelessWidget {
  const LymphoWearState({Key? key}) : super(key: key);

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
                    onPressed: () {},
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
                  child: CircularIndicator(),
                ),
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
                  child: ElevatedButton(
                    onPressed: () {},
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
