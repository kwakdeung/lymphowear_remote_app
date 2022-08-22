import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool _morningValue = true;
  bool _afternoonValue = true;
  bool _eveningValue = true;
  bool _nightValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Alarm',
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF3F3F3),
        margin: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(0.0),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Morning Reminder',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                trailing: CupertinoSwitch(
                  value: _morningValue,
                  onChanged: (bool value) {
                    setState(() {
                      _morningValue = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _morningValue = !_morningValue;
                  });
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Afternoon Reminder',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                trailing: CupertinoSwitch(
                  value: _afternoonValue,
                  onChanged: (bool value) {
                    setState(() {
                      _afternoonValue = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _afternoonValue = !_afternoonValue;
                  });
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Evening Reminder',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                trailing: CupertinoSwitch(
                  value: _eveningValue,
                  onChanged: (bool value) {
                    setState(() {
                      _eveningValue = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _eveningValue = !_eveningValue;
                  });
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              color: Colors.white,
              child: ListTile(
                title: const Text(
                  'Night Reminder',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
                trailing: CupertinoSwitch(
                  value: _nightValue,
                  onChanged: (bool value) {
                    setState(() {
                      _nightValue = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _nightValue = !_nightValue;
                  });
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
          ],
        ),
      ),
    );
  }
}
