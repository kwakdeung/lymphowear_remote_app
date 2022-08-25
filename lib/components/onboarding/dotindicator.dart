import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.black.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(10))));
  }
}
