import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/circularindicator.dart';

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

  IconButton appbaricon(context) {
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
      style: Theme.of(context).textTheme.headline1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
          margin: const EdgeInsets.only(left: 10), child: appbaricon(context)),
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

  static const vitalmodecontent = Text(
    'Mode to start the day lightly after waking up to reduce swelling. Mode to start the day lightly after waking up to reduce swelling.',
    style: TextStyle(
        color: Color(0xff616161),
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400),
  );

  @override
  State<VitalModeBody> createState() => _VitalModeBodyState();
}

class _VitalModeBodyState extends State<VitalModeBody> {
  Container vitalmodeindicator() {
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

  Row vitalmodetitle() {
    final titleimage = SvgPicture.asset(
      'assets/icons/ic_vital2.svg',
      width: 24,
      height: 24,
    );

    Text title(context) {
      return Text(
        'Vital Mode',
        style: Theme.of(context).textTheme.headline3,
      );
    }

    const titlecontent = Text(
      'Total Time : 15 mins',
      style: TextStyle(
          color: Color(0xff9E9E9E),
          fontSize: 10,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: titleimage,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          child: title(context),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.all(0.0),
          child: titlecontent,
        ),
      ],
    );
  }

  final vitalmodeimage = SvgPicture.asset(
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
              vitalmodeindicator(),
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
                      margin: const EdgeInsets.all(0.0),
                      color: Colors.transparent,
                      child: vitalmodetitle(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12, width: 0),
                        color: const Color(0xffEEEEEE),
                      ),
                      child: VitalModeBody.vitalmodecontent,
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 128),
                        width: double.infinity,
                        child: vitalmodeimage),
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
