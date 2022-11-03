import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/reminder/lympho_reminder.dart';
import 'package:lymphowear_remote_app/pages/reminder/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // late int timer = DateTime.now().millisecondsSinceEpoch;
  // late c prefs;

  @override
  void initState() {
    super.initState();
    // getSharedPreferences();
  }

  // getSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     timer = (prefs.getInt("timer") ?? 0);
  //   });
  // }

  void onDateTimeChanged(DateTime newTime) {
    setState(() {
      time = newTime;
    });
  }

  DateTime time = DateTime.now();

  get hrs => (time.hour);
  get min => (time.minute);

  get alarmTime {
    var setHrs = (hrs % 12).toString().padLeft(2, '0');
    var setMin = min.toString().padLeft(2, '0');
    var mrd = hrs >= 12 ? 'PM' : 'AM';

    return '$setHrs:$setMin$mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  bool _firstAlarmButton = false;
  bool _firstAlarmVisible = false;
  String _firstAlarmValue = "";

  bool _secondAlarmButton = false;
  bool _secondAlarmVisible = false;
  String _secondAlarmValue = "";

  void showFirstAlarm() {
    _firstAlarmButton = !_firstAlarmButton;
    if (_firstAlarmButton != false) {
      _firstAlarmVisible = true;
      _firstAlarmValue = "Scheduled for " + alarmTime;
    } else {
      _firstAlarmVisible = false;
      _firstAlarmValue = "";
    }
  }

  void showSecondAlarm() {
    _secondAlarmButton = !_secondAlarmButton;
    if (_secondAlarmButton != false) {
      _secondAlarmVisible = true;
      _secondAlarmValue = "Scheduled for 12:00PM";
    } else {
      _secondAlarmVisible = false;
      _secondAlarmValue = "";
    }
  }

  ListTile firstAlarmReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm 1',
            style: listTilebodyText1,
          ),
          Visibility(
            visible: _firstAlarmVisible,
            child: Text(
              _firstAlarmValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xffED711A),
        value: _firstAlarmButton,
        onChanged: (bool value) {
          setState(() {
            showFirstAlarm();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ReminderWidget(
                  title: 'Morning Reminder',
                  onDateTimeChanged: onDateTimeChanged,
                )),
          ),
        );
      },
    );
  }

  ListTile secondAlarmReminder() {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alarm 2',
            style: listTilebodyText1,
          ),
          Visibility(
            visible: _secondAlarmVisible,
            child: Text(
              _secondAlarmValue,
              style: alramValueText,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xffED711A),
        value: _secondAlarmButton,
        onChanged: (bool value) {
          setState(() {
            showSecondAlarm();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const Reminder(title: 'Afternoon Reminder')),
          ),
        );
      },
    );
  }

  static const divider = Divider(
    height: 1,
    color: Color(0xffE0E0E0),
  );

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
            padding: reminderPadding,
            child: firstAlarmReminder(),
          ),
          divider,
          Container(
            color: Colors.white,
            padding: reminderPadding,
            child: secondAlarmReminder(),
          ),
          divider,
        ],
      ),
    );
  }
}
