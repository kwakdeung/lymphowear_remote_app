import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Shoulder extends StatefulWidget {
  const Shoulder({Key? key}) : super(key: key);

  @override
  State<Shoulder> createState() => _ShoulderState();
}

class _ShoulderState extends State<Shoulder> {
  double shoulderValue = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      height: 54,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: SvgPicture.asset(
              'assets/images/Shoulder.svg',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Shoulder',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      const Text(
                        'Intensity',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        '  ${shoulderValue.round()}',
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: double.infinity,
                  height: 18,
                  child: Slider(
                    value: shoulderValue,
                    max: 3,
                    divisions: 3,
                    onChanged: (double value) {
                      setState(() {
                        shoulderValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 0, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('off',
                          style:
                              TextStyle(fontFamily: "Poppins", fontSize: 10)),
                      Spacer(),
                      Text('1',
                          style:
                              TextStyle(fontFamily: "Poppins", fontSize: 10)),
                      Spacer(),
                      Text('2',
                          style:
                              TextStyle(fontFamily: "Poppins", fontSize: 10)),
                      Spacer(),
                      Text('3',
                          style:
                              TextStyle(fontFamily: "Poppins", fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: SvgPicture.asset(
              'assets/images/ic_max.svg',
              width: 16,
              height: 16,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
