import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ble_singleton.dart';
import '../constants.dart';
import 'pairing/pairing_complete.dart';
import 'pairing_page.dart';
import 'setting/alarm/alarm_page.dart';
import 'setting/my/my_not_connected.dart';
import 'no_device_page.dart';

class SettingPage extends StatelessWidget implements PreferredSizeWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(0);

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
      'Setting',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  AppBar settingPageAppbar(context) {
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

  ListTile myDevice(context) {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_my_device.svg",
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        'My Device',
        style: listTilebodyText1,
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_chevron_right.svg",
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        print("xxx");
        print(BleSingleton().isConnected);

        if (BleSingleton().isConnected) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const MyDevicePage())));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => NoDevicePage(
                    logoTitle: SvgPicture.asset(
                      'assets/images/lymphowear.svg',
                      fit: BoxFit.fill,
                    ),
                    appbarIcon: IconButton(
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
                    ),
                    leadingButton: Container(),
                    routePairing: const PairingPage(),
                  )),
            ),
          );
        }

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) => NoDevicePage(
        //         logoTitle: Text(
        //           'My Device',
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //         appbarIcon: Container(),
        //         leadingButton: IconButton(
        //           icon: const Icon(Icons.arrow_back_ios),
        //           color: const Color(0xff616161),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //         ),
        //         routePairing: const MyNotConnected())),
        //   ),
        // );
      },
    );
  }

  ListTile alarm(context) {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_timer.svg",
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        'Alarm',
        style: listTilebodyText1,
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_chevron_right.svg",
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const AlarmPage()),
          ),
        );
      },
    );
  }

  Container settingpageBody(context) {
    return Container(
      color: const Color(0xffF3F3F3),
      margin: zeroMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: myDevice(context),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            child: alarm(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingPageAppbar(context),
      body: settingpageBody(context),
    );
  }
}
