import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../ble_singleton.dart';
import '../../constants.dart';

class LymphoWearCustomView extends StatefulWidget {
  const LymphoWearCustomView({Key? key}) : super(key: key);

  @override
  State<LymphoWearCustomView> createState() => _LymphoWearCustomViewState();
}

class _LymphoWearCustomViewState extends State<LymphoWearCustomView>
    with TickerProviderStateMixin {
  Text stateTitle(context) {
    return Text(
      'Custom Mode',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Timer? timer;

  final int minSeconds = 0;
  final int maxSeconds = 900;

  int defaultSeconds = 900;
  int currentSeconds = 900;

  bool timerRunning = false;
  bool circularVisible = false;

  bool isPlaying = false;
  late AnimationController controller;

  var value = 0;

  @override
  void initState() {
    super.initState();

    BleSingleton().onRead = (data) {
      // print(data);
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  get time {
    var min = (currentSeconds ~/ 60).toString().padLeft(2, '0');
    var sec = (currentSeconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (currentSeconds > minSeconds) {
          currentSeconds--;
          BleSingleton().writeToDevice2('+A', -1);
        } else {
          pause();
        }
      });
    });
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

  void minusControl() {
    if (isPlaying || currentSeconds == minSeconds) return;

    setState(() {
      currentSeconds -= 10;
      defaultSeconds = currentSeconds;
    });
  }

  void plusControl() {
    if (isPlaying || currentSeconds == maxSeconds) return;

    setState(() {
      currentSeconds += 1;
      defaultSeconds = currentSeconds;
    });
  }

  void play() {
    var ble = BleSingleton();

    ble.writeToDevice2('+CPLAY', currentSeconds);
    setState(() {
      isPlaying = true;
    });

    ble.isRunning = true;
    ble.sync();

    startTimer();
  }

  void pause() {
    BleSingleton().writeToDevice('+CPAUSE', -1);
    setState(() {
      isPlaying = false;
    });
    BleSingleton().isRunning = false;

    timer?.cancel();
  }

  Container minusButton() {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
      child: ElevatedButton(
        onPressed: () {
          minusControl();
        },
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: (currentSeconds != minSeconds) && !isPlaying
                    ? const Color(0xff212121)
                    : const Color(0xffE0E0E0),
                width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_minus.svg',
          fit: BoxFit.fill,
          color: (currentSeconds != minSeconds) && !isPlaying
              ? const Color(0xff212121)
              : const Color(0xffE0E0E0),
        ),
      ),
    );
  }

  Container plusButton() {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
      child: ElevatedButton(
        onPressed: () {
          plusControl();
        },
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                color: (currentSeconds != maxSeconds) && !isPlaying
                    ? const Color(0xff212121)
                    : const Color(0xffE0E0E0),
                width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_plus.svg',
          fit: BoxFit.fill,
          color: (currentSeconds != maxSeconds) && !isPlaying
              ? const Color(0xff212121)
              : const Color(0xffE0E0E0),
        ),
      ),
    );
  }

  Container circleTimer() {
    Visibility circularProgressIndicator() {
      return Visibility(
        visible: isPlaying,
        child: CircularProgressIndicator(
          backgroundColor: const Color(0xffED711A).withOpacity(0.16),
          strokeWidth: 6,
          value: 1.0 - (100 / defaultSeconds * currentSeconds * 0.01),
          valueColor: const AlwaysStoppedAnimation<Color>(
            Color(0xffED711A),
          ),
        ),
      );
    }

    final batteryImage = Container(
      margin: const EdgeInsets.fromLTRB(0, 22, 0, 2),
      child: SvgPicture.asset(
        'assets/images/battery.svg',
        fit: BoxFit.fill,
        width: 30,
        height: 12,
      ),
    );

    final showTime = Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        time,
        style: const TextStyle(
          color: Color(0xff212121),
          fontSize: 24,
          fontWeight: regular,
        ),
      ),
    );

    final playPauseButton = Container(
      margin: zeroMargin,
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color(0xffED711A),
          width: 1.5,
        ),
        color: isPlaying ? Colors.white : const Color(0xffED711A),
      ),
      child: IconButton(
        onPressed: () {
          if (isPlaying) {
            pause();
          } else {
            play();
          }
        },
        color: isPlaying ? const Color(0xffED711A) : Colors.white,
        icon: isPlaying
            ? SvgPicture.asset(
                "assets/icons/ic_pause_full.svg",
                fit: BoxFit.fill,
              )
            : SvgPicture.asset(
                "assets/icons/ic_play_full.svg",
                fit: BoxFit.fill,
              ),
      ),
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(999.0),
        ),
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
              child: circularProgressIndicator(),
            ),
            Positioned(
              child: Center(
                child: Column(
                  children: [
                    batteryImage,
                    showTime,
                    playPauseButton,
                  ],
                ),
              ),
            )
          ],
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
          child: FittedBox(
            child: stateTitle(context),
          ),
        ),
        FittedBox(
          child: Container(
            margin: zeroMargin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                minusButton(),
                circleTimer(),
                plusButton(),
              ],
            ),
          ),
        ),
      ],
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
      height: 100,
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
