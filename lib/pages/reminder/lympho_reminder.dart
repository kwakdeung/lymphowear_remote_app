import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lymphowear_remote_app/main.dart';

import 'package:timezone/timezone.dart' as tz;

class ReminderWidget extends StatefulWidget {
  final void Function(DateTime) onDateTimeChanged;
  const ReminderWidget({
    super.key,
    required this.title,
    required this.onDateTimeChanged,
  });

  final String title;

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReminderWidgetAppbar(
        title: widget.title,
      ),
      body: ReminderWidgetBody(
        title: widget.title,
        onDateTimeChanged: widget.onDateTimeChanged,
      ),
    );
  }
}

class ReminderWidgetAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReminderWidgetAppbar({
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

class ReminderWidgetBody extends StatefulWidget {
  final Function(DateTime) onDateTimeChanged;
  const ReminderWidgetBody({
    super.key,
    required this.title,
    required this.onDateTimeChanged,
  });
  final String title;

  @override
  State<ReminderWidgetBody> createState() => _ReminderWidgetBodyState();
}

class _ReminderWidgetBodyState extends State<ReminderWidgetBody> {
  DateTime time = DateTime.now();

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
            setState(() {
              time = newTime;
              widget.onDateTimeChanged.call(newTime);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return timezoneDatePicker();
  }
}
