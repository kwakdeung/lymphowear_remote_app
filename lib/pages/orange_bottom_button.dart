import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';

class OrangeBottomButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;

  const OrangeBottomButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  // 생성자 타입 선언 문제(Navigator 위젯) - Widget, Navigator, MaterialPageRoute 선언해봄

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: const Color(0xffED711A),
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
