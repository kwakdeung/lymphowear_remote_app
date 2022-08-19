import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircularIndicatorState();
  }
}

class _CircularIndicatorState extends State<CircularIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  double _value = 900;
  bool _working = false;
  String value = 'Paring...';
  bool _active = true;

  void _handleTap() {
    if (_active) {
      debugPrint('test true');
      pairing();
      startWorking();
    } else {
      debugPrint('test false');
      pairing();
      stopWorking();
    }
    setState(() {
      _active = !_active;
    });
  }

  void pairing() async {
    setState(() {
      value;
    });
  }

  void startWorking() async {
    setState(() {
      _working = true;
      _value = 900;
    });
    for (int i = 0; i < 10; i--) {
      if (!_working) {
        break;
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _value -= 0.1;
      });
    }
    setState(() {
      _working = false;
    });
  }

  void stopWorking() {
    setState(() {
      _working = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            width: 144,
            height: 144,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: _value,
                  backgroundColor: Colors.green[100],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Center(
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: SvgPicture.asset(
                            'assets/images/Battery.svg',
                            width: 20,
                            height: 10,
                          ),
                        ),
                        Text(
                          "${(_value).round()}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color(0xff0BB15D), width: 1.5),
                            color: _active
                                ? const Color(0xff0BB15D)
                                : Colors.white,
                          ),
                          child: IconButton(
                              onPressed: () {
                                _handleTap();
                              },
                              color: _active
                                  ? Colors.white
                                  : const Color(0xff0BB15D),
                              icon: _active
                                  ? SvgPicture.asset(
                                      "assets/images/ic_play_full.svg")
                                  : SvgPicture.asset(
                                      "assets/images/ic_pause_full.svg")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIn {
  final dynamic value, backgroundColor, valueColor;

  CircularIn({
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
  });
}

double _value = 0;
final List<CircularIn> circularinData = [
  CircularIn(
    value: _value,
    backgroundColor: Colors.green[100],
    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
  ),
];
