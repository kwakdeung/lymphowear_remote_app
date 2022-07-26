import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/constants.dart';

import '../../ble_singleton.dart';

class LymphoCircularProgressIndicatorWidget extends StatefulWidget {
  final Color modeColor, iconColor;
  final bool visible;
  final Function(bool) onPlayStateChanged;

  const LymphoCircularProgressIndicatorWidget({
    super.key,
    required this.modeColor,
    required this.iconColor,
    required this.visible,
    required this.onPlayStateChanged,
  });

  @override
  State<LymphoCircularProgressIndicatorWidget> createState() =>
      _LymphoCircularProgressIndicatorWidgetState();
}

class _LymphoCircularProgressIndicatorWidgetState
    extends State<LymphoCircularProgressIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  Timer? timer;

  int currentSeconds = 900;
  int minSeconds = 0;

  bool timerStart = false;

  bool _isPlaying = false;
  Function(bool)? onPlayStateChanged;

  get isPlaying {
    return _isPlaying;
  }

  set isPlaying(value) {
    _isPlaying = value;
    widget.onPlayStateChanged.call(value);
  }

  get time {
    var min = (currentSeconds ~/ 60).toString().padLeft(2, '0');
    var sec = (currentSeconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: currentSeconds),
    );

    controller.forward();

    BleSingleton().onRead = (data) {
      print(data);
    };

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (currentSeconds > minSeconds) {
          currentSeconds--;
          BleSingleton().writeToDevice2('+A', -1);
        } else {
          alertEnd();
        }
      });
    });
    alertEnd();
  }

  void stopTimer() {
    timer?.cancel();
  }

  void playOrPause() {
    if (isPlaying) {
      stopTimer();
      setState(() {
        isPlaying = false;
        currentSeconds = 900;
      });
    } else {
      startTimer();
      setState(() {
        isPlaying = true;
      });
    }
  }

  void alertEnd() {
    if (time == "00:00") {
      timer!.cancel();
      timeAlertDialog(
        context,
        "Total Time: 15mins",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: zeroMargin,
        width: 150.0,
        height: 150.0,
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 144,
          height: 144,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Visibility(
                  visible: isPlaying,
                  child: CircularProgressIndicator(
                    backgroundColor: widget.modeColor.withOpacity(0.16),
                    strokeWidth: 6,
                    value: controller.value,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.modeColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 22, 0, 2),
                        child: SvgPicture.asset(
                          'assets/images/battery.svg',
                          fit: BoxFit.fill,
                          color: widget.iconColor,
                          width: 30,
                          height: 12,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: widget.iconColor,
                            fontSize: 24,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      Container(
                        margin: zeroMargin,
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: widget.modeColor,
                            width: 1.5,
                          ),
                          color:
                              isPlaying ? Colors.transparent : widget.modeColor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            playOrPause();
                          },
                          color: isPlaying ? widget.modeColor : Colors.white,
                          icon: isPlaying
                              ? SvgPicture.asset(
                                  "assets/icons/ic_pause_full.svg",
                                  fit: BoxFit.fill,
                                  color: widget.modeColor,
                                )
                              : SvgPicture.asset(
                                  "assets/icons/ic_play_full.svg",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future timeAlertDialog(BuildContext context, String message) async {
  Text timeAlertdialogTitle(context) {
    return Text(
      "Great job!",
      style: Theme.of(context).textTheme.headline5,
    );
  }

  final timeAlertdialogImage = Lottie.asset(
    'assets/images/great_job.json',
    width: 140,
    height: 72,
  );

  final timeAlertdialogContent = Text(
    message,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xff9E9E9E),
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: regular,
    ),
  );

  final timeAlertdialogBottomButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: dialogButtonPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      backgroundColor: const Color(0xffED711A),
      foregroundColor: Colors.white,
      textStyle: dialogButtonText,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text('Done'),
  );

  var timeAlertdialog = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    title: Center(
      child: timeAlertdialogTitle(context),
    ),
    content: Container(
      margin: zeroMargin,
      height: 110,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: timeAlertdialogImage,
          ),
          timeAlertdialogContent,
        ],
      ),
    ),
    actions: [
      Container(
        width: double.maxFinite,
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: timeAlertdialogBottomButton,
      ),
    ],
  );

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(
          dialogBackgroundColor: Colors.white,
        ),
        child: timeAlertdialog,
      );
    },
  );
}
