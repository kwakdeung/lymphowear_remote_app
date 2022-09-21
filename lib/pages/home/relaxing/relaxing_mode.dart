import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';
import 'package:lymphowear_remote_app/constants.dart';

class RelaxingMode extends StatefulWidget {
  const RelaxingMode({Key? key}) : super(key: key);

  @override
  State<RelaxingMode> createState() => _RelaxingModeState();
}

class _RelaxingModeState extends State<RelaxingMode> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: RelaxingModeAppbar(),
      body: RelaxingModeBody(),
    );
  }
}

class RelaxingModeAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const RelaxingModeAppbar({Key? key}) : super(key: key);

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
      'Relaxing Mode',
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
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class RelaxingModeBody extends StatefulWidget {
  const RelaxingModeBody({Key? key}) : super(key: key);

  Text relaxingmodeText(context) {
    return Text(
      'A mode that relieves fatigue and restores energy by removing toxins that are piled up late in the afternoon. A mode that relieves fatigue and restores energy by removing toxins that are piled up late in the afternoon.',
      style: Theme.of(context).textTheme.caption,
    );
  }

  @override
  State<RelaxingModeBody> createState() => _RelaxingModeBodyState();
}

class _RelaxingModeBodyState extends State<RelaxingModeBody> {
  Container relaxingmodeIndicator() {
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

  Row relaxingmodeTitle() {
    final titleImage = SvgPicture.asset(
      'assets/icons/ic_relaxing.svg',
      fit: BoxFit.fill,
      width: 24,
      height: 24,
    );

    Text title(context) {
      return Text(
        'Relaxing Mode',
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

  final relaxingmodeImage = SvgPicture.asset(
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
              relaxingmodeIndicator(),
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
                      child: relaxingmodeTitle(),
                    ),
                    Container(
                      margin: modeTextMargin,
                      padding: modeTextPadding,
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffEEEEEE),
                          width: 0,
                        ),
                      ),
                      child: const RelaxingModeBody().relaxingmodeText(context),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 96),
                      width: double.infinity,
                      child: relaxingmodeImage,
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
