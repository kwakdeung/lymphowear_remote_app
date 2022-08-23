import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Armpit extends StatefulWidget {
  const Armpit({Key? key}) : super(key: key);

  @override
  State<Armpit> createState() => _ArmpitState();
}

class _ArmpitState extends State<Armpit> {
  double armpitValue = 2;

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
              'assets/images/Armpit.svg',
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
                        'Armpit',
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
                        '  ${armpitValue.round()}',
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
                    value: armpitValue,
                    max: 3,
                    divisions: 3,
                    onChanged: (double value) {
                      setState(() {
                        armpitValue = value;
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
