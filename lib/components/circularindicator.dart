import 'package:flutter/material.dart';

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircularIndicatorState();
  }
}

class _CircularIndicatorState extends State<CircularIndicator> {
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
      _value = 0;
    });
    for (int i = 0; i < 10; i++) {
      if (!_working) {
        break;
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _value += 0.1;
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('battery'),
                      Text(
                        "Percent: ${(_value * 100).round()}%",
                        style: const TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: _handleTap,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _active ? Colors.green : Colors.grey[600],
                          ),
                          child: Center(
                            child: Text(
                              _active ? 'Start' : 'Stop',
                              style: const TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
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
