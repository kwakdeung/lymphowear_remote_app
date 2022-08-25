import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lymphowear_remote_app/pages/reminder/morning.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool _morningButton = false;
  bool _morningVisible = false;
  String _morningValue = "";

  bool _afternoonButton = false;
  bool _afternoonVisible = false;
  String _afternoonValue = "";

  bool _eveningButton = false;
  bool _eveningVisible = false;
  String _eveningValue = "";

  bool _nightButton = false;
  bool _nightVisible = false;
  String _nightValue = "";

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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              width: double.infinity,
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Morning Reminder',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                          Visibility(
                            visible: _morningVisible,
                            child: Text(
                              _morningValue,
                              style: const TextStyle(
                                  color: Color(0xff0BB15D),
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: _morningButton,
                        onChanged: (bool value) {
                          setState(() {
                            _morningButton = !_morningButton;
                            if (_morningButton != false) {
                              _morningVisible = true;
                              debugPrint('true 작동');
                              _morningValue = "Scheduled for 08:00AM";
                            } else {
                              _morningVisible = false;
                              debugPrint('false 작동');
                              _morningValue = "";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Morning())));
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              width: double.infinity,
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Afternoon Reminder',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                          Visibility(
                            visible: _afternoonVisible,
                            child: Text(
                              _afternoonValue,
                              style: const TextStyle(
                                  color: Color(0xff0BB15D),
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: _afternoonButton,
                        onChanged: (bool value) {
                          setState(() {
                            _afternoonButton = !_afternoonButton;
                            if (_afternoonButton != false) {
                              _afternoonVisible = true;
                              debugPrint('true 작동');
                              _afternoonValue = "Scheduled for 12:00PM";
                            } else {
                              _afternoonVisible = false;
                              debugPrint('false 작동');
                              _afternoonValue = "";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Morning())));
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              width: double.infinity,
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Evening Reminder',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                          Visibility(
                            visible: _eveningVisible,
                            child: Text(
                              _eveningValue,
                              style: const TextStyle(
                                  color: Color(0xff0BB15D),
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: _eveningButton,
                        onChanged: (bool value) {
                          setState(() {
                            _eveningButton = !_eveningButton;
                            if (_eveningButton != false) {
                              _eveningVisible = true;
                              debugPrint('true 작동');
                              _eveningValue = "Scheduled for 06:00PM";
                            } else {
                              _eveningVisible = false;
                              debugPrint('false 작동');
                              _eveningValue = "";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Morning())));
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffEEEEEE),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              width: double.infinity,
              child: GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Night Reminder',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                          Visibility(
                            visible: _nightVisible,
                            child: Text(
                              _nightValue,
                              style: const TextStyle(
                                  color: Color(0xff0BB15D),
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: _nightButton,
                        onChanged: (bool value) {
                          setState(() {
                            _nightButton = !_nightButton;
                            if (_nightButton != false) {
                              debugPrint('true 작동');
                              _nightVisible = true;
                              _nightValue = "Scheduled for 10:00PM";
                            } else {
                              debugPrint('false 작동');
                              _nightVisible = false;
                              _nightValue = "";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Morning())));
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
