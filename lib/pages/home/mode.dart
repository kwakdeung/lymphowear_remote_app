import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/components/home/lympho_circularprogressindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

import '../../ble_singleton.dart';
import '../../components/home/lympho_part_slider.dart';

class AutoModeView extends StatefulWidget {
  final String backgroundImage, title, modeTitle, modeContent;
  final Color modeColor, iconColor;

  const AutoModeView({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.modeTitle,
    required this.modeColor,
    required this.iconColor,
    required this.modeContent,
  });

  @override
  State<AutoModeView> createState() => _AutoModeViewState();
}

class _AutoModeViewState extends State<AutoModeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AutoModeAppbar(
          title: widget.title,
          iconColor: widget.iconColor,
        ),
        extendBodyBehindAppBar: true,
        body: AutoModeBody(
          backgroundImage: widget.backgroundImage,
          modeTitle: widget.modeTitle,
          modeColor: widget.modeColor,
          iconColor: widget.iconColor,
          modeContent: widget.modeContent,
        ),
      ),
      onWillPop: () async {
        BleSingleton().writeToDevice('+CMF', -1);
        Navigator.pop(context);
        return true;
      },
    );
  }
}

class AutoModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color iconColor;

  const AutoModeAppbar({
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
        BleSingleton().writeToDevice('+CMF', -1);
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

class AutoModeBody extends StatefulWidget {
  final String backgroundImage, modeTitle, modeContent;
  final Color modeColor, iconColor;

  const AutoModeBody(
      {Key? key,
      required this.backgroundImage,
      required this.modeTitle,
      required this.modeColor,
      required this.iconColor,
      required this.modeContent})
      : super(key: key);

  @override
  State<AutoModeBody> createState() => _AutoModeBodyState();
}

class _AutoModeBodyState extends State<AutoModeBody> {
  final int countedSeconds = 10;
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

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
        onPlayStateChanged: (value) {
          setState(() {
            if (value) {
              if (widget.modeTitle == 'Vital Mode') {
                BleSingleton().writeToDevice('+CMS', 0);
              } else if (widget.modeTitle == 'Relaxing Mode') {
                BleSingleton().writeToDevice('+CMS', 1);
              } else if (widget.modeTitle == 'Sleeping Mode') {
                BleSingleton().writeToDevice('+CMS', 2);
              }
            } else {
              BleSingleton().writeToDevice('+CMF', -1);
            }

            visible = value;
          });
        },
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
        image: 'assets/images/heat_white.png',
        maxValue: 2,
        divisions: 2,
        icon: 'assets/icons/ic_heat_max.svg',
        activeTrackColor: widget.modeTitle == 'Vital Mode'
            ? const Color(0xffED711A)
            : widget.modeTitle == 'Relaxing Mode'
                ? const Color(0xff00AAC6)
                : const Color(0xffF6DA6B),
        inactiveTrackColor: const Color(0xffFFFFFF),
        thumbColor: widget.modeTitle == 'Vital Mode'
            ? const Color(0xffED711A)
            : widget.modeTitle == 'Relaxing Mode'
                ? const Color(0xff00AAC6)
                : const Color(0xffF6DA6B),
        iconColor: widget.modeTitle == 'Sleeping Mode'
            ? const Color(0xffEEEEEE)
            : const Color(0xff000000),
        sliderTextColor: widget.modeTitle == 'Sleeping Mode'
            ? const Color(0xffEEEEEE)
            : const Color(0xff9E9E9E),
        valueColor: widget.modeTitle == 'Vital Mode'
            ? const Color(0xffED711A)
            : widget.modeTitle == 'Relaxing Mode'
                ? const Color(0xff00AAC6)
                : const Color(0xffF6DA6B),
        onValueChanged: (value) {
          BleSingleton().writeToDevice('+MH', value);
        },
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
