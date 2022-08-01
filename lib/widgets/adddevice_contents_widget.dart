import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/models/add_device_model.dart';
import 'package:lymphowear_remote_app/pages/contents/adddevice_contents.dart';

class AdviceContentsWidget extends StatefulWidget {
  const AdviceContentsWidget({Key? key}) : super(key: key);

  @override
  State<AdviceContentsWidget> createState() => _AdviceContentsWidgetState();
}

class _AdviceContentsWidgetState extends State<AdviceContentsWidget> {
  late PageController pageController;
  @override
  Widget build(BuildContext context) {
    pageController = PageController();
    return PageView.builder(
      controller: pageController,
      itemCount: adddeviceData.length,
      onPageChanged: (index) {
        setState(() {
          // pageIndex = index;
        });
      },
      itemBuilder: (BuildContext context, int index) => AddDeviceContents(
        name: adddeviceData[index].name,
        model: adddeviceData[index].model,
        loading: adddeviceData[index].loading,
      ),
    );
  }
}
