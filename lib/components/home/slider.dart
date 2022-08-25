import 'package:flutter/material.dart';

class MaterialSlider extends StatefulWidget {
  const MaterialSlider({Key? key}) : super(key: key);

  @override
  State<MaterialSlider> createState() => _MaterialSliderState();
}

class _MaterialSliderState extends State<MaterialSlider> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: Colors.green[300],
        inactiveTrackColor: const Color(0xffEEEEEE),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 8.0,
          pressedElevation: 8.0,
        ),
        thumbColor: Colors.green[300], // 여기를 안에 흰색 넣기
        overlayColor: Colors.green.withOpacity(0.2),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        activeTickMarkColor: Color(0xff212121).withOpacity(0.16),
        inactiveTickMarkColor: Colors.grey,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.white,
        valueIndicatorTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Slider(
            min: 0.0,
            max: 3.0,
            value: _currentSliderValue,
            divisions: 3,
            label: '${_currentSliderValue.round()}',
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value;
              });
            }),
      ),
    );
  }
}
