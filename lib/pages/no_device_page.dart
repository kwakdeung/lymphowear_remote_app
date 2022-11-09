import 'package:flutter/material.dart';

import '../constants.dart';

class NoDevicePage extends StatefulWidget {
  const NoDevicePage({
    Key? key,
    required this.appbarIcon,
    required this.logoTitle,
    required this.leadingButton,
    required this.routePairing,
  }) : super(key: key);
  final Widget logoTitle, appbarIcon, leadingButton, routePairing;

  @override
  State<NoDevicePage> createState() => _NoDevicePageState();
}

class _NoDevicePageState extends State<NoDevicePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: NoneAppbar(
        logoTitle: widget.logoTitle,
        appbarIcon: widget.appbarIcon,
        leadingButton: widget.leadingButton,
      ),
      body: NoDeviceBody(
        routePairing: widget.routePairing,
      ),
    );
  }
}

class NoneAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NoneAppbar(
      {Key? key,
      required this.appbarIcon,
      required this.logoTitle,
      required this.leadingButton})
      : super(key: key);
  final Widget logoTitle, appbarIcon, leadingButton;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: appbarleadingMargin,
        child: leadingButton,
      ),
      automaticallyImplyLeading: false,
      title: Container(
        margin: logoMargin,
        child: logoTitle,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          color: const Color(0xffEEEEEE),
          height: 2.0,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: appbarIconbuttonMargin,
          child: appbarIcon,
        ),
      ],
    );
  }
}

class NoDeviceBody extends StatelessWidget {
  NoDeviceBody({Key? key, required this.routePairing}) : super(key: key);
  final Widget routePairing;

  Text title(context) {
    return Text(
      "There’s no device connected.",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Text content(context) {
    return Text(
      "Press the button and\nconnect to the device.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  final image = Image.asset(
    'assets/images/none_image.png',
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: const Color(0xffF3F3F3),
        child: Container(
          margin: bodyMargin,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 56, 0, 15),
                child: title(context),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: content(context),
              ),
              Container(
                margin: zeroMargin,
                child: image,
              ),
              const Spacer(),
              Container(
                margin: zeroMargin,
                width: double.infinity,
                child: NoDeviceBottomButton(
                  routePairing: routePairing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoDeviceBottomButton extends StatelessWidget {
  const NoDeviceBottomButton({Key? key, required this.routePairing})
      : super(key: key);
  final Widget routePairing;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: Color(0xffED711A),
      ),
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xffED711A),
        side: const BorderSide(color: Color(0xffED711A)),
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => routePairing),
          ),
        );
      },
      label: const Text('Add Device'),
    );
  }
}
