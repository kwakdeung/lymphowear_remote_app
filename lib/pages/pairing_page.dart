import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/pages/contents/notice_contents.dart';

import '../models/notice_model.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  late PageController pageController;
  int pageIndex = 0;

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
            SizedBox(height: pageSize.height * 0.1),
            SizedBox(
              width: double.infinity * 0.5,
              height: pageSize.height * 0.5,
              child: PageView.builder(
                controller: pageController,
                itemCount: noticeData.length,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) =>
                    NoticeContents(
                  image: noticeData[index].image,
                  instruction: noticeData[index].instruction,
                  detail: noticeData[index].detail,
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 50,
                width: pageSize.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {},
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
