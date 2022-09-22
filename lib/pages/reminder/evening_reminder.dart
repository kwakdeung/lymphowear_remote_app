import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EveningReminder extends StatefulWidget {
  const EveningReminder({Key? key}) : super(key: key);

  @override
  State<EveningReminder> createState() => _EveningReminderState();
}

class _EveningReminderState extends State<EveningReminder> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EveningReminderAppbar(),
      body: EveningReminderBody(),
    );
  }
}

class EveningReminderAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const EveningReminderAppbar({super.key});

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

  Text title(context) {
    return Text(
      'Evening Reminder',
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
      title: title(context),
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

class EveningReminderBody extends StatefulWidget {
  const EveningReminderBody({super.key});

  @override
  State<EveningReminderBody> createState() => _EveningReminderBodyState();
}

class _EveningReminderBodyState extends State<EveningReminderBody> {
  DateTime time = DateTime.now();

  String get alarmTime {
    var hrs = (time.hour % 12).toString().padLeft(2, '0');
    var min = (time.minute).toString().padLeft(2, '0');
    var mrd = time.hour >= 12 ? 'PM' : 'AM';
    return '$hrs:$min$mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  Container datePicker() {
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
          datePicker(),
          const Text('Time'),
          Text(
            alarmTime,
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
