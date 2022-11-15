import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetDatePicker extends StatefulWidget {
  final String title;
  final DateTime time;
  final Function(DateTime) onSetTimeChange;
  final Function() onSavePressed;
  const SetDatePicker({
    super.key,
    required this.title,
    required this.time,
    required this.onSetTimeChange,
    required this.onSavePressed,
  });

  @override
  State<SetDatePicker> createState() => _SetDatePickerState();
}

class _SetDatePickerState extends State<SetDatePicker> {
  Size get preferredSize => const Size.fromHeight(0);
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
      widget.title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          TextButton(
              onPressed: widget.onSavePressed,
              child: const Text(
                'Save',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE96000)),
              )),
          Container(width: 10),
        ],
      ),
      body: Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: widget.time,
            mode: CupertinoDatePickerMode.time,
            use24hFormat: false,
            onDateTimeChanged: (DateTime newTime) {
              setState(() {
                widget.time == newTime;
                widget.onSetTimeChange.call(newTime);
              });
            },
          ),
        ),
      ),
    );
  }
}
