import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/ble_singleton.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/setting_page.dart';

class MyDevicePage extends StatefulWidget {
  const MyDevicePage({Key? key}) : super(key: key);

  @override
  State<MyDevicePage> createState() => _MyDevicePageState();
}

class _MyDevicePageState extends State<MyDevicePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyDeviceAppbar(),
      body: MyNotConnectedBody(),
    );
  }
}

class MyDeviceAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyDeviceAppbar({Key? key}) : super(key: key);

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
        margin: appbarleadingMargin,
        child: appbarIconButton(context),
      ),
      title: appbarTitle(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          color: const Color(0xffEEEEEE),
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

  String connectText = "Not connected";

  @override
  void initState() {
    super.initState();

    if (BleSingleton().isConnected) {
      _isVisible = false;
      connectText = "Connected";
    } else {
      _isVisible = true;
      connectText = "Not connected";
    }
  }

  void delay() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        _isConnected = true;
        connectText = "Connected";
      });
    });
  }

  void connect() {
    _isConnecting = !_isConnecting;
    if (_isConnecting == true) {
      setState(() {
        connectText = "Connecting...";
      });
      delay();
    } else {
      setState(() {
        connectText = "Not connected";
      });
    }
  }

  Row deviceConnect() {
    final image = Image.asset(
      "assets/images/lymphowear_image.png",
      fit: BoxFit.fill,
    );

    const loading = CupertinoActivityIndicator(
      radius: 12,
      animating: true,
    );

    final connectButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: dialogButtonPadding,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Color(0xffED711A)),
      ),
      onPressed: () {
        connect();
        _isVisible = false;
        _isLoading = true;
      },
      child: const Text(
        'Connect',
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xffED711A)),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(52, 16, 0, 16),
          child: image,
        ),
        const Spacer(),
        Visibility(
          visible: _isLoading,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: loading,
          ),
        ),
        Column(
          children: [
            Container(
              margin: zeroMargin,
              child: Text(
                connectText,
                style: const TextStyle(
                  color: Color(0xff616161),
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                margin: const EdgeInsets.fromLTRB(14, 8, 0, 0),
                child: connectButton,
              ),
            ),
            Visibility(
              visible: _isConnected,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 45, 0),
                child: SvgPicture.asset(
                  "assets/images/battery_20%.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Container(width: 52),
      ],
    );
  }

  static const divider = Divider(
    height: 1,
    color: Color(0xffE0E0E0),
  );

  ListTile modelName() {
    return ListTile(
      title: Container(
        margin: listTileTitleMargin,
        child: Text(
          'Model name',
          style: firmwareText,
        ),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: Text(
          "LymphoWear",
          style: modebodyText,
        ),
      ),
    );
  }

  ListTile modelNumber() {
    return ListTile(
      title: Container(
        margin: listTileTitleMargin,
        child: Text(
          'Model number',
          style: firmwareText,
        ),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: Text(
          "LW-100",
          style: modebodyText,
        ),
      ),
    );
  }

  ListTile serialNumber() {
    return ListTile(
      title: Container(
        margin: listTileTitleMargin,
        child: Text(
          'Serial number',
          style: firmwareText,
        ),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: Text(
          BleSingleton().serialNumber(),
          style: modebodyText,
        ),
      ),
    );
  }

  ListTile version() {
    return ListTile(
      title: Container(
        margin: listTileTitleMargin,
        child: Text(
          'Version',
          style: firmwareText,
        ),
      ),
      tileColor: Colors.white,
      trailing: Container(
        margin: zeroMargin,
        child: Text(
          "1.1.1",
          style: modebodyText,
        ),
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
          Container(
            color: const Color(0xffF3F3F3),
            child: deviceConnect(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: modelName(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: modelNumber(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: serialNumber(),
          ),
          divider,
          Container(
            color: Colors.white,
            child: version(),
          ),
          divider,
          const Spacer(),
          Container(
            margin: bodyMargin,
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

  static const buttonText = Text(
    'Delete device',
    style: TextStyle(
      color: Color(0xff757575),
      fontSize: 16,
      fontWeight: semiBold,
    ),
  );

  @override
  State<MyNotConnectedBottomButton> createState() =>
      _MyNotConnectedBottomButtonState();
}

class _MyNotConnectedBottomButtonState
    extends State<MyNotConnectedBottomButton> {
  final iconImage = SvgPicture.asset(
    "assets/icons/ic_trash.svg",
    fit: BoxFit.fill,
    color: const Color(0xff757575),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDeviceDeleteDialog(context);
      },
      icon: iconImage,
      label: MyNotConnectedBottomButton.buttonText,
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: const Color(0xffE0E0E0),
      ),
    );
  }

  Future showDeviceDeleteDialog(context) async {
    const title = Text(
      'Delete to this device',
      style: TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: regular,
      ),
    );

    ElevatedButton cancelButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(112, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          side: const BorderSide(width: 1.0, color: Color(0xff757575)),
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff757575),
          textStyle: dialogButtonText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      );
    }

    ElevatedButton deleteButton() {
      return ElevatedButton.icon(
        icon: SvgPicture.asset(
          "assets/icons/ic_delete.svg",
          fit: BoxFit.fill,
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(112, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          side: const BorderSide(
            width: 1.0,
            color: Color(0xffBB0000),
          ),
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xffBB0000),
          textStyle: dialogButtonText,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => const SettingPage()),
            ),
          );
        },
        label: const Text('Delete'),
      );
    }

    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Center(
        child: Container(
          margin: zeroMargin,
          child: title,
        ),
      ),
      actions: [
        Container(
          margin: zeroMargin,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 16, 4, 24),
                child: cancelButton(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 16, 10, 24),
                child: deleteButton(),
              ),
            ],
          ),
        ),
      ],
    );

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: alertDialog,
        );
      },
    );
  }
}
