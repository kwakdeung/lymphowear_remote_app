import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Shoulder extends StatefulWidget {
  const Shoulder({Key? key}) : super(key: key);

  @override
  State<Shoulder> createState() => _ShoulderState();
}

class _ShoulderState extends State<Shoulder> {
  double shoulderValue = 2;

  shouldervalue() {
    if (shoulderValue == 0) {
      return const Text(
        '  Off',
        style: TextStyle(
            fontSize: 10, color: Colors.green, fontWeight: FontWeight.w600),
      );
    } else {
      return Text(
        '  ${shoulderValue.round()}',
        style: const TextStyle(
            fontSize: 10, color: Colors.green, fontWeight: FontWeight.w600),
      );
    }
  }

  final shoulderImage = SvgPicture.asset(
    'assets/images/shoulder.svg',
    width: 40,
    height: 40,
    fit: BoxFit.fill,
  );

  Row shouderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Shoulder',
          style: TextStyle(
              color: Color(0xff212121),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        const Text('Intensity',
            style: TextStyle(color: Color(0xff9E9E9E), fontSize: 10)),
        shouldervalue(),
      ],
    );
  }

  SliderTheme shoulderSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: const Color(0xff0BB15D),
        inactiveTrackColor: const Color(0xffEEEEEE),
        thumbShape: const CircleThumbShape(thumbRadius: 6),
        thumbColor: const Color(0xff0BB15D),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: const Color(0xff212121).withOpacity(0.12),
        inactiveTickMarkColor: const Color(0xff212121).withOpacity(0.12),
      ),
      child: Slider(
        min: 0.0,
        max: 3.0,
        value: shoulderValue,
        divisions: 3,
        onChanged: (value) {
          setState(() {
            shoulderValue = value;
          });
        },
      ),
    );
  }

  Row shoulderSliderValue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Off', style: TextStyle(color: Color(0xff9E9E9E), fontSize: 10)),
        Spacer(),
        Text('1', style: TextStyle(color: Color(0xff9E9E9E), fontSize: 10)),
        Spacer(),
        Text('2', style: TextStyle(color: Color(0xff9E9E9E), fontSize: 10)),
        Spacer(),
        Text('3', style: TextStyle(color: Color(0xff9E9E9E), fontSize: 10)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      height: 54,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: shoulderImage,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 22, 0),
                  child: shouderTitle(),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  height: 18,
                  width: double.infinity,
                  child: shoulderSlider(),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 22, 0),
                    child: shoulderSliderValue()),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 35, 24, 0),
            child: SvgPicture.asset(
              'assets/icons/ic_max.svg',
              width: 16,
              height: 16,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CircleThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
