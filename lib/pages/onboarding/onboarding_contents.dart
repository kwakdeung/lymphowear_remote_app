import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';

class OnboardingContents extends StatefulWidget {
  final String image, description;
  final double marginTop;

  const OnboardingContents({
    Key? key,
    required this.image,
    required this.marginTop,
    required this.description,
  }) : super(key: key);

  @override
  State<OnboardingContents> createState() => _OnboardingContentsState();
}

class _OnboardingContentsState extends State<OnboardingContents> {
  get image => Image.asset(
        widget.image,
        width: double.infinity,
        fit: BoxFit.fill,
      );

  get description => Text(
        widget.description,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff005784),
            fontSize: 18),
        // style: Theme.of(context).textTheme.bodyText2,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: zeroMargin,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            child: image,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, widget.marginTop, 20, 10),
            child: description,
          ),
        ],
      ),
    );
  }
}
