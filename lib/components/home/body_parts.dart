import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

class BodyParts extends StatefulWidget {
  BodyParts(
      {Key? key,
      required this.image,
      required this.title,
      required this.bpValue})
      : super(key: key);

  final String image;
  final String title;
  double bpValue;
  @override
  State<BodyParts> createState() => _BodyPartsState();
}

class _BodyPartsState extends State<BodyParts> {
  double minValue = 0.0;

  showValue() {
    if (widget.bpValue == minValue) {
      return Text(
        '  Off',
        style: intensityValueText,
      );
    } else {
      return Text(
        '  ${widget.bpValue.round()}',
        style: intensityValueText,
      );
    }
  }

  bodypartsImage() => SvgPicture.asset(
        // 인수
        widget.image,
        width: 40,
        height: 40,
        fit: BoxFit.fill,
      );

  Row bodypartsTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title, // 인수
          style: modebodyText,
        ),
        const Spacer(),
        Text(
          'Intensity',
          style: intensityText,
        ),
        showValue(),
      ],
    );
  }

  SliderTheme bodypartsSlider() {
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
        value: widget.bpValue,
        divisions: 3,
        onChanged: (value) {
          setState(() {
            widget.bpValue = value;
          });
        },
      ),
    );
  }

  Row bodypartsSliderValue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Off',
          style: intensityText,
        ),
        const Spacer(),
        Text(
          '1',
          style: intensityText,
        ),
        const Spacer(),
        Text(
          '2',
          style: intensityText,
        ),
        const Spacer(),
        Text(
          '3',
          style: intensityText,
        ),
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
      margin: zeroMargin,
      height: 54,
      child: Row(
        children: [
          Container(
            margin: zeroMargin,
            child: bodypartsImage(),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: modeTitleMargin,
                  child: bodypartsTitle(),
                ),
                Container(
                  margin: zeroMargin,
                  height: 18,
                  width: double.infinity,
                  child: bodypartsSlider(),
                ),
                Container(
                  padding: sliderValuePadding,
                  child: bodypartsSliderValue(),
                ),
              ],
            ),
          ),
          Container(
            margin: sliderIconMargin,
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

    canvas.drawCircle(
      center,
      thumbRadius,
      fillPaint,
    );
    canvas.drawCircle(
      center,
      thumbRadius,
      borderPaint,
    );
  }
}