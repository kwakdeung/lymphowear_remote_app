import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

class Collarbone extends StatefulWidget {
  const Collarbone({Key? key}) : super(key: key);

  @override
  State<Collarbone> createState() => _CollarboneState();
}

class _CollarboneState extends State<Collarbone> {
  double colloarboneValue = 2;

  showValue() {
    if (colloarboneValue == 0) {
      return Text(
        '  Off',
        style: intensityValueText,
      );
    } else {
      return Text(
        '  ${colloarboneValue.round()}',
        style: intensityValueText,
      );
    }
  }

  final collarboneImage = SvgPicture.asset(
    'assets/images/collarbone.svg',
    width: 40,
    height: 40,
    fit: BoxFit.fill,
  );

  Row collarboneTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Collarbone',
          style: modebodyText,
        ),
        const Spacer(),
        Text('Intensity', style: intensityText),
        showValue(),
      ],
    );
  }

  SliderTheme collarboneSlider() {
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
        value: colloarboneValue,
        divisions: 3,
        onChanged: (value) {
          setState(() {
            colloarboneValue = value;
          });
        },
      ),
    );
  }

  Row collarboneSliderValue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Off', style: intensityText),
        const Spacer(),
        Text('1', style: intensityText),
        const Spacer(),
        Text('2', style: intensityText),
        const Spacer(),
        Text('3', style: intensityText),
      ],
    );
  }

  final sliderIcon = SvgPicture.asset(
    'assets/icons/ic_max.svg',
    width: 16,
    height: 16,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      height: 54,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: collarboneImage,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 22, 0),
                  child: collarboneTitle(),
                ),
                Container(
                  margin: const EdgeInsets.all(0.0),
                  height: 18,
                  width: double.infinity,
                  child: collarboneSlider(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 22, 0),
                  child: collarboneSliderValue(),
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
