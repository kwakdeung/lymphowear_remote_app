import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lymphowear_remote_app/components/home/lympho_circularprogressindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

class Mode extends StatefulWidget {
  const Mode({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.modeTitle,
    required this.modeColor,
    required this.iconColor,
    required this.modeContent,
  });

  final String backgroundImage, title, modeTitle, modeContent;
  final Color modeColor, iconColor;

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
        modeContent: widget.modeContent,
      ),
    );
  }
}

class ModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ModeAppbar({
    Key? key,
    required this.title,
    required this.iconColor,
  }) : super(key: key);

  final String title;
  final Color iconColor;
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
  const ModeBody(
      {Key? key,
      required this.backgroundImage,
      required this.modeTitle,
      required this.modeColor,
      required this.modeContent})
      : super(key: key);
  final String backgroundImage, modeTitle, modeContent;
  final Color modeColor;

  @override
  State<ModeBody> createState() => _ModeBodyState();
}

class _ModeBodyState extends State<ModeBody> {
  final int countedSeconds = 10;
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
      child: const LymphoCircularProgressIndicatorWidget(),
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
                color: widget.modeColor, fontWeight: semiBold, fontSize: 24),
            // style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(widget.backgroundImage, fit: BoxFit.cover),
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
                      Text(
                        widget.modeContent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.modeColor,
                          fontWeight: regular,
                          fontSize: 16,
                        ),
                        // style: Theme.of(context).textTheme.caption,
                      ),
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
