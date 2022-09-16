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
      color: Colors.grey[700],
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
        margin: const EdgeInsets.only(left: 10),
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
      margin: const EdgeInsets.fromLTRB(16, 56, 16, 32),
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

  Row relaxingmodeTitle() {
    final titleImage = SvgPicture.asset(
      'assets/icons/ic_relaxing2.svg',
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
          margin: const EdgeInsets.only(right: 8),
          child: titleImage,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          child: title(context),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.all(0.0),
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
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 112),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: relaxingmodeTitle(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 0),
                      ),
                      child: const RelaxingModeBody().relaxingmodeText(context),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 96),
                        width: double.infinity,
                        child: relaxingmodeImage),
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
