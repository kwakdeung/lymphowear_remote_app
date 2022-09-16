import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/components/home/armpit.dart';
import 'package:lymphowear_remote_app/components/home/collarbone.dart';
import 'package:lymphowear_remote_app/components/home/heat.dart';
import 'package:lymphowear_remote_app/components/home/lymphowear_state.dart';
import 'package:lymphowear_remote_app/components/home/shoulder.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/home/relaxing/relaxing_mode.dart';
import 'package:lymphowear_remote_app/pages/home/sleeping/sleeping_mode.dart';
import 'package:lymphowear_remote_app/pages/home/vital/vital_mode.dart';

import 'package:lymphowear_remote_app/pages/setting_page.dart';

class HomeDefault extends StatefulWidget {
  const HomeDefault({Key? key}) : super(key: key);

  @override
  State<HomeDefault> createState() => _HomeDefaultState();
}

class _HomeDefaultState extends State<HomeDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: HomeDefaultAppbar(),
      body: const HomeDefaultBody(),
    );
  }
}

class HomeDefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  HomeDefaultAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton leadingIconButton(context) {
    return IconButton(
        icon: SvgPicture.asset(
          'assets/icons/ic_power.svg',
          fit: BoxFit.fill,
        ),
        onPressed: () {
          _powerAlertDialog(context, "Are you sure you want\n to turn off?");
        });
  }

  final appbarLogo = SvgPicture.asset(
    'assets/images/lymphowear.svg',
    fit: BoxFit.fill,
  );

  IconButton actionsIconButton(context) {
    return IconButton(
        icon: SvgPicture.asset(
          'assets/icons/ic_setting.svg',
          fit: BoxFit.fill,
        ),
        color: Colors.grey[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SettingPage())));
        });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: leadingIconButton(context),
      ),
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: appbarLogo,
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            color: Colors.grey[300],
            height: 2.0,
          )),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 4),
          child: actionsIconButton(context),
        ),
      ],
    );
  }

  Future _powerAlertDialog(BuildContext context, String message) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData(dialogBackgroundColor: Colors.white),
            child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff212121),
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 4, 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(112, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                              side: const BorderSide(
                                  width: 1.0, color: Colors.grey),
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff757575),
                              textStyle: dialogButtonText,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 10, 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(112, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                              backgroundColor: const Color(0xff008A40),
                              foregroundColor: Colors.white,
                              textStyle: dialogButtonText,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          );
        });
  }
}

class HomeDefaultBody extends StatelessWidget {
  const HomeDefaultBody({Key? key}) : super(key: key);

  Container firstContainer(context) {
    const verticalDivider = VerticalDivider(
      width: 1,
      thickness: 1,
      color: Color(0xffEEEEEE),
    );

    GestureDetector vitalmodeButton(context) {
      final vitalmodeimage = SvgPicture.asset(
        'assets/icons/ic_vital2.svg',
        fit: BoxFit.fill,
      );

      Text vitalmodeText() {
        return Text(
          "Vital\n Mode",
          textAlign: TextAlign.center,
          style: modebuttonText,
        );
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VitalMode()),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: vitalmodeimage,
              ),
              vitalmodeText(),
            ],
          ),
        ),
      );
    }

    GestureDetector relaxingmodeButton(context) {
      final relaxingmodeImage = SvgPicture.asset(
        'assets/icons/ic_relaxing2.svg',
        fit: BoxFit.fill,
      );

      Text relaxingmodeText() {
        return Text(
          "Relaxing\n Mode",
          textAlign: TextAlign.center,
          style: modebuttonText,
        );
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const RelaxingMode())));
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: relaxingmodeImage,
              ),
              relaxingmodeText(),
            ],
          ),
        ),
      );
    }

    GestureDetector sleepingmodeButton(context) {
      final sleepingmodeImage = SvgPicture.asset(
        'assets/icons/ic_sleeping2.svg',
        fit: BoxFit.fill,
      );

      Text sleepingmodeText() {
        return Text(
          "Sleeping\n Mode",
          textAlign: TextAlign.center,
          style: modebuttonText,
        );
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SleepingMode())));
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: sleepingmodeImage,
              ),
              sleepingmodeText(),
            ],
          ),
        ),
      );
    }

    return Container(
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
      height: 92,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(0.0),
              child: vitalmodeButton(context),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: verticalDivider,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: relaxingmodeButton(context),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: verticalDivider,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: sleepingmodeButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Container secondContainer(context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      width: double.infinity,
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
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            padding: const EdgeInsets.all(0.0),
            color: Colors.white,
            child: const LymphoWearState(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 0, 24),
            width: double.infinity,
            child: const Collarbone(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 0, 24),
            width: double.infinity,
            child: const Armpit(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 0, 24),
            width: double.infinity,
            child: const Shoulder(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 0, 24),
            width: double.infinity,
            child: const Heat(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F3F3),
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 68),
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  firstContainer(context),
                  secondContainer(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
