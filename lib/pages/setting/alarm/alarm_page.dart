import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/reminder/afternoon_reminder.dart';
import 'package:lymphowear_remote_app/pages/reminder/evening_reminder.dart';
import 'package:lymphowear_remote_app/pages/reminder/morning_reminder.dart';
import 'package:lymphowear_remote_app/pages/reminder/night_reminder.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AlarmPageAppbar(),
      body: AlarmPageBody(),
    );
  }
}

class AlarmPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AlarmPageAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: const Color(0xff616161),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text apppbarTitle(context) {
    return Text(
      'Alarm',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: appbarIconButton(context),
      ),
      title: apppbarTitle(context),
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

class AlarmPageBody extends StatefulWidget {
  const AlarmPageBody({Key? key}) : super(key: key);

  @override
  State<AlarmPageBody> createState() => _AlarmPageBodyState();
}

class _AlarmPageBodyState extends State<AlarmPageBody> {
  bool _morningButton = false;
  bool _morningVisible = false;
  String _morningValue = "";

  bool _afternoonButton = false;
  bool _afternoonVisible = false;
  String _afternoonValue = "";

  bool _eveningButton = false;
  bool _eveningVisible = false;
  String _eveningValue = "";

  bool _nightButton = false;
  bool _nightVisible = false;
  String _nightValue = "";

  void showMorning() {
    _morningButton = !_morningButton;
    if (_morningButton != false) {
      _morningVisible = true;
      _morningValue = "Scheduled for 08:00AM";
    } else {
      _morningVisible = false;
      _morningValue = "";
    }
  }

  void showAfternoon() {
    _afternoonButton = !_afternoonButton;
    if (_afternoonButton != false) {
      _afternoonVisible = true;
      _afternoonValue = "Scheduled for 12:00PM";
    } else {
      _afternoonVisible = false;
      _afternoonValue = "";
    }
  }

  void showEvening() {
    _eveningButton = !_eveningButton;
    if (_eveningButton != false) {
      _eveningVisible = true;
      _eveningValue = "Scheduled for 06:00PM";
    } else {
      _eveningVisible = false;
      _eveningValue = "";
    }
  }

  void showNight() {
    _nightButton = !_nightButton;
    if (_nightButton != false) {
      _nightVisible = true;
      _nightValue = "Scheduled for 10:00PM";
    } else {
      _nightVisible = false;
      _nightValue = "";
    }
  }

  ListTile morningReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Morning Reminder',
            style: listTilebodyText1,
          ),
          Visibility(
            visible: _morningVisible,
            child: Text(
              _morningValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xff0BB15D),
        value: _morningButton,
        onChanged: (bool value) {
          setState(() {
            showMorning();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const MorningReminder()),
          ),
        );
      },
    );
  }

  ListTile afternoonReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Afternoon Reminder',
            style: listTilebodyText1,
          ),
          Visibility(
            visible: _afternoonVisible,
            child: Text(
              _afternoonValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xff0BB15D),
        value: _afternoonButton,
        onChanged: (bool value) {
          setState(() {
            showAfternoon();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const AfternoonReminder()),
          ),
        );
      },
    );
  }

  ListTile eveningReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evening Reminder',
            style: listTilebodyText1,
          ),
          Visibility(
            visible: _eveningVisible,
            child: Text(
              _eveningValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xff0BB15D),
        value: _eveningButton,
        onChanged: (bool value) {
          setState(() {
            showEvening();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const EveningReminder()),
          ),
        );
      },
    );
  }

  ListTile nightReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: zeroMargin,
            child: Text(
              'Night Reminder',
              style: listTilebodyText1,
            ),
          ),
          Visibility(
            visible: _nightVisible,
            child: Text(
              _nightValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xff0BB15D),
        value: _nightButton,
        onChanged: (bool value) {
          setState(() {
            showNight();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const NightReminder()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F3F3),
      margin: zeroMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: morningReminder(),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: afternoonReminder(),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: eveningReminder(),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: nightReminder(),
          ),
          const Divider(
            height: 1,
            color: Color(0xffE0E0E0),
          ),
        ],
      ),
    );
  }
}
