import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfternoonReminder extends StatefulWidget {
  const AfternoonReminder({Key? key}) : super(key: key);

  @override
  State<AfternoonReminder> createState() => _AfternoonReminderState();
}

class _AfternoonReminderState extends State<AfternoonReminder> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AfternoonReminderAppbar(),
      body: AfternoonReminderBody(),
    );
  }
}

class AfternoonReminderAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const AfternoonReminderAppbar({super.key});

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

  Text afternoonTitle(context) {
    return Text(
      'Afternoon Reminder',
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
      title: afternoonTitle(context),
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

class AfternoonReminderBody extends StatefulWidget {
  const AfternoonReminderBody({super.key});

  @override
  State<AfternoonReminderBody> createState() => _AfternoonReminderBodyState();
}

class _AfternoonReminderBodyState extends State<AfternoonReminderBody> {
  DateTime time = DateTime.now();

  String get afternoonAlarmTime {
    var hrs = (time.hour % 12).toString().padLeft(2, '0');
    var min = (time.minute).toString().padLeft(2, '0');
    var mrd = time.hour >= 12 ? 'PM' : 'AM';
    return '$hrs:$min$mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  Container afternoonDatePicker() {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          afternoonDatePicker(),
          const Text('Time'),
          Text(
            afternoonAlarmTime,
            style: const TextStyle(
              fontSize: 22.0,
              color: Color(0xff0BB15D),
            ),
          ),
        ],
      ),
    );
  }
}
