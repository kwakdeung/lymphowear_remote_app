import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import 'package:lymphowear_remote_app/components/home/circularindicator.dart';

class LymphoWearState extends StatefulWidget {
  const LymphoWearState({Key? key}) : super(key: key);

  @override
  State<LymphoWearState> createState() => _LymphoWearStateState();
}

class _LymphoWearStateState extends State<LymphoWearState> {
  late CircularIndicator circularindicator;

  static const lymphowearstatetitle = Text(
    'Custom Mode',
    style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
  );
  Timer? _timer;

  int _countedSeconds = 10;

  Duration timedDuration = const Duration(seconds: 10);
  bool _timerStart = false;
  bool timerRunning = false;
  bool circularVisible = false;

  bool isPlaying = false;

  get text {
    var min = (_countedSeconds ~/ 60).toString().padLeft(2, '0');
    var sec = _countedSeconds.remainder(60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  void startTimer() {
    _timerStart = true;
    timerRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print(text);
        print(_countedSeconds);
        if (_countedSeconds > 0) {
          _countedSeconds--;
        }
        timedDuration = Duration(seconds: _countedSeconds);
        timealertdialog();
      });
    });
    print(text);
    print(_countedSeconds);
    timealertdialog();
  }

  void stopTimer() {
    timerRunning = false;
    _timer!.cancel();
  }

  void timealertdialog() {
    if (text == "00:00") {
      _timer!.cancel();
      debugPrint("체크");
      _timeAlertDialog(context, "Total Time: 15mins");
    }
  }

  Container minusbutton() {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
      child: ElevatedButton(
        onPressed: () {
          if (_countedSeconds > 0 &&
              _timerStart == false &&
              timerRunning == false) {
            setState(() {
              _countedSeconds--;
            });
          }
        },
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: _countedSeconds > 0
                    ? const Color(0xff212121)
                    : const Color(0xffE0E0E0),
                width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_minus.svg',
          color: _countedSeconds > 0
              ? const Color(0xff212121)
              : const Color(0xffE0E0E0),
        ),
      ),
    );
  }

  Container plusbutton() {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
      child: ElevatedButton(
        onPressed: () {
          if (_countedSeconds < 10 &&
              _timerStart == false &&
              timerRunning == false) {
            setState(() {
              _countedSeconds++;
            });
          }
        },
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: _countedSeconds < 10
                    ? const Color(0xff212121)
                    : const Color(0xffE0E0E0),
                width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_plus.svg',
          color: _countedSeconds < 10
              ? const Color(0xff212121)
              : const Color(0xffE0E0E0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(53, 20, 53, 20),
          child: const FittedBox(
            child: lymphowearstatetitle,
          ),
        ),
        FittedBox(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                minusbutton(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(999.0)),
                    border: Border.all(
                      color: const Color(0xffE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    width: 144,
                    height: 144,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          child: Visibility(
                            visible: circularVisible,
                            child: CircularProgressIndicator(
                              backgroundColor:
                                  const Color(0xff0BB15D).withOpacity(0.16),
                              strokeWidth: 6,
                              value: 1.0 - _countedSeconds.remainder(60) / 10,
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
                                margin: const EdgeInsets.fromLTRB(0, 22, 0, 2),
                                child: SvgPicture.asset(
                                  'assets/images/battery.svg',
                                  width: 30,
                                  height: 12,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0),
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: const Color(0xff0BB15D),
                                      width: 1.5),
                                  color: isPlaying
                                      ? Colors.white
                                      : const Color(0xff0BB15D),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    if (timerRunning) {
                                      print("체크1");
                                      print(timerRunning);
                                      stopTimer();
                                      setState(() {
                                        isPlaying = false;
                                      });
                                    } else {
                                      print("체크");
                                      startTimer();
                                      setState(() {
                                        circularVisible = true;
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
                                          "assets/icons/ic_play_full.svg"),
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                plusbutton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future _timeAlertDialog(BuildContext context, String message) async {
  const timealertdialogtitle = Text(
    "Great job!",
    style: TextStyle(
        color: Color(0xff212121),
        fontSize: 20,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600),
  );

  final timealertdialogimage = Lottie.asset(
    'assets/images/great_job.json',
    width: 140,
    height: 72,
  );

  final timealertdialogcontent = Text(
    message,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Color(0xff9E9E9E),
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  );

  final timealertdialogbottombutton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      primary: const Color(0xff008A40),
      onPrimary: Colors.white,
      textStyle: const TextStyle(
          fontSize: 14, fontFamily: "Poppins", fontWeight: FontWeight.w600),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text('Done'),
  );

  var timealertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: const Center(child: timealertdialogtitle),
      content: Container(
        margin: const EdgeInsets.all(0.0),
        height: 100,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: timealertdialogimage,
            ),
            timealertdialogcontent,
          ],
        ),
      ),
      actions: [
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: timealertdialogbottombutton,
        ),
      ]);

  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(dialogBackgroundColor: Colors.white),
            child: timealertdialog);
      });
}
