import 'package:flutter/material.dart';

class NoticeContentsWidget extends StatelessWidget {
  const NoticeContentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/Paring01.png',
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
