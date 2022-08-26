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
                  margin: const EdgeInsets.all(0.0),
                  height: 18,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4.0,
                      trackShape: RoundedRectSliderTrackShape(),
                      activeTrackColor: const Color(0xff0BB15D),
                      inactiveTrackColor: const Color(0xffEEEEEE),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 8.0,
                        pressedElevation: 8.0,
                      ),
                      thumbColor: const Color(0xffFFFFFF),
                      // const Color(0xffFFFFFF),
                      // overlayColor: Colors.pink.withOpacity(0.2),
                      // overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor:
                          const Color(0xff212121).withOpacity(0.12),
                      inactiveTickMarkColor:
                          const Color(0xff212121).withOpacity(0.12),
                      // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      // valueIndicatorColor: const Color(0xff0BB15D),
                      // valueIndicatorTextStyle: TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 20.0,
                      // ),
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 3.0,
                      value: armpitValue,
                      divisions: 3,
                      // label: '${colloarboneValue.round()}',
                      onChanged: (value) {
                        setState(() {
                          armpitValue = value;
                        });
                      },
                    ),
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
              'assets/icons/ic_max.svg',
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
