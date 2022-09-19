import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';

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
  get image => Image.asset(
        widget.image,
      );

  get title => Text(
        widget.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      );

  get description => Text(
        widget.description,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: zeroMargin,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: image,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: title,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: description,
          ),
        ],
      ),
    );
  }
}
