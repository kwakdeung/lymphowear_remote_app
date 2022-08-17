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
  double _value = 0;
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
      _value = 150;
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
                          ),
                        ),
                        Text(
                          "Percent: ${(_value * 10).round()}%",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        GestureDetector(
                          onTap: _handleTap,
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.green, width: 1),
                              color: _active ? Colors.green : Colors.white,
                            ),
                            child: Center(
                              child: Icon(
                                _active ? Icons.play_arrow : Icons.pause,
                                color: _active ? Colors.white : Colors.green,
                              ),
                            ),
                          ),
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
