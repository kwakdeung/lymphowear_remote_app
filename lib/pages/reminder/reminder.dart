import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lymphowear_remote_app/main.dart';

import 'package:timezone/timezone.dart' as tz;

class Reminder extends StatefulWidget {
  const Reminder({super.key, required this.title});

  final String title;

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReminderAppbar(
        title: widget.title,
      ),
      body: ReminderBody(
        title: widget.title,
      ),
    );
  }
}

class ReminderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReminderAppbar({
    super.key,
    required this.title,
  });
  final String title;
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

  Text timezoneTitle(context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: appbarIconButton(context),
      ),
      title: timezoneTitle(context),
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

class ReminderBody extends StatefulWidget {
  const ReminderBody({super.key, required this.title});
  final String title;
  @override
  State<ReminderBody> createState() => _ReminderBodyState();
}

class _ReminderBodyState extends State<ReminderBody> {
  DateTime time = DateTime.now();

  get hrs => (time.hour);
  get min => (time.minute);

  alarmTime() {
    var setHrs = (hrs % 12).toString().padLeft(2, '0');
    var setMin = min.toString().padLeft(2, '0');
    var mrd = hrs >= 12 ? 'PM' : 'AM';

    return '$setHrs:$setMin $mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  int showInstantNum = 0;
  int showReservativeNum = 1;
  int notificationCycle = 1;

  Container timezoneDatePicker() {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: time,
          mode: CupertinoDatePickerMode.time,
          use24hFormat: false,
          onDateTimeChanged: (DateTime newTime) {
            setState(() => time = newTime);
          },
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails();
    await flutterLocalNotificationsPlugin.show(
      showInstantNum,
      alarmTime(),
      widget.title,
      notificationDetails,
    );
  }

  Future<void> _scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      showReservativeNum,
      alarmTime(),
      widget.title,
      _selectNotification(),
      const NotificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(showInstantNum);
  }

  Future<void> _cancelSelectedPushNotification() async {
    await flutterLocalNotificationsPlugin.cancel(showReservativeNum);
  }

  tz.TZDateTime _selectNotification() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hrs, min);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        Duration(days: notificationCycle),
      );
    }
    return scheduledDate;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          timezoneDatePicker(),
          const Text('Time'),
          Text(
            alarmTime(),
            style: const TextStyle(
              fontSize: 22.0,
              color: Color(0xff0BB15D),
            ),
          ),
          ElevatedButton(
            child: const Text('ImmediatelyPush Notification'),
            onPressed: () async {
              await _showNotification();
            },
          ),
          ElevatedButton(
            child: const Text(
              'Selected Push Notification',
            ),
            onPressed: () async {
              await _scheduleDailyTenAMNotification();
            },
          ),
          ElevatedButton(
            child: const Text('Cancel ImmediatelyPush notification'),
            onPressed: () async {
              await _cancelNotification();
            },
          ),
          ElevatedButton(
            child: const Text('Cancel Selected Push notification'),
            onPressed: () async {
              await _cancelSelectedPushNotification();
            },
          ),
        ],
      ),
    );
  }
}
