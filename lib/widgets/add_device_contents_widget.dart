import 'package:flutter/material.dart';

import 'package:lymphowear_remote_app/models/add_device_model.dart';
import 'package:lymphowear_remote_app/pages/contents/add_device_contents.dart';

class AdviceContentsWidget extends StatelessWidget {
  const AdviceContentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late PageController pageController;
    pageController = PageController();
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: adddeviceData.length,
      onPageChanged: (index) {},
      itemBuilder: (BuildContext context, int index) => AddDeviceContents(
        name: adddeviceData[index].name,
        model: adddeviceData[index].model,
        loading: adddeviceData[index].loading,
      ),
    );
  }
}
