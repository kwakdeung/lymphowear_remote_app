import 'package:flutter/widgets.dart';
import 'package:lymphowear_remote_app/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.isDesktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.isTablet;
  }

  return DeviceScreenType.isMobile;
}
