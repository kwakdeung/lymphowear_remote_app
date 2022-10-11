import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';

class WhiteBottomButton extends StatelessWidget {
  const WhiteBottomButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);
  final Function() onPressed;

  // 생성자 타입 선언 문제(Navigator 위젯) - Widget, Navigator, MaterialPageRoute 선언해봄
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff008A40),
        textStyle: Theme.of(context).textTheme.button,
        side: const BorderSide(color: Color(0xff008A40)),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
