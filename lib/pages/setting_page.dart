import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/constants.dart';

import 'package:lymphowear_remote_app/pages/my_none.dart';
import 'package:lymphowear_remote_app/pages/setting/alarm/alarm_page.dart';

class SettingPage extends StatelessWidget implements PreferredSizeWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(0);

  IconButton appbarIcon(context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      color: Colors.grey[700],
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

  AppBar settingpageAppbar(context) {
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

  ListTile myDevice(context) {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_my_device.svg",
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
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const MyNone()),
          ),
        );
      },
    );
  }

  ListTile alarm(context) {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_timer.svg",
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

  ListTile userGuide() {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_info.svg",
        ),
      ),
      title: Text(
        'User Guide',
        style: listTilebodyText1,
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_chevron_right.svg",
        ),
      ),
      onTap: () {},
    );
  }

  ListTile question() {
    return ListTile(
      leading: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_help.svg",
        ),
      ),
      title: Text(
        'FAQ',
        style: listTilebodyText1,
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: SvgPicture.asset(
          "assets/icons/ic_chevron_right.svg",
        ),
      ),
      onTap: () {},
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
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            child: userGuide(),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            child: question(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingpageAppbar(context),
      body: settingpageBody(context),
    );
  }
}
