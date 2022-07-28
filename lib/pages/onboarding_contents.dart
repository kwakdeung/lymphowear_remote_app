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
    EdgeInsets contentsPadding = MediaQuery.of(context).viewPadding;
    var pageSize = MediaQuery.of(context).size;
    return Padding(
      padding: contentsPadding,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              widget.image,
              height: pageSize.height * 0.1,
            ),
          ),
          Expanded(
            flex: 1,
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
            flex: 1,
            child: SizedBox(
              width: pageSize.width * 0.5,
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
