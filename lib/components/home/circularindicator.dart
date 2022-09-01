import 'package:flutter/cupertino.dart';
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

  bool isPlaying = false;
  bool circularvisible = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '00:00') {}
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 900),
    );
    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                Positioned(
                  child: Visibility(
                    visible: circularvisible,
                    child: CircularProgressIndicator(
                      value: controller.value,
                      backgroundColor:
                          const Color(0xff0BB15D).withOpacity(0.16),
                      strokeWidth: 6,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff0BB15D)),
                    ),
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 0, 7),
                          child: SvgPicture.asset(
                            'assets/images/Battery.svg',
                            width: 20,
                            height: 10,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.isDismissed) {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  margin: const EdgeInsets.all(0.0),
                                  height: 150,
                                  child: CupertinoTimerPicker(
                                    initialTimerDuration: controller.duration!,
                                    onTimerDurationChanged: (time) {
                                      setState(() {
                                        controller.duration = time;
                                      });
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) => Text(
                              countText,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Container(
                            margin: const EdgeInsets.only(top: 0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: const Color(0xff0BB15D), width: 1.5),
                              color: isPlaying
                                  ? Colors.white
                                  : const Color(0xff0BB15D),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  if (controller.isAnimating) {
                                    controller.stop();
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  } else {
                                    controller.reverse(
                                        from: controller.value == 0
                                            ? 1.0
                                            : controller.value);
                                    setState(() {
                                      circularvisible = true;
                                      isPlaying = true;
                                    });
                                  }
                                },
                                color: isPlaying
                                    ? const Color(0xff0BB15D)
                                    : Colors.white,
                                icon: isPlaying
                                    ? SvgPicture.asset(
                                        "assets/icons/ic_pause_full.svg")
                                    : SvgPicture.asset(
                                        "assets/icons/ic_play_full.svg")),
                          ),
                        )
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

Future _timeAlertDialog(BuildContext context, String message) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              title: const Text(
                "Great job!",
                style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              content: Container(
                height: 196,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/time_complete.svg",
                      fit: BoxFit.fill,
                    ),
                    Text(message),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Text("Done"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]),
        );
      });
}


// class CircularIn {
//   final dynamic value, backgroundColor, valueColor;

//   CircularIn({
//     required this.value,
//     required this.backgroundColor,
//     required this.valueColor,
//   });
// }

// final List<CircularIn> circularinData = [
//   CircularIn(
//     value: _value,
//     backgroundColor: Colors.green[100],
//     valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
//   ),
// ];
