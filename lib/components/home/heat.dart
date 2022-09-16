import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

class Heat extends StatefulWidget {
  const Heat({Key? key}) : super(key: key);

  @override
  State<Heat> createState() => _HeatState();
}

class _HeatState extends State<Heat> {
  double heatValue = 1;

  showValue() {
    if (heatValue == 0) {
      return Text(
        '  Off',
        style: intensityValueText,
      );
    } else {
      return Text(
        '  ${heatValue.round()}',
        style: intensityValueText,
      );
    }
  }

  final heatImage = SvgPicture.asset(
    'assets/images/heat.svg',
    width: 40,
    height: 40,
    fit: BoxFit.fill,
  );

  Row heatTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Heat',
          style: modebodyText,
        ),
        const Spacer(),
        Text('Intensity', style: intensityText),
        showValue(),
      ],
    );
  }

  SliderTheme heatSlider() {
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
        max: 2.0,
        value: heatValue,
        divisions: 2,
        onChanged: (value) {
          setState(() {
            heatValue = value;
          });
        },
      ),
    );
  }

  final sliderIcon = SvgPicture.asset(
    'assets/icons/ic_max.svg',
    width: 16,
    height: 16,
    fit: BoxFit.fill,
  );

  Row heatslidervalue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Off', style: intensityText),
        const Spacer(),
        Text('1', style: intensityText),
        const Spacer(),
        Text('2', style: intensityText),
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
            child: heatImage,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 22, 0),
                  child: heatTitle(),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  height: 18,
                  width: double.infinity,
                  child: heatSlider(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 23, 0),
                  child: heatslidervalue(),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 35, 24, 0),
            child: sliderIcon,
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
