import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../ble_singleton.dart';
import '../../components/home/lympho_part_slider.dart';
import '../../components/home/lymphowear_custom_view.dart';
import '../../constants.dart';
import '../setting_page.dart';
import 'mode.dart';

class CustomModeView extends StatefulWidget {
  const CustomModeView({Key? key}) : super(key: key);

  @override
  State<CustomModeView> createState() => _CustomModeViewState();
}

class _CustomModeViewState extends State<CustomModeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: CustomModeAppbar(),
        body: const CustomModeBodyView(),
      ),
      onWillPop: () async {
        BleSingleton().disconnect();
        return true;
      },
    );
  }
}

class CustomModeAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomModeAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton leadingIconButton(context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/ic_power.svg',
        fit: BoxFit.fill,
      ),
      onPressed: () {
        _powerAlertDialog(
          context,
          "Are you sure you want\n to turn off?",
        );
      },
    );
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
      color: const Color(0xff616161),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const SettingPage()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: appbarleadingMargin,
        child: leadingIconButton(context),
      ),
      title: Container(
        margin: logoMargin,
        child: appbarLogo,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: appbarIconbuttonMargin,
          child: actionsIconButton(context),
        ),
      ],
    );
  }

  Future _powerAlertDialog(BuildContext context, String message) async {
    final title = Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xff212121),
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: regular,
      ),
    );

    ElevatedButton noButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(112, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          side: const BorderSide(width: 1.0, color: Color(0xff757575)),
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff757575),
          textStyle: dialogButtonText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No'),
      );
    }

    ElevatedButton yesButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(112, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          backgroundColor: const Color(0xffED711A),
          foregroundColor: Colors.white,
          textStyle: dialogButtonText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Yes'),
      );
    }

    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: title,
      actions: [
        Container(
          margin: zeroMargin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 4, 20),
                child: noButton(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 10, 20),
                child: yesButton(),
              ),
            ],
          ),
        ),
      ],
    );

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
          ),
          child: alertDialog,
        );
      },
    );
  }
}

class CustomModeBodyView extends StatelessWidget {
  const CustomModeBodyView({Key? key}) : super(key: key);

