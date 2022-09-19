import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

class VitalMode extends StatefulWidget {
  const VitalMode({Key? key}) : super(key: key);

  @override
  State<VitalMode> createState() => _VitalModeState();
}

class _VitalModeState extends State<VitalMode> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VitalModeAppbar(),
      body: VitalModeBody(),
    );
  }
}

class VitalModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const VitalModeAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIcon(context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'Vital Mode',
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
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: Colors.grey[200],
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class VitalModeBody extends StatefulWidget {
  const VitalModeBody({Key? key}) : super(key: key);

  Text vitalmodeContent(context) {
    return Text(
      'Mode to start the day lightly after waking up to reduce swelling. Mode to start the day lightly after waking up to reduce swelling.',
      style: Theme.of(context).textTheme.caption,
    );
  }

  @override
  State<VitalModeBody> createState() => _VitalModeBodyState();
}

class _VitalModeBodyState extends State<VitalModeBody> {
  Container vitalmodeIndicator() {
    return Container(
      margin: modeIndicatorMargin,
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(999.0)),
        border: Border.all(
          color: const Color(0xffE0E0E0),
          width: 1,
        ),
      ),
      child: const CircularIndicator(),
    );
  }

  Row vitalmodeTitle() {
    final titleImage = SvgPicture.asset(
      'assets/icons/ic_vital2.svg',
      width: 24,
      height: 24,
    );

    Text title(context) {
      return Text(
        'Vital Mode',
        style: Theme.of(context).textTheme.subtitle2,
      );
    }

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
          child: titleImage,
        ),
        Container(
          margin: zeroMargin,
          child: title(context),
        ),
        const Spacer(),
        Container(
          margin: zeroMargin,
          child: titleContent(),
        ),
      ],
    );
  }

  final vitalmodeImage = SvgPicture.asset(
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
              vitalmodeIndicator(),
              Container(
                margin: modeBodyMargin,
                padding: modePadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffEEEEEE), width: 1),
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
                      child: vitalmodeTitle(),
                    ),
                    Container(
                      margin: modeTextMargin,
                      padding: modeTextPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 0),
                        color: const Color(0xffEEEEEE),
                      ),
                      child: const VitalModeBody().vitalmodeContent(context),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 128),
                        width: double.infinity,
                        child: vitalmodeImage),
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
