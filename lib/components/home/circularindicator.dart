import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/constants.dart';

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
  bool circularVisible = false;

  String get time {
    // int seconds = (900.0 * controller.value).toInt();
    int seconds = (10.0 * controller.value).toInt();

    var initstate = controller.duration!;

    var initstatemin = (initstate.inSeconds ~/ 60).toString().padLeft(2, '0');

    var initstatesec = (initstate.inSeconds % 60).toString().padLeft(2, '0');

    var min = (seconds ~/ 60).toString().padLeft(2, '0');
    var sec = (seconds % 60).toString().padLeft(2, '0');

    return controller.isDismissed ? '$initstatemin:$initstatesec' : '$min:$sec';
  }

  set countText(String value) {}

  double progress = 1.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {});
      } else {
        setState(() {
          progress = 1;

          isPlaying = false;
        });
      }
      alertEnd();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void alertEnd() {
    if (controller.value == 0.0) {
      controller.stop();
      _timeAlertDialog(context, "Total Time: 15mins");
    }
  }

  Visibility circularprogressIndicator() {
    return Visibility(
      visible: circularVisible,
      child: CircularProgressIndicator(
        value: 1.0 - controller.value,
        backgroundColor: const Color(0xff0BB15D).withOpacity(0.16),
        strokeWidth: 6,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff0BB15D)),
      ),
    );
  }

  final batteryImage = Container(
    margin: const EdgeInsets.fromLTRB(0, 22, 0, 2),
    child: SvgPicture.asset(
      'assets/images/battery.svg',
      width: 30,
      height: 12,
    ),
  );

  Container showTime() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Text(
          time,
          style: const TextStyle(
            color: Color(0xff212121),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Padding playpauseButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        margin: zeroMargin,
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xff0BB15D), width: 1.5),
          color: isPlaying ? Colors.white : const Color(0xff0BB15D),
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
                    from: controller.value == 0 ? 1.0 : controller.value);

                setState(() {
                  circularVisible = true;
                  isPlaying = true;
                });
              }
            },
            color: isPlaying ? const Color(0xff0BB15D) : Colors.white,
            icon: isPlaying
                ? SvgPicture.asset("assets/icons/ic_pause_full.svg")
                : SvgPicture.asset("assets/icons/ic_play_full.svg")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: zeroMargin,
            width: 144,
            height: 144,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  child: circularprogressIndicator(),
                ),
                Positioned(
                  child: Center(
                    child: Column(
                      children: [
                        batteryImage,
                        showTime(),
                        playpauseButton(),
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
    // 로티 이미지 width, height 조절해서 다시 주신다하심
  );

  final timeAlertdialogContent = Text(
    message,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontFamily: "Poppins",
        color: Color(0xff9E9E9E),
        fontSize: 14,
        fontWeight: FontWeight.w400),
  );

  final timeAlertdialogBottomButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: dialogButtonPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      backgroundColor: const Color(0xff008A40),
      textStyle: dialogButtonText,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text('Done'),
  );

  var timeAlertdialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Center(child: timeAlertdialogTitle(context)),
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
      ]);

  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(dialogBackgroundColor: Colors.white),
            child: timeAlertdialog);
      });
}
