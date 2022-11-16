import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/reminder/lympho_reminder.dart';
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
  void onDateTimeChanged(DateTime newTime) {
    setState(() {
      time = newTime;
    });
  }

  DateTime time = DateTime(0, 0, 0, 9, 0);
  int _counter = 0;

  get hrs => (time.hour);
  get min => (time.minute);

  get alarmTime {
    var setHrs = (hrs % 12).toString().padLeft(2, '0');
    var setMin = min.toString().padLeft(2, '0');
    var mrd = hrs >= 12 ? 'PM' : 'AM';

    return 'Scheduled for $setHrs:$setMin$mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  //Loading counter value on start
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      _firstAlarmButton = (prefs.getBool('repeat') ?? false);
    });
  }

  //Incrementing counter after click
  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    int time1 = time.millisecondsSinceEpoch;

    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);

      prefs.setInt('counter', time1);
    });
  }

  //Incrementing counter after click
  Future<void> _setBoolean() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setBool('repeat', _firstAlarmButton);
    });
  }

  removeValues() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('counter');
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  bool _firstAlarmButton = false;

  // bool _secondAlarmButton = false;
  // String _secondAlarmValue = "";

  // void showSecondAlarm() {
  //   _secondAlarmButton = !_secondAlarmButton;
  //   if (_secondAlarmButton != false) {
  //     _secondAlarmValue = "Scheduled for 12:00PM";
  //   } else {
  //     _secondAlarmValue = "Scheduled for 12:00PM";
  //   }
  // }

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
            'Scheduled for ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(_counter).toLocal())}',
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
          _setBoolean();
          setState(() {
            _firstAlarmButton = !_firstAlarmButton;
            if (_firstAlarmButton) {
            } else if (!_firstAlarmButton) {}
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => SetDatePicker(
                  title: 'Alarm 1',
                  time: time,
                  onSetTimeChange: (DateTime newTime) {
                    setState(() => time = newTime);
                  },
                  onSavePressed: () {
                    _incrementCounter();
                  },
                )),
          ),
        );
      },
    );
  }

  // ListTile secondAlarmReminder() {
  //   return ListTile(
  //     leading: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Alarm 2',
  //           style: listTilebodyText1,
  //         ),
  //         Text(
  //           _secondAlarmValue,
  //           style: TextStyle(
  //             color: _secondAlarmButton != false
  //                 ? const Color(0xffED711A)
  //                 : const Color(0xff9E9E9E),
  //             fontSize: 12,
  //             fontWeight: regular,
  //           ),
  //         ),
  //       ],
  //     ),
  //     trailing: Switch(
  //       activeColor: Colors.white,
  //       activeTrackColor: const Color(0xffED711A),
  //       value: _secondAlarmButton,
  //       onChanged: (bool value) {
  //         setState(() {
  //           showSecondAlarm();
  //         });
  //       },
  //     ),
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: ((context) => const Reminder(title: 'Alarm 2')),
  //         ),
  //       );
  //     },
  //   );
  // }

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
          // Container(
          //   color: Colors.white,
          //   padding: reminderPadding,
          //   child: secondAlarmReminder(),
          // ),
          // divider,
        ],
      ),
    );
  }
}
