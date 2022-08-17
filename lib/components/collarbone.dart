import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Collarbone extends StatefulWidget {
  const Collarbone({Key? key}) : super(key: key);

  @override
  State<Collarbone> createState() => _CollarboneState();
}

class _CollarboneState extends State<Collarbone> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
            child: SvgPicture.asset(
              'assets/images/Collarbone.svg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Collarbone',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'Intensity',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      ' ${_currentSliderValue.round()}',
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.green,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SvgPicture.asset(
                        'assets/images/ic_min.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(0.0),
                      width: 168,
                      height: 48,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4.0,
                          trackShape: const RoundedRectSliderTrackShape(),
                          activeTrackColor: Colors.green[300],
                          inactiveTrackColor: const Color(0xffEEEEEE),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8.0,
                            pressedElevation: 8.0,
                          ),
                          thumbColor: Colors.green[300],
                          overlayColor: Colors.green.withOpacity(0.2),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 12.0),
                          tickMarkShape: const RoundSliderTickMarkShape(),
                          activeTickMarkColor:
                              const Color(0xff212121).withOpacity(0.16),
                          inactiveTickMarkColor: Colors.grey,
                          valueIndicatorShape:
                              const PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: Colors.white,
                          valueIndicatorTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Slider(
                              min: 0.0,
                              max: 3.0,
                              value: _currentSliderValue,
                              divisions: 3,
                              label: '${_currentSliderValue.round()}',
                              onChanged: (value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              }),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SvgPicture.asset(
                        'assets/images/ic_max.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
