import 'package:flutter/material.dart';

class OnboardingContents extends StatefulWidget {
  const OnboardingContents({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  State<OnboardingContents> createState() => _OnboardingContentsState();
}

class _OnboardingContentsState extends State<OnboardingContents> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(0.0),
      width: double.infinity,
      height: pageSize.height,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              widget.image,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: pageSize.width * 0.6,
              height: double.infinity,
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
