import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

class Mode extends StatefulWidget {
  const Mode(
      {super.key,
      required this.title,
      required this.modeTitle,
      required this.modeIcon,
      required this.modeContent});

  final String title, modeIcon, modeTitle, modeContent;

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModeAppbar(
        title: widget.title,
      ),
      body: ModeBody(
        modeTitle: widget.modeTitle,
        modeIcon: widget.modeIcon,
        modeContent: widget.modeContent,
      ),
    );
  }
}

class ModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ModeAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIcon(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: const Color(0xff616161),
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
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
    );
  }
}

class ModeBody extends StatefulWidget {
  const ModeBody(
      {Key? key,
      required this.modeTitle,
      required this.modeIcon,
      required this.modeContent})
      : super(key: key);
  final String modeIcon, modeTitle, modeContent;

  @override
  State<ModeBody> createState() => _ModeBodyState();
}

class _ModeBodyState extends State<ModeBody> {
  Container modeIndicator() {
    return Container(
      margin: modeIndicatorMargin,
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(999.0),
        ),
        border: Border.all(
          color: const Color(0xffE0E0E0),
          width: 1,
        ),
      ),
      child: const CircularIndicator(),
    );
  }

  Row modeHeadline() {
    Text titleContent() {
      return Text(
        'Total Time : 15 mins',
        style: modeContentText,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: modeTitleImageMargin,
          child: SvgPicture.asset(
            widget.modeIcon,
            fit: BoxFit.fill,
            width: 24,
            height: 24,
          ),
        ),
        Container(
          margin: zeroMargin,
          child: Text(
            widget.modeTitle,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const Spacer(),
        Container(
          margin: zeroMargin,
          child: titleContent(),
        ),
      ],
    );
  }

  final modeImage = SvgPicture.asset(
    'assets/images/mode_image.svg',
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F3F3),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              modeIndicator(),
              Container(
                margin: modeBodyMargin,
                padding: modePadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xffEEEEEE),
                    width: 1,
                  ),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      spreadRadius: 0,
                      offset: Offset(4, 1),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: zeroMargin,
                      color: Colors.transparent,
                      child: modeHeadline(),
                    ),
                    Container(
                      margin: modeTextMargin,
                      padding: modeTextPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffEEEEEE),
                          width: 0,
                        ),
                        color: const Color(0xffEEEEEE),
                      ),
                      child: Text(
                        widget.modeContent,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 128),
                      width: double.infinity,
                      child: modeImage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
