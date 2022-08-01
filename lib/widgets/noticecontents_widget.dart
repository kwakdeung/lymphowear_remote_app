import 'package:flutter/material.dart';
import 'package:lymphowear_remote_app/models/notice_model.dart';
import 'package:lymphowear_remote_app/pages/contents/notice_contents.dart';

class NoticeContentsWidget extends StatefulWidget {
  const NoticeContentsWidget({Key? key}) : super(key: key);

  @override
  State<NoticeContentsWidget> createState() => _NoticeContentsWidgetState();
}

class _NoticeContentsWidgetState extends State<NoticeContentsWidget> {
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    return PageView.builder(
      controller: pageController,
      itemCount: noticeData.length,
      onPageChanged: (index) {
        setState(() {
          // pageIndex = index;
        });
      },
      itemBuilder: (BuildContext context, int index) => NoticeContents(
        image: noticeData[index].image,
        instruction: noticeData[index].instruction,
        detail: noticeData[index].detail,
      ),
    );
  }
}
