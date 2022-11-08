import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/components/home/lympho_circularprogressindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

import '../../components/home/lympho_part_slider.dart';

class Mode extends StatefulWidget {
  final String backgroundImage, title, modeTitle, modeContent;
  final Color modeColor, iconColor;

  const Mode({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.modeTitle,
    required this.modeColor,
    required this.iconColor,
    required this.modeContent,
  });

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModeAppbar(
        title: widget.title,
        iconColor: widget.iconColor,
      ),
      extendBodyBehindAppBar: true,
      body: ModeBody(
        backgroundImage: widget.backgroundImage,
        modeTitle: widget.modeTitle,
        modeColor: widget.modeColor,
        iconColor: widget.iconColor,
        modeContent: widget.modeContent,
      ),
    );
  }
}

class ModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color iconColor;

  const ModeAppbar({
    Key? key,
    required this.title,
    required this.iconColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIcon(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: iconColor,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: appbarleadingMargin,
        child: appbarIcon(context),
      ),
      title: appbarTitle(context),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Colors.transparent,
          height: 2.0,
        ),
      ),
    );
  }
}

class ModeBody extends StatefulWidget {
  final String backgroundImage, modeTitle, modeContent;
  final Color modeColor, iconColor;

  const ModeBody(
      {Key? key,
      required this.backgroundImage,
      required this.modeTitle,
      required this.modeColor,
      required this.iconColor,
      required this.modeContent})
      : super(key: key);

  @override
  State<ModeBody> createState() => _ModeBodyState();
}

class _ModeBodyState extends State<ModeBody> {
  final int countedSeconds = 10;
  bool visible = false;

  Container modeIndicator() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 88, 0, 0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(999.0),
        ),
      ),
      child: LymphoCircularProgressIndicatorWidget(
        modeColor: widget.modeColor,
        iconColor: widget.iconColor,
        visible: visible,
      ),
    );
  }

  Row modeHeadline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            widget.modeTitle,
            style: TextStyle(
              color: widget.modeColor,
              fontWeight: semiBold,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }

  Text modeContents() {
    return Text(
      widget.modeContent,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: widget.modeColor,
        fontWeight: regular,
        fontSize: 16,
      ),
    );
  }

  Widget heatSlider() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffFFFFFF).withOpacity(0.5),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: LymphoPartSliderWidget(
        title: 'Heat',
        image: 'assets/images/heat.png',
        maxValue: 2,
        divisions: 2,
        icon: 'assets/icons/ic_heat_max.svg',
        onValueChanged: (value) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          widget.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 16, 29, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: zeroMargin,
                        color: Colors.transparent,
                        child: modeHeadline(),
                      ),
                      if (visible == false) modeContents() else heatSlider(),
                    ],
                  ),
                ),
                modeIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
