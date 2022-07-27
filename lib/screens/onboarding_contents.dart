import 'package:flutter/material.dart';

class OnboardingContents extends StatelessWidget {
  const OnboardingContents({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    EdgeInsets contentsPadding = MediaQuery.of(context).viewPadding;
    return Padding(
      padding: contentsPadding,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 200,
          ),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 250,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
