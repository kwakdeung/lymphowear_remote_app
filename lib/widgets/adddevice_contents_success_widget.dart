import 'package:flutter/material.dart';

class AdviceContentsSucessWidget extends StatefulWidget {
  const AdviceContentsSucessWidget({Key? key}) : super(key: key);

  @override
  State<AdviceContentsSucessWidget> createState() =>
      _AdviceContentsSucessWidgetState();
}

class _AdviceContentsSucessWidgetState
    extends State<AdviceContentsSucessWidget> {
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    return const Scaffold();
  }
}
