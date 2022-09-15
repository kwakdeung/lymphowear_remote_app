import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class MyNotConnected extends StatefulWidget {
  const MyNotConnected({Key? key}) : super(key: key);

  @override
  State<MyNotConnected> createState() => _MyNotConnectedState();
}

class _MyNotConnectedState extends State<MyNotConnected> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyNotConnectedAppbar(),
      body: MyNotConnectedBody(),
    );
  }
}

class MyNotConnectedAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const MyNotConnectedAppbar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbariconbutton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'My Device',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: appbariconbutton(context),
      ),
      title: appbarTitle(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          color: Colors.grey[200],
          height: 2.0,
        ),
      ),
      centerTitle: true,
    );
  }
}

class MyNotConnectedBody extends StatefulWidget {
  const MyNotConnectedBody({Key? key}) : super(key: key);

  @override
  State<MyNotConnectedBody> createState() => _MyNotConnectedBodyState();
}

class _MyNotConnectedBodyState extends State<MyNotConnectedBody> {
  bool _isConnecting = false;
  bool _isVisible = true;
  bool _isLoading = false;
  bool _isConnected = false;

  String connecttext = "Not connected";

  var connected = "CONNECTED";

  connecting() {
    _isConnecting = !_isConnecting;
    if (_isConnecting == true) {
      setState(() {
        connecttext = "Connecting...";
      });
      Future.delayed(const Duration(seconds: 3), () {
        debugPrint("Future.delayed 테스트");
        setState(() {
          debugPrint("Future.delayed 결과");
          _isLoading = false;
          _isConnected = true;
          connecttext = "Connected";
        });
      });
    } else {
      setState(() {
        connecttext = "Not connected";
      });
    }
  }

  Row deviceconnect() {
    final image = Image.asset(
      "assets/images/lymphowear_image.png",
      fit: BoxFit.fill,
    );

    const loading = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );

    final connectbutton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
        primary: Colors.white,
        side: const BorderSide(color: Color(0xff008A40)),
      ),
      onPressed: () {
        connecting();
        _isVisible = false;
        _isLoading = true;
      },
      child: const Text(
        'Connect',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff008A40)),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 24, 16),
          child: image,
        ),
        Visibility(
          visible: _isLoading,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: loading,
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(0.0),
              child: Text(
                connecttext,
                style: const TextStyle(
                  color: Color(0xff616161),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                margin: const EdgeInsets.only(left: 14, top: 8),
                child: connectbutton,
              ),
            ),
            Visibility(
              visible: _isConnected,
              child: Container(
                  margin: const EdgeInsets.only(right: 45, top: 8),
                  child: SvgPicture.asset("assets/images/battery_20%.svg")),
            ),
          ],
        ),
      ],
    );
  }

  static const divider = Divider(
    height: 1,
    color: Color(0xffE0E0E0),
  );

  ListTile modelname() {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.only(top: 14, bottom: 14),
        child: const Text('Model name',
            style: TextStyle(
                color: Color(0xff757575),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: const EdgeInsets.all(0.0),
        child: const Text("LymphoWear",
            style: TextStyle(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  ListTile modelnumber() {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.only(top: 14, bottom: 14),
        child: const Text('Model number',
            style: TextStyle(
                color: Color(0xff757575),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: const EdgeInsets.all(0.0),
        child: const Text("LW-100",
            style: TextStyle(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  ListTile serialnumber() {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.only(top: 14, bottom: 14),
        child: const Text('Serial number',
            style: TextStyle(
                color: Color(0xff757575),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: const EdgeInsets.all(0.0),
        child: const Text("ABCDEFG1234",
            style: TextStyle(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  ListTile version() {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.only(top: 14, bottom: 14),
        child: const Text('Version',
            style: TextStyle(
                color: Color(0xff757575),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: const EdgeInsets.all(0.0),
        child: const Text("1.1.1",
            style: TextStyle(
                color: Color(0xff212121),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(color: const Color(0xffF3F3F3), child: deviceconnect()),
          divider,
          Container(
            color: Colors.white,
            child: modelname(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: modelnumber(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: serialnumber(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: version(),
          ),
          divider,
          const Spacer(),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
            width: double.infinity,
            child: const MyNotConnectedBottomButton(),
          ),
        ],
      ),
    );
  }
}

class MyNotConnectedBottomButton extends StatefulWidget {
  const MyNotConnectedBottomButton({Key? key}) : super(key: key);

  static const buttontext = Text(
    'Delete device',
    style: TextStyle(
      color: Color(0xff757575),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  State<MyNotConnectedBottomButton> createState() =>
      _MyNotConnectedBottomButtonState();
}

class _MyNotConnectedBottomButtonState
    extends State<MyNotConnectedBottomButton> {
  final iconimage = SvgPicture.asset(
    "assets/icons/ic_trash.svg",
    color: const Color(0xff757575),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showProgressDialog(context);
      },
      icon: iconimage,
      label: MyNotConnectedBottomButton.buttontext,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        primary: const Color(0xffE0E0E0),
      ),
    );
  }

  Future showProgressDialog(context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const Text(
                  'Delete to this device',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(0.0),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 16, 4, 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          side:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          primary: Colors.white,
                          onPrimary: const Color(0xff757575),
                          textStyle: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                      child: ElevatedButton.icon(
                        icon: SvgPicture.asset("assets/icons/ic_delete.svg"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(112, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          side: const BorderSide(
                              width: 1.0, color: Color(0xffBB0000)),
                          primary: Colors.white,
                          onPrimary: const Color(0xffBB0000),
                          textStyle: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const SettingPage()),
                              ));
                        },
                        label: const Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
