import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/widgets/adddevice_contents_success_widget.dart';
import 'package:lymphowear_remote_app/widgets/adddevice_contents_widget.dart';
import 'package:lymphowear_remote_app/widgets/noticecontents_widget.dart';

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
            SizedBox(height: pageSize.height * 0.05),
            SizedBox(
              width: double.infinity,
              height: pageSize.height * 0.5,
              child: PageView(
                controller: pageController,
                children: const [
                  NoticeContentsWidget(),
                  AdviceContentsWidget(),
                  AdviceContentsSucessWidget(),
                ],
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
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.ease);
                  },
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
