// import 'package:cupertino_datepicker/cupertinodatepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class NightReminder extends StatefulWidget {
  const NightReminder({Key? key}) : super(key: key);

  @override
  State<NightReminder> createState() => _NightReminderState();
}

class _NightReminderState extends State<NightReminder> {
  DateTime time = DateTime.now();

  String get alarmTime {
    var hours = (time.hour % 12).toString().padLeft(2, '0');
    var min = (time.minute).toString().padLeft(2, '0');
    var meridiem = time.hour >= 12 ? 'PM' : 'AM';
    return '$hours:$min$meridiem';
    // return '${time.hour % 12 < 10 ? '0${time.hour % 12}' : time.hour % 12}:${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  // String fomattedDate = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Morning Reminder',
          style: Theme.of(context).textTheme.headline6,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
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
                ), // margin 조절
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
          //     ),
        ),
      ),
    );
  }
}

// This class simply decorates a row of widgets.
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
