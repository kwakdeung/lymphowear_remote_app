import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

class LymphoPartSliderWidget extends StatefulWidget {
  final String title;
  final String image;
  final double maxValue;
  final int divisions;
  final String icon;
  final ValueChanged<int> onValueChanged;

  const LymphoPartSliderWidget(
      {Key? key,
      required this.title,
      required this.onValueChanged,
      required this.image,
      required this.maxValue,
      required this.icon,
      required this.divisions})
      : super(key: key);

  @override
  State<LymphoPartSliderWidget> createState() => _LymphoPartSliderWidgetState();
}

class _LymphoPartSliderWidgetState extends State<LymphoPartSliderWidget> {
  double currentValue = 1.0;

  showValue() {
    return Text(
      currentValue == 0.0 ? 'Off' : '${currentValue.round()}',
      textAlign: TextAlign.right,
      style: intensityValueText,
    );
  }

  Row sliderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.title,
          style: modebodyText,
        ),
        const Spacer(),
        Text(
          'Intensity',
          style: intensityText,
        ),
        const SizedBox(
          width: 2,
        ),
        SizedBox(
          width: 17,
          child: showValue(),
        ),
      ],
    );
  }

  SliderTheme slider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: const Color(0xffED711A),
        inactiveTrackColor: const Color(0xffEEEEEE),
        thumbShape: const CircleThumbShape(thumbRadius: 6),
        thumbColor: const Color(0xffED711A),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: const Color(0xff212121).withOpacity(0.12),
        inactiveTickMarkColor: const Color(0xff212121).withOpacity(0.12),
      ),
      child: Slider(
        min: 0.0,
        max: widget.maxValue,
        value: currentValue,
        divisions: widget.divisions,
        onChanged: (value) {
          setState(() {
            currentValue = value;
            widget.onValueChanged.call(currentValue.round());
          });
        },
      ),
    );
  }

  Row sliderText() {
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
        if (widget.divisions == 3) const Spacer(),
        if (widget.divisions == 3)
          Text(
            '3',
            style: intensityText,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: zeroMargin,
          child: Image.asset(
            widget.image,
            fit: BoxFit.fill,
            width: 40,
            height: 40,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: modeTitleMargin,
                child: sliderTitle(),
              ),
              Container(
                margin: zeroMargin,
                height: 18,
                width: double.infinity,
                child: slider(),
              ),
              Container(
                padding: sliderValuePadding,
                child: sliderText(),
              ),
            ],
          ),
        ),
        Container(
          margin: sliderIconMargin,
          child: SvgPicture.asset(
            widget.icon,
            width: 16,
            height: 16,
            fit: BoxFit.fill,
          ),
        ),
      ],
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
