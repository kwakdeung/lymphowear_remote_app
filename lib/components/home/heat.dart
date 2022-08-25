import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Heat extends StatefulWidget {
  const Heat({Key? key}) : super(key: key);

  @override
  State<Heat> createState() => _HeatState();
}

class _HeatState extends State<Heat> {
  double heatValue = 1;

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
              'assets/images/Heat.svg',
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          //   child: SvgPicture.asset(
          //     'assets/images/ic_min.svg',
          //     width: 16,
          //     height: 16,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Heat',
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
                        '  ${heatValue.round()}',
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
                    value: heatValue,
                    max: 2,
                    divisions: 2,
                    onChanged: (double value) {
                      setState(() {
                        heatValue = value;
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: SvgPicture.asset(
              'assets/icons/ic_heat_max.svg',
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
