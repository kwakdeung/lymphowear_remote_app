import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lymphowear_remote_app/components/home/circularindicator.dart';

class LymphoWearState extends StatefulWidget {
  const LymphoWearState({Key? key}) : super(key: key);

  @override
  State<LymphoWearState> createState() => _LymphoWearStateState();
}

class _LymphoWearStateState extends State<LymphoWearState> {
  static const lymphowearstatetitle = Text(
    'Manual Mode',
    style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
  );

  Container minusbutton() {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.fromLTRB(0, 96, 0, 16),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("-1분");
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xff212121), width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_minus.svg',
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
          debugPrint("+1분");
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xff212121), width: 2),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            surfaceTintColor: Colors.white),
        child: SvgPicture.asset(
          'assets/icons/ic_plus.svg',
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
              children: [
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
                  child: const CircularIndicator(),
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

// class CircularIndicator extends StatefulWidget {
//   const CircularIndicator({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _CircularIndicatorState();
//   }
// }

// class _CircularIndicatorState extends State<CircularIndicator>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   bool isPlaying = false;
//   bool circularvisible = false;

//   String get countText {
//     // int seconds = (900.0 * controller.value).toInt();
//     int seconds = (10.0 * controller.value).toInt();

//     var min = (seconds ~/ 60).toString().padLeft(2, '0');
//     var sec = (seconds % 60).toString().padLeft(2, '0');
//     return "$min:$sec";

//     // Duration count = controller.duration! * controller.value;

//     // return controller.isDismissed
//     //     ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
//     //     : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   double progress = 1.0;

//   void notify() {
//     // if (countText == "00:00") {}
//     // if (countText == "00:05") {
//     //   _timeAlertDialog(context, "Total Time: 15mins");
//     // } // 여기 로깅
//   }

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );
//     controller.addListener(() {
//       if (controller.isAnimating) {
//         setState(() {
//           // progress = controller.value;
//         });
//       } else {
//         setState(() {
//           progress = 0;
//           isPlaying = false;
//         });
//       }
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Visibility circularprogressindicator() {
//     return Visibility(
//       visible: circularvisible,
//       child: CircularProgressIndicator(
//         value: 1.0 - controller.value,
//         backgroundColor: const Color(0xff0BB15D).withOpacity(0.16),
//         strokeWidth: 6,
//         valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff0BB15D)),
//       ),
//     );
//   }

//   final batteryimage = SvgPicture.asset(
//     'assets/images/battery.svg',
//     width: 20,
//     height: 10,
//   );

//   GestureDetector timer() {
//     return GestureDetector(
//       onTap: () {
//         if (controller.isDismissed) {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => Container(
//               margin: const EdgeInsets.all(0.0),
//               height: 150,
//               child: CupertinoTimerPicker(
//                 initialTimerDuration: controller.duration!,
//                 onTimerDurationChanged: (time) {
//                   setState(() {
//                     controller.duration = time;
//                   });
//                 },
//               ),
//             ),
//           );
//         }
//       },
//       child: AnimatedBuilder(
//         animation: controller,
//         builder: (context, child) => Text(
//           countText,
//           style: const TextStyle(
//               fontSize: 24, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
//         ),
//       ),
//     );
//   }

//   Container playpausebutton() {
//     return Container(
//       margin: const EdgeInsets.only(top: 0),
//       width: 40.0,
//       height: 40.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         border: Border.all(color: const Color(0xff0BB15D), width: 1.5),
//         color: isPlaying ? Colors.white : const Color(0xff0BB15D),
//       ),
//       child: IconButton(
//           onPressed: () {
//             if (controller.isAnimating) {
//               controller.stop();
//               setState(() {
//                 isPlaying = false;
//               });
//             } else {
//               controller.reverse(
//                   from: controller.value == 0 ? 1.0 : controller.value);
//               if (countText == "00:10") {
//                 _timeAlertDialog(context, "Total Time: 15mins");
//               }
//               setState(() {
//                 circularvisible = true;
//                 isPlaying = true;
//               });
//             }
//           },
//           color: isPlaying ? const Color(0xff0BB15D) : Colors.white,
//           icon: isPlaying
//               ? SvgPicture.asset("assets/icons/ic_pause_full.svg")
//               : SvgPicture.asset("assets/icons/ic_play_full.svg")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(0.0),
//             width: 144,
//             height: 144,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Positioned(
//                   child: circularprogressindicator(),
//                 ),
//                 Positioned(
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(0, 22, 0, 7),
//                           child: batteryimage,
//                         ),
//                         timer(),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 5, vertical: 10),
//                           child: playpausebutton(),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future _timeAlertDialog(BuildContext context, String message) async {
//   const timealertdialogtitle = Text(
//     "Great job!",
//     style: TextStyle(
//         color: Color(0xff212121),
//         fontSize: 20,
//         fontFamily: "Poppins",
//         fontWeight: FontWeight.w600),
//   );

//   final timealertdialogimage = Lottie.asset(
//     'assets/images/great_job.json',
//     width: 140,
//     height: 72,
//     // width, height 조절해서 다시 주신다하심
//   );

//   final timealertdialogcontent = Text(
//     message,
//     textAlign: TextAlign.center,
//     style: const TextStyle(
//         color: Color(0xff9E9E9E),
//         fontSize: 14,
//         fontFamily: "Poppins",
//         fontWeight: FontWeight.w400),
//   );

//   final timealertdialogbottombutton = ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(999),
//       ),
//       primary: const Color(0xff008A40),
//       onPrimary: Colors.white,
//       textStyle: const TextStyle(
//           fontSize: 14, fontFamily: "Poppins", fontWeight: FontWeight.w600),
//     ),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//     child: const Text('Done'),
//   );

//   var timealertdialog = AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//       title: const Center(child: timealertdialogtitle),
//       content: Container(
//         margin: const EdgeInsets.all(0.0),
//         height: 100,
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(bottom: 7),
//               child: timealertdialogimage,
//             ),
//             timealertdialogcontent,
//           ],
//         ),
//       ),
//       actions: [
//         Container(
//           width: double.maxFinite,
//           margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//           child: timealertdialogbottombutton,
//         ),
//       ]);

//   await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Theme(
//             data: ThemeData(dialogBackgroundColor: Colors.white),
//             child: timealertdialog);
//       });
// }