  Container firstContainer(context) {
    const verticalDivider = VerticalDivider(
      width: 1,
      thickness: 1,
      color: Color(0xffEEEEEE),
    );

    GestureDetector vitalModeButton(context) {
      final vitalModeImage = SvgPicture.asset(
        'assets/icons/ic_vital.svg',
        fit: BoxFit.fill,
      );

      Text vitalModeText() {
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
            MaterialPageRoute(
              builder: (context) => const AutoModeView(
                backgroundImage: 'assets/images/background_vital.json',
                title: '',
                modeTitle: 'Vital Mode',
                modeColor: Color(0xffED711A),
                iconColor: Color(0xff212121),
                modeContent:
                    'Reduce swelling and facial puffiness and\n boost your energy levels in the morning.',
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: modeImageMargin,
                child: vitalModeImage,
              ),
              vitalModeText(),
            ],
          ),
        ),
      );
    }

    GestureDetector relaxingModeButton(context) {
      final relaxingModeImage = SvgPicture.asset(
        'assets/icons/ic_relaxing.svg',
        fit: BoxFit.fill,
      );

      Text relaxingModeText() {
        return Text(
          "Relaxing\n Mode",
          textAlign: TextAlign.center,
          style: modebuttonText,
        );
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AutoModeView(
                backgroundImage: 'assets/images/background_relaxing.json',
                title: '',
                modeTitle: 'Relaxing Mode',
                modeColor: Color(0xff007DA7),
                iconColor: Color(0xff212121),
                modeContent:
                    'Decrease stress and increase ease tension\n throughout your body in the daytime.',
              ),
            ),
          );
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: modeImageMargin,
                child: relaxingModeImage,
              ),
              relaxingModeText(),
            ],
          ),
        ),
      );
    }

    GestureDetector sleepingModeButton(context) {
      final sleepingModeImage = SvgPicture.asset(
        'assets/icons/ic_sleeping.svg',
        fit: BoxFit.fill,
      );

      Text sleepingModeText() {
        return Text(
          "Sleeping\n Mode",
          textAlign: TextAlign.center,
          style: modebuttonText,
        );
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AutoModeView(
                backgroundImage: 'assets/images/background_sleeping.json',
                title: '',
                modeTitle: 'Sleeping Mode',
                modeColor: Color(0xffF6DA6B),
                iconColor: Color(0xffFFFFFF),
                modeContent:
                    "Experience the full sleep-promoting\n effects before bedtime.",
              ),
            ),
          );
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: modeImageMargin,
                child: sleepingModeImage,
              ),
              sleepingModeText(),
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
              margin: zeroMargin,
              child: vitalModeButton(context),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: verticalDivider,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: relaxingModeButton(context),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: verticalDivider,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: sleepingModeButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Container secondContainer(context) {
    double homeValueHeight = 56;

    return Container(
      margin: const EdgeInsets.only(top: 16),
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
            margin: const EdgeInsets.only(bottom: 32),
            color: Colors.white,
            child: const LymphoWearCustomView(),
          ),
          Container(
            margin: homeValueMargin,
            height: homeValueHeight,
            child: LymphoPartSliderWidget(
              title: 'Collarbone',
              image: 'assets/images/collarbone.png',
              maxValue: 3,
              divisions: 3,
              icon: 'assets/icons/ic_max.svg',
              activeTrackColor: const Color(0xffED711A),
              inactiveTrackColor: const Color(0xffEEEEEE),
              thumbColor: const Color(0xffED711A),
              iconColor: const Color(0xff424242),
              sliderTextColor: const Color(0xff9E9E9E),
              valueColor: const Color(0xffED711A),
              onValueChanged: (value) {
                var ble = BleSingleton();
                ble.collarbone = value;
                if (ble.isRunning) {
                  ble.writeToDevice('+MC', value);
                }
              },
            ),
          ),
          Container(
            margin: homeValueMargin,
            height: homeValueHeight,
            child: LymphoPartSliderWidget(
              title: 'Armpit',
              image: 'assets/images/armpit.png',
              maxValue: 3,
              divisions: 3,
              icon: 'assets/icons/ic_max.svg',
              activeTrackColor: const Color(0xffED711A),
              inactiveTrackColor: const Color(0xffEEEEEE),
              thumbColor: const Color(0xffED711A),
              iconColor: const Color(0xff424242),
              sliderTextColor: const Color(0xff9E9E9E),
              valueColor: const Color(0xffED711A),
              onValueChanged: (value) {
                var ble = BleSingleton();
                ble.armpit = value;
                if (ble.isRunning) {
                  ble.writeToDevice('+MA', value);
                }
              },
            ),
          ),
          Container(
            margin: homeValueMargin,
            height: homeValueHeight,
            child: LymphoPartSliderWidget(
              title: 'Shoulder',
              image: 'assets/images/shoulder.png',
              maxValue: 3,
              divisions: 3,
              icon: 'assets/icons/ic_max.svg',
              activeTrackColor: const Color(0xffED711A),
              inactiveTrackColor: const Color(0xffEEEEEE),
              thumbColor: const Color(0xffED711A),
              iconColor: const Color(0xff424242),
              sliderTextColor: const Color(0xff9E9E9E),
              valueColor: const Color(0xffED711A),
              onValueChanged: (value) {
                var ble = BleSingleton();
                ble.shoulder = value;
                if (ble.isRunning) {
                  ble.writeToDevice('+MS', value);
                }
              },
            ),
          ),
          Container(
            margin: homeValueMargin,
            height: homeValueHeight,
            child: LymphoPartSliderWidget(
              title: 'Heat',
              image: 'assets/images/heat.png',
              maxValue: 2,
              divisions: 2,
              icon: 'assets/icons/ic_heat_max.svg',
              activeTrackColor: const Color(0xffED711A),
              inactiveTrackColor: const Color(0xffEEEEEE),
              thumbColor: const Color(0xffED711A),
              iconColor: const Color(0xff424242),
              sliderTextColor: const Color(0xff9E9E9E),
              valueColor: const Color(0xffED711A),
              onValueChanged: (value) {
                var ble = BleSingleton();
                ble.heat = value;
                if (ble.isRunning) {
                  ble.writeToDevice('+MH', value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE9F2F4),
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 68),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
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
