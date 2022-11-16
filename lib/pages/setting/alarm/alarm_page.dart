import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/reminder/lympho_reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../main.dart';

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
  int firstShowReservativeNum = 1;
  int secondShowReservativeNum = 2;
  int notificationCycle = 1;

  DateTime firstTime = DateTime(0, 0, 0, 8, 0);
  DateTime secondTime = DateTime(0, 0, 0, 18, 0);
  int _firstNum = 0;
  int _secondNum = 0;

  bool _firstAlarmButton = false;
  bool _secondAlarmButton = false;

  get firstHrs => (firstTime.hour);
  get firstMin => (firstTime.minute);

  get firstAlarmTime {
    var setFirstHrs = (firstHrs % 12).toString().padLeft(2, '0');
    var setFirstMin = firstMin.toString().padLeft(2, '0');
    var firstmrd = firstHrs >= 12 ? 'PM' : 'AM';

    return 'Scheduled for $setFirstHrs:$setFirstMin$firstmrd';
  }

  get secondHrs => (secondTime.hour);
  get secondMin => (secondTime.minute);

  get secondAlarmTime {
    var setSecondHrs = (secondHrs % 12).toString().padLeft(2, '0');
    var setSecondMin = secondMin.toString().padLeft(2, '0');
    var secondmrd = secondHrs >= 12 ? 'PM' : 'AM';

    return 'Scheduled for $setSecondHrs:$setSecondMin$secondmrd';
  }

  Future<void> _firstScheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      firstShowReservativeNum,
      firstAlarmTime,
      'Time For A Massage!',
      _firstSelectNotification(),
      const NotificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _secondScheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      secondShowReservativeNum,
      secondAlarmTime,
      'Time For A Massage!',
      _secondSelectNotification(),
      const NotificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _firstCancelSelectedPushNotification() async {
    await flutterLocalNotificationsPlugin.cancel(firstShowReservativeNum);
  }

  Future<void> _secondCancelSelectedPushNotification() async {
    await flutterLocalNotificationsPlugin.cancel(secondShowReservativeNum);
  }

  tz.TZDateTime _firstSelectNotification() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, firstHrs, firstMin);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        Duration(days: notificationCycle),
      );
    }
    return scheduledDate;
  }

  tz.TZDateTime _secondSelectNotification() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, secondHrs, secondMin);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        Duration(days: notificationCycle),
      );
    }
    return scheduledDate;
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _firstNum = (prefs.getInt('firstSetTime') ?? 0);
      _secondNum = (prefs.getInt('secondSetTime') ?? 0);
      _firstAlarmButton = (prefs.getBool('firstSetAlarm') ?? true);
      _secondAlarmButton = (prefs.getBool('secondSetAlarm') ?? true);
    });
  }

  Future<void> _firstSaveTime() async {
    final prefs = await SharedPreferences.getInstance();
    int time1 = firstTime.millisecondsSinceEpoch;
    prefs.setInt('firstSetTime', time1);
    setState(() {
      _firstNum = (prefs.getInt('firstSetTime') ?? 0);
    });
  }

  Future<void> _secondSaveTime() async {
    final prefs = await SharedPreferences.getInstance();
    int time2 = secondTime.millisecondsSinceEpoch;
    prefs.setInt('secondSetTime', time2);
    setState(() {
      _secondNum = (prefs.getInt('secondSetTime') ?? 0);
    });
  }

  Future<void> _firstSaveAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstSetAlarm', _firstAlarmButton);
    setState(() {
      _firstNum = (prefs.getInt('firstSetTime') ?? 0);
    });
  }

  Future<void> _secondSaveAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('secondSetAlarm', _secondAlarmButton);
    setState(() {
      _secondNum = (prefs.getInt('secondSetTime') ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void setFirstToggle() {
    _firstAlarmButton = !_firstAlarmButton;
    if (_firstAlarmButton) {
      _firstScheduleDailyTenAMNotification();
    } else if (!_firstAlarmButton) {
      _firstCancelSelectedPushNotification();
    }
  }

  void setSecondToggle() {
    _secondAlarmButton = !_secondAlarmButton;
    if (_secondAlarmButton) {
      _secondScheduleDailyTenAMNotification();
    } else if (!_secondAlarmButton) {
      _secondCancelSelectedPushNotification();
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
          Text(
            'Scheduled for ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(_firstNum).toLocal())}',
            style: TextStyle(
              color: _firstAlarmButton != false
                  ? const Color(0xffED711A)
                  : const Color(0xff9E9E9E),
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xffED711A),
        value: _firstAlarmButton,
        onChanged: (bool value) {
          _firstSaveAlarm();
          setState(() {
            setFirstToggle();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SetDatePicker(
                  title: 'Alarm 1',
                  time: firstTime,
                  onSetTimeChange: (DateTime newTime) {
                    setState(() => firstTime = newTime);
                  },
                  onSavePressed: _firstSaveTime,
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
          Text(
            'Scheduled for ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(_secondNum).toLocal())}',
            style: TextStyle(
              color: _secondAlarmButton != false
                  ? const Color(0xffED711A)
                  : const Color(0xff9E9E9E),
              fontSize: 12,
              fontWeight: regular,
            ),
          ),
        ],
      ),
      trailing: Switch(
        activeColor: Colors.white,
        activeTrackColor: const Color(0xffED711A),
        value: _secondAlarmButton,
        onChanged: (bool value) {
          _secondSaveAlarm();
          setState(() {
            setSecondToggle();
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SetDatePicker(
                  title: 'Alarm 2',
                  time: firstTime,
                  onSetTimeChange: (DateTime newTime) {
                    setState(() => secondTime = newTime);
                  },
                  onSavePressed: () {
                    _secondSaveTime();
                  },
                )),
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
