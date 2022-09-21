import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfternoonReminder extends StatefulWidget {
  const AfternoonReminder({Key? key}) : super(key: key);

  @override
  State<AfternoonReminder> createState() => _AfternoonReminderState();
}

class _AfternoonReminderState extends State<AfternoonReminder> {
  DateTime time = DateTime.now();

  String get alarmTime {
    var hrs = (time.hour % 12).toString().padLeft(2, '0');
    var min = (time.minute).toString().padLeft(2, '0');
    var mrd = time.hour >= 12 ? 'PM' : 'AM';
    return '$hrs:$min$mrd';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff616161),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Afternoon Reminder',
          style: Theme.of(context).textTheme.headline6,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: const Color(0xffEEEEEE),
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CupertinoPageScaffold(
              child: Container(
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
              ),
            ),
            _DatePickerItem(
              children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
