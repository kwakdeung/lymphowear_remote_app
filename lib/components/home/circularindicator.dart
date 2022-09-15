import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

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
    // int seconds = (900.0 * controller.value).toInt();
    int seconds = (10.0 * controller.value).toInt();

    print(seconds--);
    print(seconds++);

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
        debugPrint(countText);

        setState(() {});
      } else {
        setState(() {
          progress = 1;

          isPlaying = false;
        });
      }
      timealertdialog();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void timealertdialog() {
    if (controller.value == 0.0) {
      controller.stop();
      debugPrint("체크");
      _timeAlertDialog(context, "Total Time: 15mins");
    }
  }

  Visibility circularprogressindicator() {
    return Visibility(
      visible: circularvisible,
      child: CircularProgressIndicator(
        value: 1.0 - controller.value,
        backgroundColor: const Color(0xff0BB15D).withOpacity(0.16),
        strokeWidth: 6,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff0BB15D)),
      ),
    );
  }

  final batteryimage = SvgPicture.asset(
    'assets/images/battery.svg',
    width: 30,
    height: 12,
  );

  Container timer() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Text(
          countText,
          style: const TextStyle(
            color: Color(0xff212121),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Container playpausebutton() {
    return Container(
      margin: const EdgeInsets.only(top: 0),
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
                circularvisible = true;
                isPlaying = true;
              });
            }
          },
          color: isPlaying ? const Color(0xff0BB15D) : Colors.white,
          icon: isPlaying
              ? SvgPicture.asset("assets/icons/ic_pause_full.svg")
              : SvgPicture.asset("assets/icons/ic_play_full.svg")),
    );
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
                  child: circularprogressindicator(),
                ),
                Positioned(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 22, 0, 7),
                          child: batteryimage,
                        ),
                        timer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: playpausebutton(),
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

Future _timeAlertDialog(BuildContext context, String message) async {
  const timealertdialogtitle = Text(
    "Great job!",
    style: TextStyle(
        color: Color(0xff212121), fontSize: 20, fontWeight: FontWeight.w600),
  );

  final timealertdialogimage = Lottie.asset(
    'assets/images/great_job.json',
    width: 140,
    height: 72,
    // 로티 이미지 width, height 조절해서 다시 주신다하심
  );

  final timealertdialogcontent = Text(
    message,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Color(0xff9E9E9E), fontSize: 14, fontWeight: FontWeight.w400),
  );

  final timealertdialogbottombutton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      primary: const Color(0xff008A40),
      onPrimary: Colors.white,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
