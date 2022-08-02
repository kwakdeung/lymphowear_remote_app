import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/widgets/add_device_contents_success_widget.dart';
import 'package:lymphowear_remote_app/widgets/add_device_contents_widget.dart';
import 'package:lymphowear_remote_app/widgets/notice_contents_widget.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  bool isButtonActive = true;
  late PageController pageController;
  int pageIndex = 0;
  int curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Device',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              width: double.infinity,
              height: pageSize.height * 0.55,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
              ),
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const <Widget>[
                  NoticeContentsWidget(),
                  AdviceContentsWidget(),
                  AdviceContentsSucessWidget()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(pageSize.width * 0.75, 50),
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shadowColor: Colors.red,
                ),
                onPressed: isButtonActive
                    ? () {
                        setState(() => isButtonActive = false);
                        pageController.nextPage(
                            duration: const Duration(microseconds: 1000),
                            curve: Curves.ease);
                      }
                    : null,
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
